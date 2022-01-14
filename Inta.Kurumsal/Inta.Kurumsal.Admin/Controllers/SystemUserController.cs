using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class SystemUserController : Controller
    {
        private SystemUserManager manager = null;
        private SystemRoleManager roleManager = null;

        public SystemUserController()
        {
            manager = new SystemUserManager();
            roleManager = new SystemRoleManager();
        }

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add(int? id)
        {
            SystemUser user = new SystemUser();

            List<SelectListItem> list = new List<SelectListItem>();
            list.Add(new SelectListItem { Text = "Seçiniz", Value = "" });
            list.AddRange(roleManager.Find().Data.Select(s => new SelectListItem { Text = s.Name, Value = s.Id.ToString() }).ToList());
            ViewBag.systemRole = list;

            if (id.HasValue)
                user = manager.GetById(id ?? 0).Data;

            return PartialView("Add", user);
        }


        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            List<SystemUser> result = new List<SystemUser>();
            var activeUser = manager.GetById(Convert.ToInt32(ViewBag.SystemUserId)).Data;
            if (activeUser.IsAdmin)
                result = manager.Find()?.Data?.ToList();

            else
                result = manager.Find(s => !s.IsAdmin)?.Data?.ToList();

            if (request.order[0].dir == "asc")
            {
                if (request.order[0].column == 1)
                    result = result.OrderBy(o => o.Id).ToList();
                else if (request.order[0].column == 2)
                    result = result.OrderBy(o => o.Name).ToList();
                else if (request.order[0].column == 3)
                    result = result.OrderBy(o => o.SurName).ToList();
            }
            else
            {
                if (request.order[0].column == 1)
                    result = result.OrderByDescending(o => o.Id).ToList();
                else if (request.order[0].column == 2)
                    result = result.OrderByDescending(o => o.Name).ToList();
                else if (request.order[0].column == 3)
                    result = result.OrderByDescending(o => o.SurName).ToList();
            }
            if (request.search != null && request.search.value != null)
                result = result.Where(v => v.Name.ToLower().Contains(request.search.value.ToLower())).ToList();

            return Json(new { data = result.Skip(request.start).Take(request.length).ToList(), recordsTotal = result.Count(), recordsFiltered = result.Count() });
        }

        [HttpPost]
        public ActionResult Save(SystemUser request)
        {
            DataResult<SystemUser> data = null;

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
                    SystemUser systemUser = manager.GetById(Convert.ToInt32(item)).Data;
                    manager.Delete(systemUser);
                }
            }

            return Json("OK");
        }
    }
}