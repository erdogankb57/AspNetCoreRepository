using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class LogMessageController : BaseController
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
