using Inta.Framework.Extension.Common;
using Inta.Kurumsal.Bussiness.Abstract;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class ForgetPasswordController : Controller
    {
        private ISystemUserService _userService;
        private MailManager mailManager = null;
        public ForgetPasswordController(ISystemUserService userService)
        {
            _userService = userService;
            mailManager = new MailManager("", "", "", 0, "");
        }
        [AllowAnonymous]
        public ActionResult Index()
        {
            return View();
        }

        [AllowAnonymous]
        public ActionResult SendPassword(string email)
        {
            var user = _userService.Get(g => g.Email == email);
            if (user.Data != null)
            {
                List<string> mails = new List<string>();
                mails.Add(user.Data.Email);
                mailManager.Send(mails, "Şifreniz", "Şifreniz : " + user.Data.Password);

                TempData["Error"] = "Şifreniz e-mail adresinize gönderildi.";
                return RedirectToAction("Index");
            }
            else
            {
                TempData["Error"] = "Bu E-mail adresi sistemde kayıtlı değil. Lütfen e-mail adresinizi kontrol ediniz.";
                return RedirectToAction("Index");
            }
        }

    }
}