using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class LogMessageController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
