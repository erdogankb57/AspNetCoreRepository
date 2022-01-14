using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class MessageTypeController : BaseController
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
