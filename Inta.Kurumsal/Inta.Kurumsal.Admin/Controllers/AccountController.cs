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
        private ISystemUserService _service;
        private IAuthenticationData _authenticationData;
        public AccountController(ISystemUserService service, IAuthenticationData authenticationData)
        {
            _service = service;
            _authenticationData = authenticationData;
        }
        public ActionResult Index(int? id)
        {
            SystemUserDto user = new SystemUserDto();
            string userName = _authenticationData.UserName;
            user = _service.Get(v => v.UserName == userName)?.Data ?? new SystemUserDto();

            return View("Index", user);
        }

        [HttpPost]
        public ActionResult Save(SystemUserDto request)
        {
            DataResult<SystemUserDto> data;

            data = _service.Update(request);

            return Json(data);
        }
    }
}