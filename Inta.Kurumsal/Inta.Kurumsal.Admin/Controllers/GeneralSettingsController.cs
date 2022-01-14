using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class GeneralSettingsController : Controller
    {
        private GeneralSettingsManager manager = null;
        public GeneralSettingsController()
        {
            manager = new GeneralSettingsManager();
        }

        public ActionResult Index()
        {
            var model = manager.Find()?.Data?.FirstOrDefault();

            return View(model);
        }

        [HttpPost]
        public ActionResult Save(GeneralSettings request)
        {
            DataResult<GeneralSettings> data = null;

            if (request.Id == 0)
            {
                request.LanguageId = ViewBag.LanguageId;
                request.SystemUserId = ViewBag.SystemUserId;

                data = manager.Save(request);
            }
            else
            {
                data = manager.Update(request);
            }

            return Json(data);
        }

    }


}