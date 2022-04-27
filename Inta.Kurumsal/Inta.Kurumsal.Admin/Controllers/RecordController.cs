using Inta.EntityFramework.Core.Model;
using Inta.Framework.Extension.Common;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class RecordController : BaseController
    {
        private IRecordService _recordService = null;
        private ICategoryService _categoryService = null;
        private IGeneralSettingsService _settingsService = null;
        private IAuthenticationData _authenticationData = null;
        private static int SelectedCategoryId = 0;


        public RecordController(IRecordService recordService, ICategoryService categoryService, IGeneralSettingsService settingsService, IAuthenticationData authenticationData)
        {
            _recordService = recordService;
            _categoryService = categoryService;
            _settingsService = settingsService;
            _authenticationData = authenticationData;
        }

        public ActionResult Index()
        {
            if (!string.IsNullOrEmpty(HttpContext.Request.Query["SearchId"]))
            {
                ViewBag.SelectedCategoryId = HttpContext.Request.Query["SearchId"];
                SelectedCategoryId = Convert.ToInt32(HttpContext.Request.Query["SearchId"]);
            }
            else
            {
                SelectedCategoryId = 0;
                ViewBag.SelectedCategoryId = 0;
            }
            return View();
        }
        public ActionResult Add(int? id, bool? partial = false)
        {
            RecordDto content = new RecordDto();
            if (id.HasValue)
                content = _recordService.GetById(id ?? 0).Data;

            if (!string.IsNullOrEmpty(HttpContext.Request.Query["SearchId"]))
            {
                ViewBag.SelectedCategoryId = HttpContext.Request.Query["SearchId"];
                SelectedCategoryId = Convert.ToInt32(HttpContext.Request.Query["SearchId"]);
            }
            else
            {
                SelectedCategoryId = content.CategoryId;
                ViewBag.SelectedCategoryId = content.CategoryId;
            }

            if (partial.Value)
                return View("_RecordAddPartial", content);
            else
                return View("Add", content);

        }

        public ActionResult GetAllTopCategorySearchLink(int id)
        {
            SelectedCategoryId = id;
            return Content(this.GetAllTopSearchCategory(id));
        }

        private string GetAllTopSearchCategory(int id)
        {
            string str = "";
            string name = "";
            var category = _categoryService.GetById(id);
            if (category?.Data?.CategoryId != null)
            {
                if (category?.Data?.CategoryId != 0)
                {
                    str = this.GetAllTopSearchCategory(category.Data.CategoryId).ToString() + "<a href='javascript:void(0)' onclick='GetAllTopCategorySearchLink(" + category.Data.Id + ")'>" + category.Data.Name + "</a> » ";
                }
                else
                    str = "<a href='javascript:void(0)' onclick='GetAllTopCategorySearchLink(" + category.Data.Id + ")'>" + str + category.Data.Name + "</a> » ";
            }
            return str;
        }

        [HttpGet]
        public ActionResult GetCategorySearchTree(int CategoryId, int? id)
        {
            List<SelectListItem> categoryTree = new List<SelectListItem>();

            var tree = _categoryService.Find(v => v.LanguageId == _authenticationData.LanguageId && v.CategoryId == CategoryId && (id == null || id != v.Id));

            return Json(tree.Data);
        }

        public ActionResult GetAllTopCategoryLink(int id)
        {
            return Content(this.GetAllTopCategory(id));
        }

        private string GetAllTopCategory(int id)
        {
            string str = "";
            string name = "";
            var category = _categoryService.GetById(id);
            if (category.Data.CategoryId != 0)
            {
                str = this.GetAllTopCategory(category.Data.CategoryId).ToString() + "<a href='javascript:void(0)' onclick='GetAllTopCategoryLink(" + category.Data.Id + ")'>" + category.Data.Name + "</a> » ";
            }
            else
                str = "<a href='javascript:void(0)' onclick='GetAllTopCategoryLink(" + category.Data.Id + ")'>" + str + category.Data.Name + "</a> » ";

            return str;
        }

        [HttpGet]
        public ActionResult GetCategoryTree(int CategoryId)
        {
            List<SelectListItem> categoryTree = new List<SelectListItem>();

            var tree = _categoryService.Find(v => v.LanguageId == _authenticationData.LanguageId && v.CategoryId == CategoryId);

            return Json(tree.Data);
        }
        public ActionResult GetCategoryName(int CategoryId)
        {
            List<SelectListItem> categoryTree = new List<SelectListItem>();

            var tree = _recordService.GetById(CategoryId);

            return Json(tree.Data);
        }


        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            var result = _recordService.Find(v => v.LanguageId == _authenticationData.LanguageId)?.Data;

            result = result?.Where(v => v.CategoryId == SelectedCategoryId)?.ToList();
            if (request.order[0].dir == "asc")
            {
                if (request.order[0].column == 1)
                    result = result?.OrderBy(o => o.Id)?.ToList();
                else if (request.order[0].column == 2)
                    result = result?.OrderBy(o => o.Name)?.ToList();
                else if (request.order[0].column == 3)
                    result = result?.OrderBy(o => o.OrderNumber)?.ToList();
            }
            else
            {
                if (request.order[0].column == 1)
                    result = result?.OrderByDescending(o => o.Id)?.ToList();
                else if (request.order[0].column == 2)
                    result = result?.OrderByDescending(o => o.Name)?.ToList();
                else if (request.order[0].column == 3)
                    result = result?.OrderByDescending(o => o.OrderNumber)?.ToList();
            }
            if (request.search != null && request.search.value != null)
                result = result?.Where(v => v.Name.ToLower().Contains(request.search.value.ToLower()))?.ToList();

            return Json(new { data = result?.Skip(request.start)?.Take(request.length)?.ToList(), recordsTotal = result?.Count() ?? 0, recordsFiltered = result?.Count() ?? 0 });
        }

        [HttpPost]
        public ActionResult Save(RecordDto request, IFormFile Image)
        {
            StringManager stringManager = new StringManager();
            var content = _recordService.GetById(request.Id);
            DataResult<RecordDto> data = null;
            if (Image != null)
            {
                var settings = _settingsService.Find().Data.FirstOrDefault();
                string filePath = "";

                if (settings != null)
                    request.Image = ImageManager.ImageUploadDoubleCopy(Image, settings.ContentImageSmallWidth, settings.ContentImageBigWidth);
                else
                    request.Image = ImageManager.ImageUploadDoubleCopy(Image, 100, 500);
            }
            else
            {
                if (content?.Data?.Image != null)
                    request.Image = content.Data.Image;
            }

            if (String.IsNullOrEmpty(request.RecordUrl))
                request.RecordUrl = stringManager.TextUrlCharReplace(request.Name);
            else
                request.RecordUrl = stringManager.TextUrlCharReplace(request.RecordUrl);



            if (request.Id == 0)
            {
                request.LanguageId = ViewBag.LanguageId;
                request.SystemUserId = ViewBag.SystemUserId;
                request.RecordDate = DateTime.Now;
                request.OrderNumber = 0;
                request.LanguageId = _authenticationData.LanguageId;
                data = _recordService.Save(request);
            }
            else
            {
                data = _recordService.Update(request);
            }

            return Json(data);
        }

        [HttpPost]
        public ActionResult Delete(string ids)
        {
            if (!String.IsNullOrEmpty(ids))
            {
                foreach (var item in ids.Split(','))
                {
                    RecordDto content = _recordService.GetById(Convert.ToInt32(item)).Data;
                    _recordService.Delete(content);
                }
            }

            return Json("OK");
        }

        public ActionResult DeleteImage(int id)
        {
            RecordDto content = _recordService.GetById(id).Data;
            content.Image = null;
            _recordService.Update(content);

            return Json("OK");

        }

        [HttpPost]
        public ActionResult ListUpdate(List<RecordDto> listData)
        {
            foreach (var item in listData)
            {
                var content = _recordService.GetById(item.Id).Data;
                if (content != null)
                {
                    content.OrderNumber = item.OrderNumber;
                    _recordService.Update(content);

                }
            }

            return Json("OK");
        }
    }
}