using Inta.EntityFramework.Core.Model;
using Inta.Framework.Extension.Common;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class RecordFileController : BaseController
    {
        private ContentFileManager manager = null;
        private static int ContentId = 0;

        public RecordFileController()
        {
            manager = new ContentFileManager();
        }

        public ActionResult Index(int? Id)
        {
            ContentId = Id.HasValue ? Id.Value : 0;

            ViewBag.ContentId = Id.HasValue ? Id : 0;
            return View();
        }
        public ActionResult Add(int? id)
        {
            RecordFile specialty = new RecordFile();

            if (id.HasValue)
                specialty = manager.GetById(id ?? 0).Data;

            return PartialView("Add", specialty);
        }

        public ActionResult BulkAdd(int? id)
        {
            RecordFile specialty = new RecordFile();

            if (id.HasValue)
                specialty = manager.GetById(id ?? 0).Data;

            return PartialView("BulkAdd", specialty);
        }

        public ActionResult ImageBulkSave(List<IFormFile> file)
        {
            DataResult<List<RecordFile>> data = new DataResult<List<RecordFile>>();
            List<RecordFile> resultData = new List<RecordFile>();
            RecordFile contentFile = null;
            foreach (var item in file)
            {
                var fileName = FileManager.FileUpload(item);
                contentFile = new RecordFile { RecordId = ContentId, Name = "", FileName = fileName, RecordDate = DateTime.Now, OrderNumber = 0 };

                var result = manager.Save(contentFile);
                resultData.Add(result.Data);
            }


            data.Data = resultData;
            data.ResultType = EntityFramework.Core.Model.MessageType.Success;
            return Json(data);
        }

        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            var result = manager.Find(v => v.RecordId == ContentId).Data;
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
        public ActionResult Save(RecordFile request, IFormFile FileName)
        {
            DataResult<RecordFile> data = null;
            var contentFile = manager.GetById(request.Id);

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
                    RecordFile contentSpecialty = manager.GetById(Convert.ToInt32(item)).Data;
                    manager.Delete(contentSpecialty);
                }
            }

            return Json("OK");
        }

        public ActionResult DeleteFile(int id)
        {
            var contentFile = manager.GetById(id).Data;
            contentFile.FileName = null;
            manager.Update(contentFile);

            return Json("OK");

        }

        [HttpPost]
        public ActionResult ListUpdate(List<RecordFile> listData)
        {
            foreach (var item in listData)
            {
                var contentFile = manager.GetById(item.Id).Data;
                if (contentFile != null)
                {
                    contentFile.OrderNumber = item.OrderNumber;
                    manager.Update(contentFile);

                }
            }

            return Json("OK");
        }
    }
}