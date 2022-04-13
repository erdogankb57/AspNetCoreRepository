using Inta.EntityFramework.Core.Model;
using Inta.Framework.Extension.Serializer;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;
using System.Configuration;

namespace Inta.Kurumsal.Admin.Models
{
    public class AuthorizationCheck : ActionFilterAttribute, IResultFilter
    {
        private SystemMenuManager _systemMenuManager = null;
        private SystemUserManager _userManager = null;
        private SystemRoleManager _systemRoleManager = null;

        public AuthorizationCheck()
        {
            _systemMenuManager = new SystemMenuManager();
            _userManager = new SystemUserManager();
            _systemRoleManager = new SystemRoleManager();
        }
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            Controller controller = context.Controller as Controller;

            if (context.HttpContext.Session.GetString("AuthData") != null)
            {
                JavaScript<Dictionary<string, string>> serializer = new JavaScript<Dictionary<string, string>>();
                var data = serializer.Deserialize(context.HttpContext.Session.GetString("AuthData"));

                var user = _userManager.Get(g => g.UserName == data["userName"] && g.Password == data["password"] && g.IsActive);
                if (user.Data != null)
                {
                    controller.ViewBag.ActiveTopMenuId = "";
                    controller.ViewBag.UserName = user.Data.Name + " " + user.Data.SurName;

                    var userRole = _systemRoleManager.Get(v => v.Id == user.Data.SystemRoleId);
                    if (userRole.Data != null)
                        controller.ViewBag.RoleName = userRole.Data.Name;

                    var activeRoleAction = _userManager.GetActiveRole(user.Data.SystemRoleId);
                    //Yapılan istek ajax isteği değilse yetkilendirme kontrolü yapılır.
                    if (context.HttpContext.Request.Headers["x-requested-with"] != "XMLHttpRequest" && (activeRoleAction.Data == null || !activeRoleAction.Data.Any(v=> v.ControllerName == controller.ControllerContext.ActionDescriptor.ControllerName && v.ActionName == controller.ControllerContext.ActionDescriptor.ActionName)))
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
