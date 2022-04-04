using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.DataAccess.Manager;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class SystemMenuController : BaseController
    {
        private SystemMenuManager systemMenu { get; set; }
        private SystemUserManager userManager = null;
        private SystemMenuRoleManager roleManager = null;
        public SystemMenuController()
        {
            systemMenu = new SystemMenuManager();
            userManager = new SystemUserManager();
            roleManager = new SystemMenuRoleManager();
        }

        public ActionResult GetSystemMenu()
        {
            List<SystemMenuModel> systemMenus = GetMenu();


            return PartialView("SystemMenu", systemMenus);
        }

        public List<SystemMenuModel> GetMenu()
        {
            int userId = Convert.ToInt32(ViewBag.SystemUserId);
            var user = userManager.Find(v => v.Id == userId).Data.FirstOrDefault();
            List<int> roleIds = new List<int>();
            if (user != null)
            {
                roleIds.AddRange(roleManager.Find(v => v.SystemRoleId == user.SystemRoleId).Data.Select(s => s.SystemMenuId));
            }

            List<SystemMenuModel> systemMenus = new List<SystemMenuModel>();

            foreach (var menu in systemMenu.Find(v => v.SystemMenuId == 0 && v.IsActive && (user.IsAdmin || roleIds.Any(a => a == v.Id))).Data)
            {
                var m = new SystemMenuModel
                {
                    ActionName = menu.ActionName,
                    ControllerName = menu.ControllerName,
                    Explanation = menu.Explanation,
                    Id = menu.Id,
                    IsActive = menu.IsActive,
                    Link = menu.Link,
                    MenuIcon = menu.MenuIcon,
                    Name = menu.Name,
                    RecordDate = menu.RecordDate,
                    SystemMenuId = menu.SystemMenuId,
                };

                m.SystemMenu = systemMenu.Find(v => v.SystemMenuId == menu.Id && v.IsActive && (user.IsAdmin || roleIds.Any(a => a == v.Id))).Data.Select(s => new SystemMenuModel
                {
                    ActionName = s.ActionName,
                    ControllerName = s.ControllerName,
                    Explanation = s.Explanation,
                    Id = s.Id,
                    IsActive = s.IsActive,
                    Link = s.Link,
                    MenuIcon = s.MenuIcon,
                    Name = s.Name,
                    RecordDate = s.RecordDate,
                    SystemMenuId = s.SystemMenuId
                }).ToList();

                systemMenus.Add(m);
            }

            return systemMenus;
        }
    }
}