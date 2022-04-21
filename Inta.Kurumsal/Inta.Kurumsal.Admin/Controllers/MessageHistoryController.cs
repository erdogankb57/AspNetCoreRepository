using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class MessageHistoryController : BaseController
    {
        private IMessageHistoryService _service = null;
        private IAuthenticationData _authenticationData = null;
        public MessageHistoryController(IMessageHistoryService service, IAuthenticationData authenticationData)
        {
            _service = service;
            _authenticationData = authenticationData;
        }


        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ShowMessage(int? id)
        {
            MessageHistoryDto messageHistory = new MessageHistoryDto();

            if (id.HasValue)
            {
                messageHistory = _service.GetById(id ?? 0).Data;
                messageHistory.IsRead = true;
                _service.Update(messageHistory);

            }

            return PartialView("ShowMessage", messageHistory);
        }


        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            var result = _service.Find(v=> v.LanguageId == _authenticationData.LanguageId)?.Data;
            if (request.order[0].dir == "asc")
            {
                if (request.order[0].column == 1)
                    result = result?.OrderBy(o => o.Id)?.ToList();
                else if (request.order[0].column == 2)
                    result = result?.OrderBy(o => o.ClientName)?.ToList();
            }
            else
            {
                if (request.order[0].column == 1)
                    result = result?.OrderByDescending(o => o.Id)?.ToList();
                else if (request.order[0].column == 2)
                    result = result?.OrderByDescending(o => o.ClientName)?.ToList();
            }
            if (request.search != null && request.search.value != null)
                result = result?.Where(v => v.ClientName.ToLower().Contains(request.search.value.ToLower()))?.ToList();

            return Json(new { data = result?.Skip(request.start)?.Take(request.length)?.ToList(), recordsTotal = result?.Count() ?? 0, recordsFiltered = result?.Count() ?? 0 });
        }

        [HttpPost]
        public ActionResult Save(MessageHistoryDto request)
        {
            DataResult<MessageHistoryDto> data = null;

            if (request.Id == 0)
            {
                request.RecordDate = DateTime.Now;
                request.LanguageId = _authenticationData.LanguageId;
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
                    MessageHistoryDto data = _service.GetById(Convert.ToInt32(item)).Data;
                    _service.Delete(data);
                }
            }

            return Json("OK");
        }

        [HttpPost]
        public ActionResult ReadRecord(string ids)
        {
            if (!String.IsNullOrEmpty(ids))
            {
                foreach (var item in ids.Split(','))
                {
                    MessageHistoryDto data = _service.GetById(Convert.ToInt32(item)).Data;
                    data.IsRead = true;
                    _service.Update(data);
                }
            }

            return Json("OK");
        }
    }
}