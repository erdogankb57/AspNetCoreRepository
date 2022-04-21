using Inta.Framework.Extension.Serializer;
using Inta.Kurumsal.Bussiness.Abstract;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class LoginController : Controller
    {
        private ISystemUserService _userService = null;
        private ILanguageService _languageService = null;
        public LoginController(ISystemUserService userService, ILanguageService languageService)
        {
            _userService = userService;
            _languageService = languageService;
        }
        [AllowAnonymous]
        public ActionResult Index()
        {
            List<SelectListItem> list = new List<SelectListItem>();
            list.Add(new SelectListItem { Text = "Seçiniz", Value = "" });
            list.AddRange(_languageService.Find(v => v.IsActive).Data.Select(s => new SelectListItem { Text = s.Name, Value = s.Id.ToString() }).ToList());
            ViewBag.languageList = list;

            return View();
        }
        [AllowAnonymous]
        public ActionResult SignIn(string userName, string password, string LanguageId, bool? createPersistentCookie)
        {
            var user = _userService.Get(g => g.UserName == userName && g.Password == password && g.IsActive);
            if (user.Data != null)
            {
                if (String.IsNullOrEmpty(LanguageId))
                    LanguageId = _languageService.Find(v => v.IsActive).Data?.OrderBy(o => o.Id).FirstOrDefault()?.Id.ToString() ?? "0";

                Dictionary<string, string> authKey = new Dictionary<string, string>();
                authKey.Add("userName", user.Data.UserName);
                authKey.Add("password", user.Data.Password);
                authKey.Add("loginDate", DateTime.Now.ToString());
                authKey.Add("languageId", LanguageId);

                JavaScript<Dictionary<string, string>> serializer = new JavaScript<Dictionary<string, string>>();
                var authData = serializer.Serializer(authKey);

                HttpContext.Session.SetString("AuthData", authData);

                if (createPersistentCookie == true)
                {
                    CookieOptions cookie = new CookieOptions
                    {
                        Expires = DateTime.Now.AddDays(1)
                    };
                    Response.Cookies.Append("AuthData", authData);
                }

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
            HttpContext.Session.Clear();
            HttpContext.Response.Cookies.Delete("AuthData");
            return RedirectToAction("Index", "Login");
        }

    }
}