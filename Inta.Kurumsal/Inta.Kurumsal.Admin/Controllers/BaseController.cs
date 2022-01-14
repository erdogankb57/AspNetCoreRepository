using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class BaseController : Controller
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var descriptor = ((ControllerActionDescriptor)filterContext.ActionDescriptor);
            string actionName = descriptor.ActionName;
            string controllerName = descriptor.ControllerName;

            ViewBag.Deneme = "deneme";

            base.OnActionExecuting(filterContext);
        }
    }
}
