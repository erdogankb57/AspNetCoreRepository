using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class FormGroupController : BaseController
    {
        private IFormGroupService _formGroupService = null;
        private IAuthenticationData _authenticationData = null;

        public FormGroupController(IFormGroupService formGroupService, IAuthenticationData authenticationData)
        {
            _formGroupService = formGroupService;
            _authenticationData = authenticationData;
        }

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add(int? id)
        {
            FormGroupDto group = new FormGroupDto();

            if (id.HasValue)
                group = _formGroupService.GetById(id ?? 0).Data;

            return PartialView("Add", group);
        }

        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            var result = _formGroupService.Find(v=> v.LanguageId == _authenticationData.LanguageId).Data;
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
            if (request.search != null && request.search.value != null)
                result = result?.Where(v => v.Name.ToLower().Contains(request.search.value.ToLower()))?.ToList();

            return Json(new { data = result?.Skip(request.start).Take(request.length)?.ToList(), recordsTotal = result?.Count() ?? 0, recordsFiltered = result?.Count() ?? 0 });
        }

        [HttpPost]
        public ActionResult Save(FormGroupDto request)
        {
            DataResult<FormGroupDto> data = null;

            if (request.Id == 0)
            {
                request.LanguageId = _authenticationData.LanguageId;
                request.SystemUserId = ViewBag.SystemUserId;
                request.RecordDate = DateTime.Now;

                data = _formGroupService.Save(request);
            }
            else
            {
                data = _formGroupService.Update(request);
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
                    FormGroupDto formElement = _formGroupService.GetById(Convert.ToInt32(item)).Data;
                    _formGroupService.Delete(formElement);
                }
            }

            return Json("OK");
        }

        [HttpPost]
        public ActionResult ListUpdate(List<FormGroupDto> listData)
        {
            foreach (var item in listData)
            {
                var formGroup = _formGroupService.GetById(item.Id).Data;
                if (formGroup != null)
                {
                    formGroup.OrderNumber = item.OrderNumber;
                    _formGroupService.Update(formGroup);

                }
            }

            return Json("OK");
        }
    }
}