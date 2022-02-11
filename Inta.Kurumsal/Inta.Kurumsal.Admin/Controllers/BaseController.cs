using Inta.EntityFramework.Core.Model;
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
        public BaseController()
        {
            _systemMenuManager = new SystemMenuManager();
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


            base.OnActionExecuting(filterContext);
        }
    }
}
