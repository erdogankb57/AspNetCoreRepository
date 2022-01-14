using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class MessageHistoryController : BaseController
    {
        private MessageHistoryManager manager = null;
        public MessageHistoryController()
        {
            manager = new MessageHistoryManager();
        }


        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ShowMessage(int? id)
        {
            MessageHistory messageHistory = new MessageHistory();

            if (id.HasValue)
            {
                messageHistory = manager.GetById(id ?? 0).Data;
                messageHistory.IsRead = true;
                manager.Update(messageHistory);

            }

            return PartialView("ShowMessage", messageHistory);
        }


        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            var result = manager.Find()?.Data;
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
        public ActionResult Save(MessageHistory request)
        {
            DataResult<MessageHistory> data = null;

            if (request.Id == 0)
            {
                request.RecordDate = DateTime.Now;
                data = manager.Save(request);
            }
            else
            {
                data = manager.Update(request);
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
                    MessageHistory data = manager.GetById(Convert.ToInt32(item)).Data;
                    manager.Delete(data);
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
                    MessageHistory data = manager.GetById(Convert.ToInt32(item)).Data;
                    data.IsRead = true;
                    manager.Update(data);
                }
            }

            return Json("OK");
        }
    }
}