using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class SystemRoleController : BaseController
    {
        private ISystemRoleService _service = null;
        private ISystemActionService _actionService = null;
        private ISystemActionRoleService  _actionRoleService = null;
        private ISystemMenuService _systemMenuService = null;
        private ISystemMenuRoleService _systemMenuRoleService = null;


        public SystemRoleController(ISystemRoleService service, ISystemActionService actionService, ISystemActionRoleService actionRoleService, ISystemMenuService systemMenuService, ISystemMenuRoleService systemMenuRoleService)
        {
            _service = service;
            _actionService = actionService;
            _systemMenuService = systemMenuService;
            _actionRoleService = actionRoleService;
            _systemMenuRoleService = systemMenuRoleService;
        }

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add(int? id)
        {
            SystemRoleDto systemRole = new SystemRoleDto();
            List<SystemActionDto> actionList = new List<SystemActionDto>();
            actionList = _actionService.Find().Data.ToList();
            ViewBag.actionList = actionList;

            List<SystemMenuDto> menuList = new List<SystemMenuDto>();
            menuList = _systemMenuService.Find(v => v.IsActive).Data.ToList();
            ViewBag.menuList = menuList;

            if (id.HasValue)
            {
                systemRole = _service.GetById(id ?? 0).Data;

                ViewBag.ActionRole = _actionRoleService.Find(v => v.SystemRoleId == id.Value)?.Data?.ToList();
            }

            if (id.HasValue)
            {
                systemRole = _service.GetById(id ?? 0).Data;

                ViewBag.MenuRole = _systemMenuRoleService.Find(v => v.SystemRoleId == id.Value)?.Data?.ToList();
            }


            return PartialView("Add", systemRole);
        }


        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            var result = _service.Find().Data;
            if (request.order[0].dir == "asc")
            {
                if (request.order[0].column == 1)
                    result = result?.OrderBy(o => o.Id)?.ToList();
                else if (request.order[0].column == 2)
                    result = result?.OrderBy(o => o.Name)?.ToList();
            }
            else
            {
                if (request.order[0].column == 1)
                    result = result?.OrderByDescending(o => o.Id)?.ToList();
                else if (request.order[0].column == 2)
                    result = result?.OrderByDescending(o => o.Name)?.ToList();
            }
            if (request.search != null && request.search.value != null)
                result = result?.Where(v => v.Name.ToLower().Contains(request.search.value.ToLower()))?.ToList();

            return Json(new { data = result?.Skip(request.start).Take(request.length)?.ToList(), recordsTotal = result?.Count() ?? 0, recordsFiltered = result?.Count() ?? 0 });
        }

        [HttpPost]
        public ActionResult Save(SystemRoleDto request, List<string> actions, List<string> menuList)
        {
            DataResult<SystemRoleDto> role = null;

            if (request.Id == 0)
            {
                request.RecordDate = DateTime.Now;
                role = _service.Save(request);

                /*Action listesi eklenir*/
                foreach (var item in actions)
                {
                    _actionRoleService.Save(new SystemActionRoleDto { SystemActionId = Convert.ToInt32(item), SystemRoleId = role.Data.Id });
                }
                /*Action listesi eklenir*/


                foreach (var item in menuList)
                {
                    _systemMenuRoleService.Save(new SystemMenuRoleDto { SystemMenuId = Convert.ToInt32(item), SystemRoleId = role.Data.Id });
                }
            }
            else
            {
                role = _service.Update(request);

                /*Action listesi güncellenir*/
                var savedActionList = _actionRoleService.Find(v => v.SystemRoleId == role.Data.Id);
                foreach (var item in savedActionList.Data)
                {
                    if (actions == null || !actions.Any(a => a == item.SystemActionId.ToString()))
                        _actionRoleService.Delete(item);
                }

                if (actions != null)
                {
                    foreach (var item in actions)
                    {
                        var actionRole = _actionRoleService.Get(v => v.SystemRoleId == role.Data.Id && v.SystemActionId == Convert.ToInt32(item));
                        if (actionRole.Data == null)
                        {
                            _actionRoleService.Save(new SystemActionRoleDto { SystemActionId = Convert.ToInt32(item), SystemRoleId = role.Data.Id });
                        }
                    }
                }
                /*Action listesi güncellenir*/


                /*Menu listesi güncellenir*/
                var savedMenuList = _systemMenuRoleService.Find(v => v.SystemRoleId == role.Data.Id);
                foreach (var item in savedMenuList.Data)
                {
                    if (menuList == null || !menuList.Any(a => a == item.SystemMenuId.ToString()))
                        _systemMenuRoleService.Delete(item);
                }

                if (menuList != null)
                {
                    foreach (var item in menuList)
                    {
                        var menuRole = _systemMenuRoleService.Get(v => v.SystemRoleId == role.Data.Id && v.SystemMenuId == Convert.ToInt32(item));
                        if (menuRole.Data == null)
                        {
                            _systemMenuRoleService.Save(new SystemMenuRoleDto { SystemMenuId = Convert.ToInt32(item), SystemRoleId = role.Data.Id, RecordDate = DateTime.Now });
                        }
                    }
                }
                /*Menu listesi güncellenir*/


            }

            return Json(role);
        }

        [HttpPost]
        public ActionResult Delete(string ids)
        {
            if (!String.IsNullOrEmpty(ids))
            {
                foreach (var item in ids.Split(','))
                {
                    SystemRoleDto role = _service.GetById(Convert.ToInt32(item)).Data;
                    _service.Delete(role);
                }
            }

            return Json("OK");
        }
    }
}