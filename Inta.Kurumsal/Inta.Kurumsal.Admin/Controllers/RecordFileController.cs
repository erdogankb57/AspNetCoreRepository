using Inta.EntityFramework.Core.Model;
using Inta.Framework.Extension.Common;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class RecordFileController : BaseController
    {
        private IRecordFileService _service = null;
        private static int ContentId = 0;

        public RecordFileController(IRecordFileService service)
        {
            _service = service;
        }

        public ActionResult Index(int? Id)
        {
            ContentId = Id.HasValue ? Id.Value : 0;

            ViewBag.ContentId = Id.HasValue ? Id : 0;
            return View();
        }
        public ActionResult Add(int? id)
        {
            RecordFileDto specialty = new RecordFileDto();

            if (id.HasValue)
                specialty = _service.GetById(id ?? 0).Data;

            return PartialView("Add", specialty);
        }

        public ActionResult BulkAdd(int? id)
        {
            RecordFileDto specialty = new RecordFileDto();

            if (id.HasValue)
                specialty = _service.GetById(id ?? 0).Data;

            return PartialView("BulkAdd", specialty);
        }

        public ActionResult ImageBulkSave(List<IFormFile> file)
        {
            DataResult<List<RecordFileDto>> data = new DataResult<List<RecordFileDto>>();
            List<RecordFileDto> resultData = new List<RecordFileDto>();
            RecordFileDto contentFile = null;
            foreach (var item in file)
            {
                var fileName = FileManager.FileUpload(item);
                contentFile = new RecordFileDto { RecordId = ContentId, Name = "", FileName = fileName, RecordDate = DateTime.Now, OrderNumber = 0 };

                var result = _service.Save(contentFile);
                resultData.Add(result.Data);
            }



            data.Data = resultData;
            data.ResultType = EntityFramework.Core.Model.MessageTypeResult.Success;
            return Json(data);
        }

        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            var result = _service.Find(v => v.RecordId == ContentId).Data;
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

            return Json(new { data = result?.Skip(request.start)?.Take(request.length)?.ToList(), recordsTotal = result?.Count() ?? 0, recordsFiltered = result?.Count() ?? 0 });
        }

        [HttpPost]
        public ActionResult Save(RecordFileDto request, IFormFile FileName)
        {
            DataResult<RecordFileDto> data = null;
            var contentFile = _service.GetById(request.Id);

            if (FileName != null)
            {
                request.FileName = FileManager.FileUpload(FileName);
            }

            if (request.Id == 0)
            {
                request.LanguageId = ViewBag.LanguageId;
                request.SystemUserId = ViewBag.SystemUserId;
                request.RecordDate = DateTime.Now;
                request.RecordId = ContentId;

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
                    RecordFileDto contentSpecialty = _service.GetById(Convert.ToInt32(item)).Data;
                    _service.Delete(contentSpecialty);
                }
            }

            return Json("OK");
        }

        public ActionResult DeleteFile(int id)
        {
            var contentFile = _service.GetById(id).Data;
            contentFile.FileName = null;
            _service.Update(contentFile);

            return Json("OK");

        }

        [HttpPost]
        public ActionResult ListUpdate(List<RecordFileDto> listData)
        {
            foreach (var item in listData)
            {
                var contentFile = _service.GetById(item.Id).Data;
                if (contentFile != null)
                {
                    contentFile.OrderNumber = item.OrderNumber;
                    _service.Update(contentFile);

                }
            }

            return Json("OK");
        }
    }
}