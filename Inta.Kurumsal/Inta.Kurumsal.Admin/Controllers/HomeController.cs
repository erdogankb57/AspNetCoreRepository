using Inta.Kurumsal.Admin.ViewComponents;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class HomeController : BaseController
    {
        private SystemMenuManager menuManager = null;
        private SystemUserManager userManager = null;
        private SystemMenuRoleManager roleManager = null;


        public HomeController()
        {
            menuManager = new SystemMenuManager();
            userManager = new SystemUserManager();
            roleManager = new SystemMenuRoleManager();
        }

        public ActionResult Index()
        {
            int userId = Convert.ToInt32(ViewBag.SystemUserId);
            var user = userManager.Find(v => v.Id == userId).Data.FirstOrDefault();
            bool isAdmin = true;
            List<int> roleIds = new List<int>();
            if (user != null)
            {
                roleIds.AddRange(roleManager.Find(v => v.SystemRoleId == user.SystemRoleId).Data.Select(s => s.SystemMenuId));
            }

            List<SystemMenu> data = new List<SystemMenu>();
            //admin ise
            if (isAdmin)
                data = menuManager.Find(v => v.SystemMenuId.HasValue && v.SystemMenuId.Value != 0 && v.IsActive).Data?.ToList();
            else
                data = menuManager.Find(v => v.SystemMenuId.HasValue && v.SystemMenuId.Value != 0 && v.IsActive && roleIds.Any(a => a == v.Id)).Data?.ToList();


            return View(data);
        }
    }
}