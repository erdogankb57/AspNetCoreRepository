using Inta.Kurumsal.Admin.Models;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class SystemUserRoleController : BaseController
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
