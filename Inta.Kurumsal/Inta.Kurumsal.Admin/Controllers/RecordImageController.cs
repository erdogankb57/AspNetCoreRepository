using Inta.EntityFramework.Core.Model;
using Inta.Framework.Extension.Common;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class RecordImageController : BaseController
    {
        private static int ContentId = 0;
        private IRecordImageService _service = null;
        private IGeneralSettingsService _settingsService = null;
        public RecordImageController(IRecordImageService service, IGeneralSettingsService settingsService)
        {
            _service = service;
            _settingsService = settingsService;
        }

        public ActionResult Index(int? Id)
        {
            ContentId = Id.HasValue ? Id.Value : 0;

            ViewBag.ContentId = Id.HasValue ? Id : 0;
            return View();
        }
        public ActionResult Add(int? id)
        {
            RecordImageDto specialty = new RecordImageDto();

            if (id.HasValue)
                specialty = _service.GetById(id ?? 0).Data;

            return PartialView("Add", specialty);
        }

        public ActionResult BulkAdd(int? id)
        {
            RecordImageDto specialty = new RecordImageDto();

            if (id.HasValue)
                specialty = _service.GetById(id ?? 0).Data;

            return PartialView("BulkAdd", specialty);
        }

        public ActionResult ImageBulkSave(List<IFormFile> file)
        {
            DataResult<List<RecordImageDto>> data = new DataResult<List<RecordImageDto>>();
            List<RecordImageDto> resultData = new List<RecordImageDto>();
            //string filePath = ConfigurationManager.AppSettings["ImageUpload"].ToString();
            string filePath = "";

            foreach (var item in file)
            {
                RecordImageDto content = new RecordImageDto { RecordId = ContentId, Name = "", RecordDate = DateTime.Now, OrderNumber = 0 }; ;

                if (item != null)
                {
                    var settings = _settingsService.Find().Data.FirstOrDefault();

                    if (settings != null)
                        content.ImageName = ImageManager.ImageUploadDoubleCopy(item, settings.ContentImageSmallWidth, settings.ContentImageBigWidth);
                    else
                        content.ImageName = ImageManager.ImageUploadDoubleCopy(item, 100, 500);
                }

                var result = _service.Save(content);
                resultData.Add(result.Data);
            }



            data.Data = resultData;
            data.ResultType = EntityFramework.Core.Model.MessageTypeResult.Success;
            return Json(data);
        }


        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request, int? ContentId)
        {
            var result = _service.Find(v => v.RecordId == (ContentId.HasValue ? ContentId : v.RecordId)).Data;
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
        public ActionResult Save(RecordImageDto request, IFormFile ImageName)
        {
            DataResult<RecordImageDto> data = null;
            var content = _service.GetById(request.Id);
            //string filePath = ConfigurationManager.AppSettings["ImageUpload"].ToString();
            string filePath = "";


            if (ImageName != null)
            {
                var settings = _settingsService.Find().Data.FirstOrDefault();

                if (settings != null)
                    request.ImageName = ImageManager.ImageUploadDoubleCopy(ImageName, settings.ContentImageSmallWidth, settings.ContentImageBigWidth);
                else
                    request.ImageName = ImageManager.ImageUploadDoubleCopy(ImageName, 100, 500);
            }

            if (request.Id == 0)
            {
                request.LanguageId = ViewBag.LanguageId;
                request.SystemUserId = ViewBag.SystemUserId;
                request.RecordDate = DateTime.Now;
                request.RecordId = ContentId;
                request.OrderNumber = 0;
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
                    RecordImageDto contentSpecialty = _service.GetById(Convert.ToInt32(item)).Data;
                    _service.Delete(contentSpecialty);
                }
            }

            return Json("OK");
        }

        public ActionResult DeleteImage(int id)
        {
            RecordImageDto contentImage = _service.GetById(id).Data;
            contentImage.ImageName = null;
            _service.Update(contentImage);

            return Json("OK");

        }

        [HttpPost]
        public ActionResult ListUpdate(List<RecordImageDto> listData)
        {
            foreach (var item in listData)
            {
                var contentImage = _service.GetById(item.Id).Data;
                if (contentImage != null)
                {
                    contentImage.OrderNumber = item.OrderNumber;
                    _service.Update(contentImage);

                }
            }

            return Json("OK");
        }
    }
}