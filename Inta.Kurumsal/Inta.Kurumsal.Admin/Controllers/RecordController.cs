using Inta.EntityFramework.Core.Model;
using Inta.Framework.Extension.Common;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class RecordController : Controller
    {
        private RecordManager recordManager = null;
        private CategoryManager categoryManager = null;
        private GeneralSettingsManager settingsManager = null;

        private static int SelectedCategoryId = 0;


        public RecordController()
        {
            recordManager = new RecordManager();
            categoryManager = new CategoryManager();
            settingsManager = new GeneralSettingsManager();
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
            Record content = new Record();
            if (id.HasValue)
                content = recordManager.GetById(id ?? 0).Data;

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
            var category = categoryManager.GetById(id);
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

            var tree = categoryManager.Find(v => v.CategoryId == CategoryId && (id == null || id != v.Id));

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
            var category = categoryManager.GetById(id);
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

            var tree = categoryManager.Find(v => v.CategoryId == CategoryId);

            return Json(tree.Data);
        }
        public ActionResult GetCategoryName(int CategoryId)
        {
            List<SelectListItem> categoryTree = new List<SelectListItem>();

            var tree = recordManager.GetById(CategoryId);

            return Json(tree.Data);
        }


        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            var result = recordManager.Find()?.Data;
            if (SelectedCategoryId != 0)
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
        public ActionResult Save(Record request, IFormFile Image)
        {
            StringManager stringManager = new StringManager();
            var content = recordManager.GetById(request.Id);
            DataResult<Record> data = null;
            if (Image != null)
            {
                var settings = settingsManager.Find().Data.FirstOrDefault();
                //string filePath = ConfigurationManager.AppSettings["ImageUpload"].ToString();
                string filePath = "";

                if (settings != null)
                    request.Image = ImageManager.ImageUploadDoubleCopy(Image, filePath, settings.ContentImageSmallWidth, settings.ContentImageBigWidth);
                else
                    request.Image = ImageManager.ImageUploadDoubleCopy(Image, filePath, 100, 500);
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
                data = recordManager.Save(request);
            }
            else
            {
                data = recordManager.Update(request);
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
                    Record content = recordManager.GetById(Convert.ToInt32(item)).Data;
                    recordManager.Delete(content);
                }
            }

            return Json("OK");
        }

        public ActionResult DeleteImage(int id)
        {
            Record content = recordManager.GetById(id).Data;
            content.Image = null;
            recordManager.Update(content);

            return Json("OK");

        }

        [HttpPost]
        public ActionResult ListUpdate(List<Record> listData)
        {
            foreach (var item in listData)
            {
                var content = recordManager.GetById(item.Id).Data;
                if (content != null)
                {
                    content.OrderNumber = item.OrderNumber;
                    recordManager.Update(content);

                }
            }

            return Json("OK");
        }
    }
}