﻿using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class GeneralSettingsController : BaseController
    {
        private IGeneralSettingsService _service = null;
        private IAuthenticationData _authenticationData = null;
        public GeneralSettingsController(IGeneralSettingsService service, IAuthenticationData authenticationData)
        {
            _service = service;
            _authenticationData = authenticationData;
        }

        public ActionResult Index()
        {
            var model = _service.Find(v=> v.LanguageId == _authenticationData.LanguageId)?.Data?.FirstOrDefault();

            return View(model);
        }

        [HttpPost]
        public ActionResult Save(GeneralSettingsDto request)
        {
            DataResult<GeneralSettingsDto> data = null;

            if (request.Id == 0)
            {
                request.LanguageId = _authenticationData.LanguageId;
                request.SystemUserId = ViewBag.SystemUserId;

                data = _service.Save(request);
            }
            else
            {
                data = _service.Update(request);
            }

            return Json(data);
        }

    }


}