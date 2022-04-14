using Inta.Framework.Extension.Serializer;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Bussiness.Service;
using Inta.Kurumsal.DataAccess.Manager;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Inta.Kurumsal.Admin.Models
{
    public class AuthorizationCheck : ActionFilterAttribute, IResultFilter
    {
        private ISystemMenuService _systemMenuService = null;
        private ISystemUserService _userService = null;
        private ISystemRoleService _systemRoleService = null;

        public AuthorizationCheck()
        {

        }
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            Controller controller = context.Controller as Controller;

            _systemMenuService = context.HttpContext.RequestServices.GetService<ISystemMenuService>();
            _userService = context.HttpContext.RequestServices.GetService<ISystemUserService>();
            _systemRoleService = context.HttpContext.RequestServices.GetService<ISystemRoleService>();

            if (context.HttpContext.Session.GetString("AuthData") != null)
            {
                JavaScript<Dictionary<string, string>> serializer = new JavaScript<Dictionary<string, string>>();
                var data = serializer.Deserialize(context.HttpContext.Session.GetString("AuthData"));

                var user = _userService.Get(g => g.UserName == data["userName"] && g.Password == data["password"] && g.IsActive);
                if (user.Data != null)
                {
                    controller.ViewBag.ActiveTopMenuId = "";
                    controller.ViewBag.UserName = user.Data.Name + " " + user.Data.SurName;

                    var userRole = _systemRoleService.Get(v => v.Id == user.Data.SystemRoleId);
                    if (userRole.Data != null)
                        controller.ViewBag.RoleName = userRole.Data.Name;

                    var activeRoleAction = _userService.GetActiveRole(user.Data.SystemRoleId);
                    //Yapılan istek ajax isteği değilse yetkilendirme kontrolü yapılır.
                    if (!user.Data.IsAdmin && context.HttpContext.Request.Headers["x-requested-with"] != "XMLHttpRequest" && (activeRoleAction.Data == null || !activeRoleAction.Data.Any(v => v.ControllerName == controller.ControllerContext.ActionDescriptor.ControllerName && v.ActionName == controller.ControllerContext.ActionDescriptor.ActionName)))
                    {
                        context.Result = new RedirectResult("/NoAuthorization");
                        return;
                    }

                }
            }
            else
            {
                context.Result = new RedirectResult("/Login");
            }


            base.OnActionExecuting(context);
        }
    }
}
