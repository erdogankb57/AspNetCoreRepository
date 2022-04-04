using Inta.EntityFramework.Core.Model;
using Inta.Framework.Extension.Common;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.ComplexType;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class FormElementController : BaseController
    {
        private FormElementManager manager = null;
        private FormGroupManager formGroupManager = null;

        public FormElementController()
        {
            manager = new FormElementManager();
            formGroupManager = new FormGroupManager();
        }

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add(int? id)
        {
            FormElement group = new FormElement();
            List<SelectListItem> formElementType = new List<SelectListItem>();
            formElementType.Add(new SelectListItem { Text = "Seçiniz", Value = "" });
            formElementType.AddRange(Enum.GetValues(typeof(FormElementType)).Cast<FormElementType>().Select(s => new
            SelectListItem
            {
                Text = s.GetStringValue(),
                Value = s.GetHashCode() == 0 ? "" : s.GetHashCode().ToString()
            }).ToList());

            ViewBag.formElementType = formElementType;

            List<SelectListItem> formGroup = new List<SelectListItem>();
            formGroup.Add(new SelectListItem { Text = "Seçiniz", Value = "" });

            var formGroupData = formGroupManager.Find()?.Data?.Select(s => new SelectListItem { Text = s.Name, Value = s.Id.ToString() })?.ToList();
            formGroup.AddRange(formGroupData);

            ViewBag.formGroup = formGroup;

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
        public ActionResult Save(FormElement request)
        {
            DataResult<FormElement> data = null;

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
                    FormElement formElement = manager.GetById(Convert.ToInt32(item)).Data;
                    manager.Delete(formElement);
                }
            }

            return Json("OK");
        }

        [HttpPost]
        public ActionResult ListUpdate(List<FormElement> listData)
        {
            foreach (var item in listData)
            {
                var formElement = manager.GetById(item.Id).Data;
                if (formElement != null)
                {
                    formElement.OrderNumber = item.OrderNumber;
                    manager.Update(formElement);

                }
            }

            return Json("OK");
        }
    }
}