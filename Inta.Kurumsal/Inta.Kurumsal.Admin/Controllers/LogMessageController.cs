using Inta.Kurumsal.Admin.Models;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class LogMessageController : BaseController
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
