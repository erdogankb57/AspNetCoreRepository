using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class SystemRoleController : BaseController
    {
        private SystemRoleManager manager = null;
        private SystemActionManager actionManager = null;
        private SystemActionRoleManager actionRoleManager = null;
        private SystemMenuManager systemMenuManager = null;
        private SystemMenuRoleManager systemMenuRoleManager = null;


        public SystemRoleController()
        {
            manager = new SystemRoleManager();
            actionManager = new SystemActionManager();
            systemMenuManager = new SystemMenuManager();
            actionRoleManager = new SystemActionRoleManager();
            systemMenuRoleManager = new SystemMenuRoleManager();
        }

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add(int? id)
        {
            SystemRole systemRole = new SystemRole();
            List<SystemAction> actionList = new List<SystemAction>();
            actionList = actionManager.Find().Data.ToList();
            ViewBag.actionList = actionList;

            List<SystemMenu> menuList = new List<SystemMenu>();
            menuList = systemMenuManager.Find(v => v.IsActive).Data.ToList();
            ViewBag.menuList = menuList;

            if (id.HasValue)
            {
                systemRole = manager.GetById(id ?? 0).Data;

                ViewBag.ActionRole = actionRoleManager.Find(v => v.SystemRoleId == id.Value)?.Data?.ToList();
            }

            if (id.HasValue)
            {
                systemRole = manager.GetById(id ?? 0).Data;

                ViewBag.MenuRole = systemMenuRoleManager.Find(v => v.SystemRoleId == id.Value)?.Data?.ToList();
            }


            return PartialView("Add", systemRole);
        }


        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            var result = manager.Find().Data;
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
        public ActionResult Save(SystemRole request, List<string> actions, List<string> menuList)
        {
            DataResult<SystemRole> role = null;

            if (request.Id == 0)
            {
                request.RecordDate = DateTime.Now;
                role = manager.Save(request);

                /*Action listesi eklenir*/
                foreach (var item in actions)
                {
                    actionRoleManager.Save(new SystemActionRole { SystemActionId = Convert.ToInt32(item), SystemRoleId = role.Data.Id });
                }
                /*Action listesi eklenir*/


                foreach (var item in menuList)
                {
                    systemMenuRoleManager.Save(new SystemMenuRole { SystemMenuId = Convert.ToInt32(item), SystemRoleId = role.Data.Id });
                }
            }
            else
            {
                role = manager.Update(request);

                /*Action listesi güncellenir*/
                var savedActionList = actionRoleManager.Find(v => v.SystemRoleId == role.Data.Id);
                foreach (var item in savedActionList.Data)
                {
                    if (actions == null || !actions.Any(a => a == item.SystemActionId.ToString()))
                        actionRoleManager.Delete(item);
                }

                if (actions != null)
                {
                    foreach (var item in actions)
                    {
                        var actionRole = actionRoleManager.Get(v => v.SystemRoleId == role.Data.Id && v.SystemActionId == Convert.ToInt32(item));
                        if (actionRole.Data == null)
                        {
                            actionRoleManager.Save(new SystemActionRole { SystemActionId = Convert.ToInt32(item), SystemRoleId = role.Data.Id });
                        }
                    }
                }
                /*Action listesi güncellenir*/


                /*Menu listesi güncellenir*/
                var savedMenuList = systemMenuRoleManager.Find(v => v.SystemRoleId == role.Data.Id);
                foreach (var item in savedMenuList.Data)
                {
                    if (menuList == null || !menuList.Any(a => a == item.SystemMenuId.ToString()))
                        systemMenuRoleManager.Delete(item);
                }

                if (menuList != null)
                {
                    foreach (var item in menuList)
                    {
                        var menuRole = systemMenuRoleManager.Get(v => v.SystemRoleId == role.Data.Id && v.SystemMenuId == Convert.ToInt32(item));
                        if (menuRole.Data == null)
                        {
                            systemMenuRoleManager.Save(new SystemMenuRole { SystemMenuId = Convert.ToInt32(item), SystemRoleId = role.Data.Id, RecordDate = DateTime.Now });
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
                    SystemRole role = manager.GetById(Convert.ToInt32(item)).Data;
                    manager.Delete(role);
                }
            }

            return Json("OK");
        }
    }
}