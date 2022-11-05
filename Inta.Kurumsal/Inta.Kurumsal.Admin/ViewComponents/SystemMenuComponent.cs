using Inta.Framework.Extension.Serializer;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.ViewComponents
{
    public class SystemMenuComponent : ViewComponent
    {
        private ISystemMenuService _systemMenuService;
        private ISystemUserService _userService;
        private ISystemMenuRoleService _roleService;
        private IAuthenticationData _authenticationData;

        public SystemMenuComponent(ISystemMenuService systemMenuService, ISystemUserService userService, ISystemMenuRoleService roleService, IAuthenticationData authenticationData)
        {
            _systemMenuService = systemMenuService;
            _userService = userService;
            _roleService = roleService;
            _authenticationData = authenticationData;
        }

        public IViewComponentResult Invoke()
        {
            List<SystemMenuModel> systemMenus = GetMenu();

            return View(systemMenus);
        }

        public List<SystemMenuModel> GetMenu()
        {
            var user = _userService?.Find(v => v.UserName == _authenticationData.UserName)?.Data?.FirstOrDefault();
            List<int> roleIds = new List<int>();
            if (user != null)
            {
                roleIds.AddRange(_roleService?.Find(v => v.SystemRoleId == user.SystemRoleId)?.Data?.Select(s => s.SystemMenuId) ?? new List<int>());
            }

            List<SystemMenuModel> systemMenus = new List<SystemMenuModel>();

            foreach (var menu in _systemMenuService?.Find(v => v.SystemMenuId == 0 && v.IsActive && ((user != null && user.IsAdmin) || roleIds.Any(a => a == v.Id)))?.Data ?? new List<Dto.Concrete.SystemMenuDto>())
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

                m.SystemMenu = _systemMenuService?.Find(v => v.SystemMenuId == menu.Id && v.IsActive && ((user!=null && user.IsAdmin) || roleIds.Any(a => a == v.Id)))?.Data?.Select(s => new SystemMenuModel
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
