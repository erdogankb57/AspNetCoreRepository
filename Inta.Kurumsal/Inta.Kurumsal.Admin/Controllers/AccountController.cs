using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class AccountController : Controller
    {
        private SystemUserManager manager = null;
        public AccountController()
        {
            manager = new SystemUserManager();
        }
        public ActionResult Index(int? id)
        {
            SystemUser user = new SystemUser();
            string userName = User.Identity.Name;
            user = manager.Get(v => v.UserName == userName).Data;

            return View("Index", user);
        }

        [HttpPost]
        public ActionResult Save(SystemUser request)
        {
            DataResult<SystemUser> data = null;

            data = manager.Update(request);

            return Json(data);
        }
    }
}