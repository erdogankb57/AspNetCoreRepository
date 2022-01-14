using Inta.Kurumsal.DataAccess.Manager;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class LoginController : BaseController
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
                /*FormsAuthentication.SetAuthCookie(userName, createPersistentCookie ?? false);
                */
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