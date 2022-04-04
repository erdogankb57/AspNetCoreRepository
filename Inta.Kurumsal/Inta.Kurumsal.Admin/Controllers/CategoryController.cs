using Inta.EntityFramework.Core.Model;
using Inta.Framework.Extension.Common;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class CategoryController : BaseController
    {
        private CategoryManager manager = null;
        private PageTypeManager pageType = null;
        private FormGroupManager formGroupManager = null;
        private GeneralSettingsManager settingsManager = null;

        private static int SelectedCategoryId = 0;


        public CategoryController()
        {
            manager = new CategoryManager();
            pageType = new PageTypeManager();
            formGroupManager = new FormGroupManager();
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

        [HttpGet]
        public ActionResult GetPageType(int Id)
        {
            var data = pageType.GetById(Id);
            return Json(data);
        }
        public ActionResult Add(int? id, bool? partial = false)
        {

            Category category = new Category { IsActive = true };
            List<SelectListItem> list = new List<SelectListItem>();
            List<SelectListItem> categoryTree = new List<SelectListItem>();

            if (id == null)
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
            }

            var pageTypes = pageType.Find();
            list.Add(new SelectListItem { Text = "Seçiniz", Value = "" });
            list.AddRange(pageTypes.Data.Select(s => new SelectListItem { Text = s.Name, Value = s.Id.ToString() }).ToList());
            ViewBag.pageTypes = list;

            List<SelectListItem> formGroup = new List<SelectListItem>();
            formGroup.Add(new SelectListItem { Text = "Seçiniz", Value = "" });

            var formGroupData = formGroupManager.Find()?.Data?.Select(s => new SelectListItem { Text = s.Name, Value = s.Id.ToString() })?.ToList();
            formGroup.AddRange(formGroupData);

            ViewBag.formGroup = formGroup;


            var tree = manager.GetCategoryWithTree();


            if (id.HasValue)
            {
                category = manager.GetById(id ?? 0).Data;
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
            var category = manager.GetById(id);
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
            var category = manager.GetById(id);
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

            var tree = manager.Find(v => v.CategoryId == CategoryId && (id == null || id != v.Id));

            return Json(tree.Data);
        }

        [HttpGet]
        public ActionResult GetCategoryTree(int CategoryId, int? id)
        {
            List<SelectListItem> categoryTree = new List<SelectListItem>();

            var tree = manager.Find(v => v.CategoryId == CategoryId && v.CanSubCategoryBeAdded == true && (id == null || id != v.Id));

            return Json(tree.Data);
        }
        public ActionResult GetCategoryName(int CategoryId)
        {
            List<SelectListItem> categoryTree = new List<SelectListItem>();

            var tree = manager.GetById(CategoryId);

            return Json(tree.Data);
        }


        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            var result = manager.Find().Data;

            if (!string.IsNullOrEmpty(request.columns[0].search.value))
                result = result.Where(v => v.CategoryId == Convert.ToInt32(request.columns[0].search.value)).ToList();

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
        public ActionResult Save(Category request, IFormFile Image)
        {
            StringManager stringManager = new StringManager();
            DataResult<Category> data = null;
            FileInfo file = null;
            if (Image != null)
            {
                var settings = settingsManager.Find().Data.FirstOrDefault();
                file = new FileInfo(Image.FileName);

                //string filePath = ConfigurationManager.AppSettings["ImageUpload"].ToString();
                string filePath = "";

                if (settings != null)
                    request.Image = ImageManager.ImageUploadDoubleCopy(Image, filePath, settings.CategoryImageSmallWidth, settings.CategoryImageBigWidth);
                else
                    request.Image = ImageManager.ImageUploadDoubleCopy(Image, filePath, 100, 500);
            }

            if (String.IsNullOrEmpty(request.CategoryUrl))
                request.CategoryUrl = stringManager.TextUrlCharReplace(request.Name);
            else
                request.CategoryUrl = stringManager.TextUrlCharReplace(request.CategoryUrl);


            if (request.Id == 0)
            {
                request.LanguageId = ViewBag.LanguageId;
                request.SystemUserId = ViewBag.SystemUserId;
                request.CanSubCategoryBeAdded = true;
                request.CanBeDeleted = true;
                request.OrderNumber = 0;

                data = manager.Save(request);
            }
            else
            {
                var entity = manager.GetById(request.Id);
                if (Image == null)
                    request.Image = entity.Data.Image;

                data = manager.Update(request);
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
                    Category category = manager.GetById(Convert.ToInt32(item)).Data;
                    if (category.CanBeDeleted)
                        manager.Delete(category);
                }
            }

            return Json("OK");
        }
        public ActionResult DeleteImage(int id)
        {
            Category category = manager.GetById(id).Data;
            category.Image = null;
            manager.Update(category);

            return Json("OK");

        }

        [HttpPost]
        public ActionResult ListUpdate(List<Category> listData)
        {
            foreach (var item in listData)
            {
                var category = manager.GetById(item.Id).Data;
                if (category != null)
                {
                    category.OrderNumber = item.OrderNumber;
                    manager.Update(category);

                }
            }

            return Json("OK");
        }
    }
}