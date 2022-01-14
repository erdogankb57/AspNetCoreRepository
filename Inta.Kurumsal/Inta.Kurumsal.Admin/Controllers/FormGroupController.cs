using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class FormGroupController : Controller
    {
        private FormGroupManager manager = null;

        public FormGroupController()
        {
            manager = new FormGroupManager();
        }

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add(int? id)
        {
            FormGroup group = new FormGroup();

            if (id.HasValue)
                group = manager.GetById(id ?? 0).Data;

            return PartialView("Add", group);
        }

        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            var result = manager.Find().Data;
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
        public ActionResult Save(FormGroup request)
        {
            DataResult<FormGroup> data = null;

            if (request.Id == 0)
            {
                request.LanguageId = ViewBag.LanguageId;
                request.SystemUserId = ViewBag.SystemUserId;
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
                    FormGroup formElement = manager.GetById(Convert.ToInt32(item)).Data;
                    manager.Delete(formElement);
                }
            }

            return Json("OK");
        }

        [HttpPost]
        public ActionResult ListUpdate(List<FormGroup> listData)
        {
            foreach (var item in listData)
            {
                var formGroup = manager.GetById(item.Id).Data;
                if (formGroup != null)
                {
                    formGroup.OrderNumber = item.OrderNumber;
                    manager.Update(formGroup);

                }
            }

            return Json("OK");
        }
    }
}