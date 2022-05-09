using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class FirmVariablesController : BaseController
    {
        private IFirmVariablesService _firmVariablesService = null;
        private IAuthenticationData _authenticationData = null;
        public FirmVariablesController(IFirmVariablesService firmVariablesService, IAuthenticationData authenticationData)
        {
            _firmVariablesService = firmVariablesService;
            _authenticationData = authenticationData;
        }

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add(int? id)
        {
            FirmVariablesDto firmVariables = new FirmVariablesDto();

            if (id.HasValue)
                firmVariables = _firmVariablesService.GetById(id ?? 0).Data;

            return PartialView("Add", firmVariables);
        }


        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            var result = _firmVariablesService.Find(v=> v.LanguageId == _authenticationData.LanguageId).Data;
            if (request.order[0].dir == "asc")
            {
                if (request.order[0].column == 1)
                    result = result.OrderBy(o => o.Id).ToList();
                else if (request.order[0].column == 2)
                    result = result.OrderBy(o => o.Name).ToList();
            }
            else
            {
                if (request.order[0].column == 1)
                    result = result.OrderByDescending(o => o.Id).ToList();
                else if (request.order[0].column == 2)
                    result = result.OrderByDescending(o => o.Name).ToList();
            }
            if (request.search != null && request.search.value != null)
                result = result.Where(v => v.Name.ToLower().Contains(request.search.value.ToLower())).ToList();

            return Json(new { data = result.Skip(request.start).Take(request.length).ToList(), recordsTotal = result.Count(), recordsFiltered = result.Count() });
        }

        [HttpPost]
        public ActionResult Save(FirmVariablesDto request)
        {
            DataResult<FirmVariablesDto> data = null;

            if (request.Id == 0)
            {
                request.RecordDate = DateTime.Now;
                request.LanguageId = _authenticationData.LanguageId;
                request.OrderNumber = 0;
                data = _firmVariablesService.Save(request);
            }
            else
            {
                data = _firmVariablesService.Update(request);
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
                    FirmVariablesDto firmVariables = _firmVariablesService.GetById(Convert.ToInt32(item)).Data;
                    _firmVariablesService.Delete(firmVariables);
                }
            }

            return Json("OK");
        }
    }
}