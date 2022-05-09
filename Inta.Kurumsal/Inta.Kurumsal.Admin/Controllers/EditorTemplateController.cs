using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class EditorTemplateController : BaseController
    {
        private IEditorTemplateService _editorTemplateService = null;
        private IAuthenticationData _authenticationData = null;

        public EditorTemplateController(IEditorTemplateService editorTemplateService, IAuthenticationData authenticationData)
        {
            _editorTemplateService = editorTemplateService;
            _authenticationData = authenticationData;
        }

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add(int? id)
        {
            EditorTemplateDto editorTemplate = new EditorTemplateDto();

            if (id.HasValue)
                editorTemplate = _editorTemplateService.GetById(id ?? 0).Data;

            return PartialView("Add", editorTemplate);
        }


        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            var result = _editorTemplateService.Find(v => v.LanguageId == _authenticationData.LanguageId).Data;
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

        public ActionResult Save(EditorTemplateDto request)
        {
            DataResult<EditorTemplateDto> data = null;

            if (request.Id == 0)
            {
                request.LanguageId = _authenticationData.LanguageId;
                request.SystemUserId = ViewBag.SystemUserId;
                request.RecordDate = DateTime.Now;

                data = _editorTemplateService.Save(request);
            }
            else
            {
                data = _editorTemplateService.Update(request);
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
                    EditorTemplateDto editor = _editorTemplateService.GetById(Convert.ToInt32(item)).Data;
                    _editorTemplateService.Delete(editor);
                }
            }

            return Json("OK");
        }
    }
}