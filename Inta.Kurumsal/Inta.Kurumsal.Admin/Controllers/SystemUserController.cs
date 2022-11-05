using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class SystemUserController : BaseController
    {
        private ISystemUserService _service = null;
        private ISystemRoleService _roleService = null;

        public SystemUserController(ISystemUserService service, ISystemRoleService roleService)
        {
            _service = service;
            _roleService = roleService;
        }

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add(int? id)
        {
            SystemUserDto user = new SystemUserDto();

            List<SelectListItem> list = new List<SelectListItem>();
            list.Add(new SelectListItem { Text = "Seçiniz", Value = "" });
            list.AddRange(_roleService.Find().Data.Select(s => new SelectListItem { Text = s.Name, Value = s.Id.ToString() }).ToList());
            ViewBag.systemRole = list;

            if (id.HasValue)
                user = _service.GetById(id ?? 0).Data;

            return PartialView("Add", user);
        }


        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            List<SystemUserDto> result = new List<SystemUserDto>();
            var activeUser = _service.GetById(Convert.ToInt32(ViewBag.SystemUserId)).Data;
            if (activeUser != null && activeUser.IsAdmin)
                result = _service.Find()?.Data?.ToList();

            else
                result = _service.Find(s => !s.IsAdmin)?.Data?.ToList();

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
        public ActionResult Save(SystemUserDto request)
        {
            DataResult<SystemUserDto> data = null;

            if (request.Id == 0)
            {
                request.SystemUserId = ViewBag.SystemUserId;
                request.RecordDate = DateTime.Now;
                data = _service.Save(request);
            }
            else
            {
                data = _service.Update(request);
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
                    SystemUserDto systemUser = _service.GetById(Convert.ToInt32(item)).Data;
                    _service.Delete(systemUser);
                }
            }

            return Json("OK");
        }
    }
}