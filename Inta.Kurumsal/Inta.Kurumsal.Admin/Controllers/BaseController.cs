using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.DataAccess.Manager;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class BaseController : Controller
    {
        private SystemMenuManager systemMenuManager = null;
        public BaseController()
        {
            systemMenuManager = new SystemMenuManager();
        }
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var descriptor = ((ControllerActionDescriptor)filterContext.ActionDescriptor);
            string actionName = descriptor.ActionName;
            string controllerName = descriptor.ControllerName;

            var activeMenu = systemMenuManager.Find(v => v.ControllerName == controllerName && v.ActionName == actionName);

            if (activeMenu.ResultType == MessageType.Success && activeMenu.Data != null)
            {
                if (activeMenu.Data?.FirstOrDefault()?.SystemMenuId == 0)
                ViewBag.ActiveMenuId = activeMenu.Data?.FirstOrDefault()?.Id ?? 0;
                else
                    ViewBag.ActiveMenuId = activeMenu.Data?.FirstOrDefault()?.SystemMenuId ?? 0;

            }


            base.OnActionExecuting(filterContext);
        }
    }
}
