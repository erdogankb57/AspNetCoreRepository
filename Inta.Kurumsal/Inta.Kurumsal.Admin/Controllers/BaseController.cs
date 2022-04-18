using Inta.Kurumsal.Bussiness.Abstract;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class BaseController : Controller
    {
        private ISystemMenuService _systemMenuService = null;
        private ISystemUserService _userService = null;
        private ISystemRoleService _systemRoleService = null;

        public BaseController()
        {

        }
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            _systemMenuService = filterContext.HttpContext.RequestServices.GetService<ISystemMenuService>();
            _userService = filterContext.HttpContext.RequestServices.GetService<ISystemUserService>();
            _systemRoleService = filterContext.HttpContext.RequestServices.GetService<ISystemRoleService>();

            var descriptor = ((ControllerActionDescriptor)filterContext.ActionDescriptor);
            string actionName = descriptor.ActionName;
            string controllerName = descriptor.ControllerName;

            var activeMenu = _systemMenuService.Find(v => v.ControllerName == controllerName && v.ActionName == actionName);

            if (activeMenu.ResultType == EntityFramework.Core.Model.MessageTypeResult.Success && activeMenu.Data != null)
            {
                ViewBag.ActiveMenuId = _systemMenuService.TopMenuId(activeMenu.Data?.FirstOrDefault()?.Id ?? 0);

                ViewBag.ActiveMenuAd = activeMenu.Data?.FirstOrDefault()?.Name ?? "";

            }


            IConfigurationBuilder builder = new ConfigurationBuilder().AddJsonFile("appsettings.json");
            IConfigurationRoot configuration = builder.Build();


            ViewBag.FileShowFolder = configuration.GetSection("FileShowFolder").Value.ToString();
        }
    }
}
