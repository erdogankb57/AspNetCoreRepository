using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class LanguageController : BaseController
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
