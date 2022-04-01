using Inta.EntityFramework.Core.Model;
using Inta.Framework.Extension.Serializer;
using Inta.Kurumsal.DataAccess.Manager;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;
using System.Configuration;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class BaseController : Controller
    {
        private SystemMenuManager _systemMenuManager = null;
        private SystemUserManager _userManager = null;

        public BaseController()
        {
            _systemMenuManager = new SystemMenuManager();
            _userManager = new SystemUserManager();
        }
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var descriptor = ((ControllerActionDescriptor)filterContext.ActionDescriptor);
            string actionName = descriptor.ActionName;
            string controllerName = descriptor.ControllerName;

            var activeMenu = _systemMenuManager.Find(v => v.ControllerName == controllerName && v.ActionName == actionName);

            if (activeMenu.ResultType == MessageType.Success && activeMenu.Data != null)
            {
                if (activeMenu.Data?.FirstOrDefault()?.SystemMenuId == 0)
                    ViewBag.ActiveMenuId = activeMenu.Data?.FirstOrDefault()?.Id ?? 0;
                else
                    ViewBag.ActiveMenuId = activeMenu.Data?.FirstOrDefault()?.SystemMenuId ?? 0;

            }


            IConfigurationBuilder builder = new ConfigurationBuilder().AddJsonFile("appsettings.json");
            IConfigurationRoot configuration = builder.Build();


            ViewBag.FileShowFolder = configuration.GetSection("FileShowFolder").Value.ToString();

            if (HttpContext.Session.GetString("AuthData") != null)
            {
                JavaScript<Dictionary<string, string>> serializer = new JavaScript<Dictionary<string, string>>();
                var data = serializer.Deserialize(HttpContext.Session.GetString("AuthData"));

                var user = _userManager.Get(g => g.UserName == data["userName"] && g.Password == data["password"] && g.IsActive);
                if (user.Data != null)
                {
                    base.OnActionExecuting(filterContext);
                    return;
                }
            }

            filterContext.Result = new RedirectResult("/Login");

        }
    }
}
