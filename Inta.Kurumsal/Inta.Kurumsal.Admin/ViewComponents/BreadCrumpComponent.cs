﻿using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.ViewComponents
{
    public class BreadCrumpComponent : ViewComponent
    {
        private SystemMenuManager systemMenuManager = null;
        public BreadCrumpComponent()
        {
            systemMenuManager = new SystemMenuManager();
        }

        public IViewComponentResult Invoke()
        {
            string controllerName = ViewContext.RouteData.Values["Controller"].ToString();
            string actionName = ViewContext.RouteData.Values["Action"].ToString();


            var activeMenu = systemMenuManager.Get(v => v.ControllerName == controllerName && v.ActionName == actionName);
            if (activeMenu.Data != null)
            {
                List<SystemMenu> shtml = new List<SystemMenu>();
                if (!(controllerName == "Home" && actionName == "Index"))
                {
                    shtml.Add(new SystemMenu
                    {
                        ControllerName = "Home",
                        ActionName = "Index",
                        Name = "Anasayfa",
                        Link = "/Home"
                    });
                }

                shtml.AddRange(GetTopMenu(activeMenu.Data.Id));

                return View(shtml);
            }

            return View(new List<SystemMenu>());
        }

        protected List<SystemMenu> GetTopMenu(int menuId)
        {
            List<SystemMenu> shtml = new List<SystemMenu>();
            var menu = systemMenuManager.Get(v => v.Id == menuId && v.Link != "#");
            if (menu.Data != null)
            {
                if (menu.Data.SystemMenuId != 0)
                {
                    shtml.AddRange(GetTopMenu(menu.Data.SystemMenuId ?? 0));
                }
                shtml.Add(menu.Data);
            }

            return shtml;
        }
    }
}
