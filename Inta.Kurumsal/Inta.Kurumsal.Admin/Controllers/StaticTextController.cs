using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class StaticTextController : Controller
    {
        private StaticTextManager manager = null;

        public StaticTextController()
        {
            manager = new StaticTextManager();
        }

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add(int? id)
        {
            StaticText staticText = new StaticText();

            if (id.HasValue)
                staticText = manager.GetById(id ?? 0).Data;

            return PartialView("Add", staticText);
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
            }
            else
            {
                if (request.order[0].column == 1)
                    result = result.OrderByDescending(o => o.Id).ToList();
                else if (request.order[0].column == 2)
                    result = result.OrderByDescending(o => o.Name).ToList();
            }
            if (request.search != null && request.search.value != null)
                result = result.Where(v => v.Name.ToLower().Contains(request.search.value.ToLower())).ToList();

            return Json(new { data = result.Skip(request.start).Take(request.length).ToList(), recordsTotal = result.Count(), recordsFiltered = result.Count() });
        }

        [HttpPost]
        public ActionResult Save(StaticText request)
        {
            DataResult<StaticText> data = null;

            if (request.Id == 0)
            {
                request.SystemUserId = ViewBag.SystemUserId;
                request.RecordDate = DateTime.Now;
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
                    StaticText staticText = manager.GetById(Convert.ToInt32(item)).Data;
                    manager.Delete(staticText);
                }
            }

            return Json("OK");
        }
    }
}