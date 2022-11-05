using Inta.Framework.Extension.Serializer;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Bussiness.Common;
using Inta.Kurumsal.Bussiness.Service;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Inta.Kurumsal.Admin.Models
{
    public class AuthorizationCheck : ActionFilterAttribute, IResultFilter
    {
        private ISystemMenuService? _systemMenuService = null;
        private ISystemUserService? _userService = null;
        private ISystemRoleService? _systemRoleService = null;
        private IAuthenticationData? _authenticationData = null;
        public AuthorizationCheck()
        {

        }
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            Controller controller = context.Controller as Controller;

            _systemMenuService = context.HttpContext.RequestServices.GetService<ISystemMenuService>();
            _userService = context.HttpContext.RequestServices.GetService<ISystemUserService>();
            _systemRoleService = context.HttpContext.RequestServices.GetService<ISystemRoleService>();
            _authenticationData = context.HttpContext.RequestServices.GetService<IAuthenticationData>();


            if (_authenticationData?.HasSession ?? false)
            {
                var user = _userService?.Get(g => g.UserName == _authenticationData.UserName && g.Password == _authenticationData.Password && g.IsActive);
                if (user?.Data != null)
                {
                    controller.ViewBag.ActiveTopMenuId = "";
                    controller.ViewBag.UserName = user.Data.Name + " " + user.Data.SurName;
                    controller.ViewBag.SystemUserId = user.Data.Id;

                    var userRole = _systemRoleService?.Get(v => v.Id == user.Data.SystemRoleId);
                    if (userRole?.Data != null)
                        controller.ViewBag.RoleName = userRole.Data.Name;

                    var activeRoleAction = _userService?.GetActiveRole(user.Data.SystemRoleId);
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
                context.Result = new RedirectResult("/Login?ReturnUrl=" + context.HttpContext.Request.Path + context.HttpContext.Request.QueryString);
            }


            base.OnActionExecuting(context);
        }
    }
}
