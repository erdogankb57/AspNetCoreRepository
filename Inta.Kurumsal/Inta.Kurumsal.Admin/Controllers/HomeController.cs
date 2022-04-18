using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class HomeController : BaseController
    {
        private ISystemMenuService _menuService = null;
        private ISystemUserService _userService = null;
        private ISystemMenuRoleService _roleService = null;


        public HomeController(ISystemMenuService menuService, ISystemUserService userService, ISystemMenuRoleService roleService)
        {
            _menuService = menuService;
            _userService = userService;
            _roleService = roleService;
        }

        public ActionResult Index()
        {
            int userId = Convert.ToInt32(ViewBag.SystemUserId);
            var user = _userService.Find(v => v.Id == userId).Data.FirstOrDefault();
            bool isAdmin = true;
            List<int> roleIds = new List<int>();
            if (user != null)
            {
                roleIds.AddRange(_roleService.Find(v => v.SystemRoleId == user.SystemRoleId).Data.Select(s => s.SystemMenuId));
            }

            List<SystemMenuDto> data = new List<SystemMenuDto>();
            //admin ise
            if (isAdmin)
                data = _menuService.Find(v => v.SystemMenuId.HasValue && v.SystemMenuId.Value != 0 && v.IsActive).Data?.ToList();
            else
                data = _menuService.Find(v => v.SystemMenuId.HasValue && v.SystemMenuId.Value != 0 && v.IsActive && roleIds.Any(a => a == v.Id)).Data?.ToList();


            return View(data);
        }
    }
}