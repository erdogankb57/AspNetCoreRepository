using Inta.Framework.Extension.Serializer;
using Inta.Kurumsal.DataAccess.Manager;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class LoginController : Controller
    {
        private SystemUserManager userManager = null;
        public LoginController()
        {
            userManager = new SystemUserManager();
        }
        [AllowAnonymous]
        public ActionResult Index()
        {
            return View();
        }
        [AllowAnonymous]
        public ActionResult SignIn(string userName, string password, bool? createPersistentCookie)
        {
            var user = userManager.Get(g => g.UserName == userName && g.Password == password && g.IsActive);
            if (user.Data != null)
            {
                Dictionary<string, string> authKey = new Dictionary<string, string>();
                authKey.Add("userName", user.Data.UserName);
                authKey.Add("password", user.Data.Password);
                authKey.Add("loginDate", DateTime.Now.ToString());

                JavaScript<Dictionary<string, string>> serializer = new JavaScript<Dictionary<string, string>>();
                var authData = serializer.Serializer(authKey);

                HttpContext.Session.SetString("AuthData", authData);

                if (!string.IsNullOrEmpty(HttpContext.Request.Query["ReturnUrl"]))
                {
                    return Redirect(HttpContext.Request.Query["ReturnUrl"]);
                }
                else
                    return RedirectToAction("Index", "Home");

            }
            else
            {
                ViewBag.Error = "Kullanıcı adı veya şifre hatalı";
                return View("Index");
            }
        }
        public ActionResult SignOut()
        {
            /*FormsAuthentication.SignOut();
            Response.Redirect(HttpContext.Request.UrlReferrer.ToString());*/
            return null;
        }

    }
}