using Inta.EntityFramework.Core.Model;
using Inta.Framework.Extension.Serializer;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class AccountController : BaseController
    {
        private SystemUserManager manager = null;
        public AccountController()
        {
            manager = new SystemUserManager();
        }
        public ActionResult Index(int? id)
        {

            JavaScript<Dictionary<string, string>> serializer = new JavaScript<Dictionary<string, string>>();
            var data = serializer.Deserialize(HttpContext.Session.GetString("AuthData"));

            SystemUser user = new SystemUser();
            string userName = data["userName"];
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