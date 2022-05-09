using Inta.Framework.Extension.Serializer;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class LanguageController : BaseController
    {
        private IAuthenticationData _authenticationData = null;
        private IHttpContextAccessor _httpContextAccessor = null;
        public LanguageController(IAuthenticationData authenticationData, IHttpContextAccessor httpContextAccessor)
        {
            _authenticationData = authenticationData;
            _httpContextAccessor = httpContextAccessor;
        }
        public IActionResult Index()
        {
            return View();
        }

        public ActionResult SetLanguage(int id)
        {
            if (id > 0)
            {
                Dictionary<string, string> authKey = new Dictionary<string, string>();
                authKey.Add("userName", _authenticationData.UserName);
                authKey.Add("password", _authenticationData.Password);
                authKey.Add("loginDate", _authenticationData.LoginDate);
                authKey.Add("languageId", id.ToString());

                JavaScript<Dictionary<string, string>> serializer = new JavaScript<Dictionary<string, string>>();
                var authData = serializer.Serializer(authKey);


                if (_httpContextAccessor.HttpContext.Request.Cookies["AuthData"] != null)
                {
                    Response.Cookies.Delete("AuthData");
                    CookieOptions cookie = new CookieOptions
                    {
                        Expires = DateTime.Now.AddDays(1)
                    };
                    Response.Cookies.Append("AuthData", authData);
                }

                HttpContext.Session.SetString("AuthData", authData);
                return Json("OK");
            }
            else
            {
                return Json("ERROR");
            }

            
        }
    }
}
