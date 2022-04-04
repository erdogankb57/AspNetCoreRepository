using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class SystemActionController : BaseController
    {
        private SystemActionManager actionManager = null;
        private SystemMenuManager menuManager = null;
        public SystemActionController()
        {
            actionManager = new SystemActionManager();
            menuManager = new SystemMenuManager();
        }

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add(int? id)
        {
            SystemAction menuAction = new SystemAction();


            var systemMenus = menuManager.Find();
            List<SelectListItem> list = new List<SelectListItem>();
            list.Add(new SelectListItem { Text = "Seçiniz", Value = "" });
            list.AddRange(systemMenus.Data.Select(s => new SelectListItem { Text = s.Name, Value = s.Id.ToString() }).ToList());
            ViewBag.systemMenus = list;


            if (id.HasValue)
                menuAction = actionManager.GetById(id ?? 0).Data;

            return PartialView("Add", menuAction);
        }


        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            var result = actionManager.Find().Data;
            if (request.order[0].dir == "asc")
            {
                if (request.order[0].column == 1)
                    result = result.OrderBy(o => o.Id).ToList();
                else if (request.order[0].column == 2)
                    result = result.OrderBy(o => o.ControllerName).ToList();
                else if (request.order[0].column == 3)
                    result = result.OrderBy(o => o.ActionName).ToList();
            }
            else
            {
                if (request.order[0].column == 1)
                    result = result.OrderByDescending(o => o.Id).ToList();
                else if (request.order[0].column == 2)
                    result = result.OrderByDescending(o => o.ControllerName).ToList();
                else if (request.order[0].column == 3)
                    result = result.OrderByDescending(o => o.ActionName).ToList();
            }
            if (request.search != null && request.search.value != null)
                result = result.Where(v => v.ControllerName.ToLower().Contains(request.search.value.ToLower())).ToList();

            return Json(new { data = result.Skip(request.start).Take(request.length).ToList(), recordsTotal = result.Count(), recordsFiltered = result.Count() });
        }

        [HttpPost]
        public ActionResult Save(SystemAction request)
        {
            DataResult<SystemAction> data = null;

            if (request.Id == 0)
            {
                data = actionManager.Save(request);
            }
            else
            {
                data = actionManager.Update(request);
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
                    SystemAction menuAction = actionManager.GetById(Convert.ToInt32(item)).Data;
                    actionManager.Delete(menuAction);
                }
            }

            return Json("OK");
        }
    }
}