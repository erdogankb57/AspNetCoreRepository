using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class SystemActionController : BaseController
    {
        private ISystemActionService _actionService;
        private ISystemMenuService _menuService;
        public SystemActionController(ISystemActionService actionService, ISystemMenuService menuService)
        {
            _actionService = actionService;
            _menuService = menuService;
        }

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add(int? id)
        {
            SystemActionDto menuAction = new SystemActionDto();


            var systemMenus = _menuService.Find();
            List<SelectListItem> list = new List<SelectListItem>();
            list.Add(new SelectListItem { Text = "Seçiniz", Value = "" });
            list.AddRange(systemMenus.Data.Select(s => new SelectListItem { Text = s.Name, Value = s.Id.ToString() }).ToList());
            ViewBag.systemMenus = list;


            if (id.HasValue)
                menuAction = _actionService.GetById(id ?? 0).Data;

            return PartialView("Add", menuAction);
        }


        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            var result = _actionService.Find().Data;
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
        public ActionResult Save(SystemActionDto request)
        {
            DataResult<SystemActionDto> data = null;

            if (request.Id == 0)
            {
                data = _actionService.Save(request);
            }
            else
            {
                data = _actionService.Update(request);
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
                    SystemActionDto menuAction = _actionService.GetById(Convert.ToInt32(item)).Data;
                    _actionService.Delete(menuAction);
                }
            }

            return Json("OK");
        }
    }
}