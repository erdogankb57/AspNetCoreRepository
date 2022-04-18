using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.ViewComponents
{
    public class BreadCrumpComponent : ViewComponent
    {
        private ISystemMenuService _systemMenuService = null;
        public BreadCrumpComponent(ISystemMenuService systemMenuService)
        {
            _systemMenuService = systemMenuService;
        }

        public IViewComponentResult Invoke()
        {
            string controllerName = ViewContext.RouteData.Values["Controller"].ToString();
            string actionName = ViewContext.RouteData.Values["Action"].ToString();


            var activeMenu = _systemMenuService.Get(v => v.ControllerName == controllerName && v.ActionName == actionName);
            if (activeMenu.Data != null)
            {
                List<SystemMenuDto> shtml = new List<SystemMenuDto>();
                if (!(controllerName == "Home" && actionName == "Index"))
                {
                    shtml.Add(new SystemMenuDto
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

            return View(new List<SystemMenuDto>());
        }

        protected List<SystemMenuDto> GetTopMenu(int menuId)
        {
            List<SystemMenuDto> shtml = new List<SystemMenuDto>();
            var menu = _systemMenuService.Get(v => v.Id == menuId && v.Link != "#");
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
