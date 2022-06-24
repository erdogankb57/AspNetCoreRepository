using Inta.EntityFramework.Core.DynamicExpression;
using Inta.EntityFramework.Core.Model;
using Inta.Framework.Extension.Common;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class CategoryController : BaseController
    {
        private readonly ICategoryService _categoryService = null;
        private IPageTypeService _pageTypeService = null;
        private IFormGroupService _formGroupService = null;
        private IGeneralSettingsService _settingsService = null;
        private IAuthenticationData _authenticationData = null;
        private IConfiguration _configuration = null;

        private static int SelectedCategoryId = 0;


        public CategoryController(ICategoryService categoryService, IPageTypeService pageTypeService, IFormGroupService formGroupService, IGeneralSettingsService settingsService, IAuthenticationData authenticationData, IConfiguration configuration)
        {
            _categoryService = categoryService;
            _pageTypeService = pageTypeService;
            _formGroupService = formGroupService;
            _settingsService = settingsService;
            _authenticationData = authenticationData;
            _configuration = configuration;
        }

        public ActionResult Index()
        {
            if (!string.IsNullOrEmpty(HttpContext.Request.Query["CategoryId"]))
            {
                ViewBag.SelectedCategoryId = HttpContext.Request.Query["CategoryId"];
                SelectedCategoryId = Convert.ToInt32(HttpContext.Request.Query["CategoryId"]);
            }
            else
            {
                SelectedCategoryId = 0;
                ViewBag.SelectedCategoryId = 0;
            }

            return View();
        }

        [HttpGet]
        public ActionResult GetPageType(int Id)
        {
            var data = _pageTypeService.GetById(Id);
            return Json(data);
        }
        public ActionResult Add(int? id, bool? partial = false)
        {

            CategoryDto category = new CategoryDto { IsActive = true };
            List<SelectListItem> list = new List<SelectListItem>();
            List<SelectListItem> categoryTree = new List<SelectListItem>();

            if (id == null)
            {
                if (!string.IsNullOrEmpty(HttpContext.Request.Query["CategoryId"]))
                {
                    ViewBag.SelectedCategoryId = HttpContext.Request.Query["CategoryId"];
                    SelectedCategoryId = Convert.ToInt32(HttpContext.Request.Query["CategoryId"]);
                }
                else
                {
                    SelectedCategoryId = 0;
                    ViewBag.SelectedCategoryId = 0;
                }
            }

            var pageTypes = _pageTypeService.Find();
            list.Add(new SelectListItem { Text = "Seçiniz", Value = "" });
            list.AddRange(pageTypes.Data.Select(s => new SelectListItem { Text = s.Name, Value = s.Id.ToString() }).ToList());
            ViewBag.pageTypes = list;

            List<SelectListItem> formGroup = new List<SelectListItem>();
            formGroup.Add(new SelectListItem { Text = "Seçiniz", Value = "" });

            var formGroupData = _formGroupService.Find(v => v.LanguageId == _authenticationData.LanguageId)?.Data?.Select(s => new SelectListItem { Text = s.Name, Value = s.Id.ToString() })?.ToList();
            formGroup.AddRange(formGroupData);

            ViewBag.formGroup = formGroup;

            if (id.HasValue)
            {
                category = _categoryService.GetById(id ?? 0).Data;
                ViewBag.SelectedCategoryId = category.CategoryId;
            }
            if (partial.Value)
                return View("_CategoryAddPartial", category);
            else
                return View("Add", category);

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

        public ActionResult GetAllTopCategorySearchLink(int id)
        {
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

        [HttpGet]
        public ActionResult GetCategoryTree(int CategoryId, int? id)
        {
            List<SelectListItem> categoryTree = new List<SelectListItem>();

            var tree = _categoryService.Find(v => v.LanguageId == _authenticationData.LanguageId && v.CategoryId == CategoryId && v.CanSubCategoryBeAdded == true && (id == null || id != v.Id));

            return Json(tree.Data);
        }
        public ActionResult GetCategoryName(int CategoryId)
        {
            List<SelectListItem> categoryTree = new List<SelectListItem>();

            var tree = _categoryService.GetById(CategoryId);

            return Json(tree.Data);
        }


        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
       
            var result = _categoryService.Find(v=> v.LanguageId == _authenticationData.LanguageId).Data;

            if (!string.IsNullOrEmpty(request.SearchParameters[0].Value))
                result = result.Where(v => v.CategoryId == Convert.ToInt32(request.SearchParameters[0].Value)).ToList();
            else
                result = result.Where(v => v.CategoryId == 0).ToList();

            if (!string.IsNullOrEmpty(request.SearchParameters[1].Value))
                result = result.Where(v => v.Name.Contains(request.SearchParameters[1].Value, StringComparison.OrdinalIgnoreCase)).ToList();

            if (request.search != null && request.search.value != null)
                result = result.Where(v => v.Name.ToLower().Contains(request.search.value.ToLower())).ToList();

            if (request.order[0].dir == "asc")
            {
                if (request.order[0].column == 1)
                    result = result.OrderBy(o => o.Id).ToList();
                else if (request.order[0].column == 2)
                    result = result.OrderBy(o => o.Name).ToList();
                else if (request.order[0].column == 3)
                    result = result.OrderBy(o => o.OrderNumber).ToList();
            }
            else
            {
                if (request.order[0].column == 1)
                    result = result.OrderByDescending(o => o.Id).ToList();
                else if (request.order[0].column == 2)
                    result = result.OrderByDescending(o => o.Name).ToList();
                else if (request.order[0].column == 3)
                    result = result.OrderByDescending(o => o.OrderNumber).ToList();
            }



            return Json(new { data = result.Skip(request.start).Take(request.length).ToList(), recordsTotal = result.Count(), recordsFiltered = result.Count() });
        }

        [HttpPost]
        public ActionResult Save(CategoryDto request, IFormFile Image)
        {
            StringManager stringManager = new StringManager();
            DataResult<CategoryDto> data = null;
            if (Image != null)
            {
                var settings = _settingsService.Find().Data.FirstOrDefault();
                string filePath = Directory.GetCurrentDirectory().ToString() + _configuration.GetSection("ImagesUpload").Value.ToString();

                if (settings != null)
                    request.Image = ImageManager.ImageUploadDoubleCopy(Image, settings.CategoryImageSmallWidth, settings.CategoryImageBigWidth, filePath);
                else
                    request.Image = ImageManager.ImageUploadDoubleCopy(Image, 100, 500, filePath);
            }

            if (String.IsNullOrEmpty(request.CategoryUrl))
                request.CategoryUrl = stringManager.TextUrlCharReplace(request.Name);
            else
                request.CategoryUrl = stringManager.TextUrlCharReplace(request.CategoryUrl);


            if (request.Id == 0)
            {
                request.LanguageId = _authenticationData.LanguageId;
                request.SystemUserId = ViewBag.SystemUserId;
                request.CanSubCategoryBeAdded = true;
                request.CanBeDeleted = true;
                request.OrderNumber = 0;

                data = _categoryService.Save(request);
            }
            else
            {
                var entity = _categoryService.GetById(request.Id);
                if (Image == null)
                    request.Image = entity.Data.Image;

                data = _categoryService.Update(request);
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
                    CategoryDto category = _categoryService.GetById(Convert.ToInt32(item)).Data;
                    if (category.CanBeDeleted)
                        _categoryService.Delete(category);
                }
            }

            return Json("OK");
        }
        public ActionResult DeleteImage(int id)
        {
            CategoryDto category = _categoryService.GetById(id).Data;
            category.Image = null;
            _categoryService.Update(category);

            return Json("OK");

        }

        [HttpPost]
        public ActionResult ListUpdate(List<CategoryDto> listData)
        {
            foreach (var item in listData)
            {
                var category = _categoryService.GetById(item.Id).Data;
                if (category != null)
                {
                    category.OrderNumber = item.OrderNumber;
                    _categoryService.Update(category);

                }
            }

            return Json("OK");
        }
    }
}