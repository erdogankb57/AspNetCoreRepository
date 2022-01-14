using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class PageTypeController : BaseController
    {
        private PageTypeManager manager = null;

        public PageTypeController()
        {
            manager = new PageTypeManager();
        }

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add(int? id)
        {
            PageType pageType = new PageType();

            if (id.HasValue)
                pageType = manager.GetById(id ?? 0).Data;

            return PartialView("Add", pageType);
        }


        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            var result = manager.Find().Data;
            if (request.order[0].dir == "asc")
            {
                if (request.order[0].column == 1)
                    result = result.OrderBy(o => o.Id).ToList();
                else if (request.order[0].column == 2)
                    result = result.OrderBy(o => o.Name).ToList();
                else if (request.order[0].column == 3)
                    result = result.OrderBy(o => o.ControllerName).ToList();
            }
            else
            {
                if (request.order[0].column == 1)
                    result = result.OrderByDescending(o => o.Id).ToList();
                else if (request.order[0].column == 2)
                    result = result.OrderByDescending(o => o.Name).ToList();
                else if (request.order[0].column == 3)
                    result = result.OrderByDescending(o => o.ControllerName).ToList();
            }
            if (request.search != null && request.search.value != null)
                result = result.Where(v => v.Name.ToLower().Contains(request.search.value.ToLower())).ToList();

            return Json(new { data = result.Skip(request.start).Take(request.length).ToList(), recordsTotal = result.Count(), recordsFiltered = result.Count() });
        }

        [HttpPost]
        public ActionResult Save(PageType request)
        {
            DataResult<PageType> data = null;

            if (request.Id == 0)
            {
                request.SystemUserId = ViewBag.SystemUserId;

                data = manager.Save(request);
            }
            else
            {
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
                    PageType pageType = manager.GetById(Convert.ToInt32(item)).Data;
                    manager.Delete(pageType);
                }
            }

            return Json("OK");
        }
    }
}