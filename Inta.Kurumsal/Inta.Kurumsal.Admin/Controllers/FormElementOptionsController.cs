﻿using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class FormElementOptionsController : BaseController
    {
        private IFormElementOptionsService _optionService = null;
        private IFormElementService _elementService = null;
        private IAuthenticationData _authenticationData = null;
        int SelectedElementId = 0;

        public FormElementOptionsController(IFormElementOptionsService optionService, IFormElementService elementService, IAuthenticationData authenticationData)
        {
            _optionService = optionService;
            _elementService = elementService;
            _authenticationData = authenticationData;
        }

        public ActionResult Index()
        {
            if (!string.IsNullOrEmpty(HttpContext.Request.Query["FormElementId"].ToString()))
                ViewBag.FormElementId = HttpContext.Request.Query["FormElementId"].ToString();
            else
                ViewBag.FormElementId = "0";

            return View();
        }
        public ActionResult Add(int? id, int? FormElementId)
        {
            FormElementOptionsDto elementOptions = new FormElementOptionsDto();
            List<SelectListItem> formElement = new List<SelectListItem>();
            formElement.Add(new SelectListItem { Text = "Seçiniz", Value = "" });
            formElement.AddRange(_elementService.Find(v => v.ElementTypeId != 1 && v.ElementTypeId != 2).Data.Select(s => new SelectListItem
            {
                Text = s.Name,
                Value = s.Id.ToString()
            }));

            ViewBag.formElement = formElement;

            if (id.HasValue)
                elementOptions = _optionService.GetById(id ?? 0).Data;
            else
            {
                if (FormElementId.HasValue)
                    elementOptions.FormElementId = FormElementId.Value;
            }



            return PartialView("Add", elementOptions);
        }


        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request, int? FormElementId)
        {
            var result = _optionService.Find(v=> v.LanguageId == _authenticationData.LanguageId).Data;
            if (request.order[0].dir == "asc")
            {
                if (request.order[0].column == 1)
                    result = result?.OrderBy(o => o.Id)?.ToList();
                else if (request.order[0].column == 2)
                    result = result?.OrderBy(o => o.Name)?.ToList();
            }
            else
            {
                if (request.order[0].column == 1)
                    result = result?.OrderByDescending(o => o.Id)?.ToList();
                else if (request.order[0].column == 2)
                    result = result?.OrderByDescending(o => o.Name)?.ToList();
            }

            if (FormElementId.HasValue && FormElementId.Value > 0)
                result = result?.Where(v => v.FormElementId == Convert.ToInt32(FormElementId.Value))?.ToList();

            if (request.search != null && request.search.value != null)
                result = result?.Where(v => v.Name.ToLower().Contains(request.search.value.ToLower()))?.ToList();

            return Json(new { data = result?.Skip(request.start)?.Take(request.length)?.ToList(), recordsTotal = result?.Count() ?? 0, recordsFiltered = result?.Count() ?? 0 });
        }

        [HttpPost]
        public ActionResult Save(FormElementOptionsDto request)
        {
            DataResult<FormElementOptionsDto> data = null;

            if (request.Id == 0)
            {
                request.LanguageId = _authenticationData.LanguageId;
                request.SystemUserId = ViewBag.SystemUserId;
                request.RecordDate = DateTime.Now;

                data = _optionService.Save(request);
            }
            else
            {
                data = _optionService.Update(request);
            }

            return Json(data);
        }

        [HttpPost]
        public ActionResult Delete(string ids)
        {
            if (!String.IsNullOrEmpty(ids))
            {
                foreach (var item in ids.Split(','))
                {
                    FormElementOptionsDto formElementOptions = _optionService.GetById(Convert.ToInt32(item)).Data;
                    _optionService.Delete(formElementOptions);
                }
            }

            return Json("OK");
        }

        [HttpPost]
        public ActionResult ListUpdate(List<FormElementOptionsDto> listData)
        {
            foreach (var item in listData)
            {
                var formElementOptions = _optionService.GetById(item.Id).Data;
                if (formElementOptions != null)
                {
                    formElementOptions.OrderNumber = item.OrderNumber;
                    _optionService.Update(formElementOptions);

                }
            }

            return Json("OK");
        }
    }
}