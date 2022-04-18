using Inta.Framework.Extension.Common;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class EditorImageUploadController : BaseController
    {
        private IFileUploadService _fileUploadService = null;
        public EditorImageUploadController(IFileUploadService fileUploadService)
        {
            _fileUploadService = fileUploadService;
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetImageList()
        {
            var result = _fileUploadService.Find(v=> v.IsImage == true)?.Data.OrderByDescending(o => o.Id).Select(s => new
            {
                Name = s.Id + "-" + s.FileName,
                FullName = $"/upload/Image/{s.Id}/{s.Width}/{s.Id}" + s.Extension
            });

            return Json(result);
        }


        [HttpPost]
        public ActionResult Save(IFormFile Image)
        {
            if (Image != null)
            {
                //string filePath = ConfigurationManager.AppSettings["EditorImageUpload"].ToString();
                var imageResult = ImageManager.ImageBase64Upload(Image);

                FileUploadDto fileUpload = new FileUploadDto
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

                var fileUploadEntity = _fileUploadService.Save(fileUpload);
            }

            return Json("OK");
        }

    }
}