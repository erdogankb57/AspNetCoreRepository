using Inta.Framework.Extension.Common;
using Inta.Kurumsal.DataAccess.Manager;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class ForgetPasswordController : BaseController
    {
        private SystemUserManager userManager = null;
        private MailManager mailManager = null;
        public ForgetPasswordController()
        {
            userManager = new SystemUserManager();
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
            var user = userManager.Get(g => g.Email == email);
            if (user.Data != null)
            {
                List<string> mails = new List<string>();
                mails.Add(user.Data.Email);
                mailManager.Send(mails, "Şifreniz", "Şifreniz : " + user.Data.Password);

                ViewBag.Error = "Şifreniz e-mail adresinize gönderildi.";
                return View("Index");
            }
            else
            {
                ViewBag.Error = "Bu E-mail adresi sistemde kayıtlı değil. Lütfen e-mail adresinizi kontrol ediniz.";
                return View("Index");
            }
        }
    }
}