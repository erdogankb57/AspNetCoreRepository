using Inta.EntityFramework.Core.Model;
using Inta.Framework.Extension.Common;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class RecordImageController : BaseController
    {
        private RecordImageManager manager = null;
        private static int ContentId = 0;
        private GeneralSettingsManager settingsManager = null;
        private FileUploadManager fileUploadManager = null;
        public RecordImageController()
        {
            manager = new RecordImageManager();
            settingsManager = new GeneralSettingsManager();
            fileUploadManager = new FileUploadManager();
        }

        public ActionResult Index(int? Id)
        {
            ContentId = Id.HasValue ? Id.Value : 0;

            ViewBag.ContentId = Id.HasValue ? Id : 0;
            return View();
        }
        public ActionResult Add(int? id)
        {
            RecordImage specialty = new RecordImage();

            if (id.HasValue)
                specialty = manager.GetById(id ?? 0).Data;

            return PartialView("Add", specialty);
        }

        public ActionResult BulkAdd(int? id)
        {
            RecordImage specialty = new RecordImage();

            if (id.HasValue)
                specialty = manager.GetById(id ?? 0).Data;

            return PartialView("BulkAdd", specialty);
        }

        public ActionResult ImageBulkSave(List<IFormFile> file)
        {
            DataResult<List<RecordImage>> data = new DataResult<List<RecordImage>>();
            List<RecordImage> resultData = new List<RecordImage>();
            //string filePath = ConfigurationManager.AppSettings["ImageUpload"].ToString();
            string filePath = "";

            foreach (var item in file)
            {
                RecordImage content = new RecordImage { RecordId = ContentId, Name = "", RecordDate = DateTime.Now, OrderNumber = 0 }; ;

                if (item != null)
                {
                    var imageResult = ImageManager.ImageBase64Upload(item);

                    FileUpload fileUpload = new FileUpload
                    {
                        FileBase64Data = imageResult.FileBase64Data,
                        Extension = imageResult.Extension,
                        RecordDate = DateTime.Now,
                        Width = imageResult.Width,
                        Height = imageResult.Height,
                        ContentType = imageResult.ContentType,
                        FileName = imageResult.FileName,
                        IsImage = true
                    };

                    var fileUploadEntity = fileUploadManager.Save(fileUpload);
                    content.ImageId = fileUploadEntity.Data.Id;
                }

                var result = manager.Save(content);
                resultData.Add(result.Data);
            }


            data.Data = resultData;
            data.ResultType = EntityFramework.Core.Model.MessageTypeResult.Success;
            return Json(data);
        }


        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request, int? ContentId)
        {
            var result = manager.Find(v => v.RecordId == (ContentId.HasValue ? ContentId : v.RecordId)).Data;
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
        public ActionResult Save(RecordImage request, IFormFile ImageName)
        {
            DataResult<RecordImage> data = null;
            var content = manager.GetById(request.Id);
            //string filePath = ConfigurationManager.AppSettings["ImageUpload"].ToString();
            string filePath = "";

            if (ImageName != null)
            {
                var imageResult = ImageManager.ImageBase64Upload(ImageName);

                FileUpload fileUpload = new FileUpload
                {
                    FileBase64Data = imageResult.FileBase64Data,
                    Extension = imageResult.Extension,
                    RecordDate = DateTime.Now,
                    Width = imageResult.Width,
                    Height = imageResult.Height,
                    ContentType = imageResult.ContentType,
                    FileName = imageResult.FileName,
                    IsImage =true
                };

                var fileUploadEntity = fileUploadManager.Save(fileUpload);
                request.ImageId = fileUploadEntity.Data.Id;
            }

            if (request.Id == 0)
            {
                request.LanguageId = ViewBag.LanguageId;
                request.SystemUserId = ViewBag.SystemUserId;
                request.RecordDate = DateTime.Now;
                request.RecordId = ContentId;
                request.OrderNumber = 0;
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
                    RecordImage contentSpecialty = manager.GetById(Convert.ToInt32(item)).Data;
                    manager.Delete(contentSpecialty);
                }
            }

            return Json("OK");
        }

        public ActionResult DeleteImage(int id)
        {
            RecordImage contentImage = manager.GetById(id).Data;
            contentImage.ImageName = null;
            manager.Update(contentImage);

            return Json("OK");

        }

        [HttpPost]
        public ActionResult ListUpdate(List<RecordImage> listData)
        {
            foreach (var item in listData)
            {
                var contentImage = manager.GetById(item.Id).Data;
                if (contentImage != null)
                {
                    contentImage.OrderNumber = item.OrderNumber;
                    manager.Update(contentImage);

                }
            }

            return Json("OK");
        }
    }
}