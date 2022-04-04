using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class NoAuthorizationController : Controller
    {
        // GET: Admin/NoAuthorization
        public ActionResult Index()
        {
            return View();
        }
    }
}