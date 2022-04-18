using Inta.EntityFramework.Core.Model;
using Inta.Framework.Extension.Serializer;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class AccountController : BaseController
    {
        private ISystemUserService _service = null;
        public AccountController(ISystemUserService service)
        {
            _service = service;
        }
        public ActionResult Index(int? id)
        {

            JavaScript<Dictionary<string, string>> serializer = new JavaScript<Dictionary<string, string>>();
            var data = serializer.Deserialize(HttpContext.Session.GetString("AuthData"));

            SystemUserDto user = new SystemUserDto();
            string userName = data["userName"];
            user = _service.Get(v => v.UserName == userName).Data;

            return View("Index", user);
        }

        [HttpPost]
        public ActionResult Save(SystemUserDto request)
        {
            DataResult<SystemUserDto> data = null;

            data = _service.Update(request);

            return Json(data);
        }
    }
}