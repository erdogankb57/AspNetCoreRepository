using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class SEOIndexController : BaseController
    {
        private ISEOIndexService _service = null;
        private IAuthenticationData _authenticationData = null;

        public SEOIndexController(ISEOIndexService service, IAuthenticationData authenticationData)
        {
            _service = service;
            _authenticationData = authenticationData;
        }

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add(int? id)
        {
            SEOIndexDto seoIndex = new SEOIndexDto();

            if (id.HasValue)
                seoIndex = _service.GetById(id ?? 0).Data;

            return PartialView("Add", seoIndex);
        }


        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            var result = _service.Find(v=> v.LanguageId == _authenticationData.LanguageId).Data;
            if (request.order[0].dir == "asc")
            {
                if (request.order[0].column == 1)
                    result = result.OrderBy(o => o.Id).ToList();
                else if (request.order[0].column == 2)
                    result = result.OrderBy(o => o.Url).ToList();
            }
            else
            {
                if (request.order[0].column == 1)
                    result = result.OrderByDescending(o => o.Id).ToList();
                else if (request.order[0].column == 2)
                    result = result.OrderByDescending(o => o.Url).ToList();
            }
            if (request.search != null && request.search.value != null)
                result = result.Where(v => v.Url.ToLower().Contains(request.search.value.ToLower())).ToList();

            return Json(new { data = result.Skip(request.start).Take(request.length).ToList(), recordsTotal = result.Count(), recordsFiltered = result.Count() });
        }

        [HttpPost]
        public ActionResult Save(SEOIndexDto request)
        {
            DataResult<SEOIndexDto> data = null;

            if (request.Id == 0)
            {
                request.SystemUserId = ViewBag.SystemUserId;
                request.LanguageId = _authenticationData.LanguageId;
                request.RecordDate = DateTime.Now;
                data = _service.Save(request);
            }
            else
            {
                data = _service.Update(request);
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
                    SEOIndexDto SEOIndex = _service.GetById(Convert.ToInt32(item)).Data;
                    _service.Delete(SEOIndex);
                }
            }

            return Json("OK");
        }
    }
}