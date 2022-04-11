using Inta.Framework.Extension.Common;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class EditorImageUploadController : BaseController
    {
        private FileUploadManager fileUploadManager = null;
        public EditorImageUploadController()
        {
            fileUploadManager = new FileUploadManager();
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetImageList()
        {
            var result = fileUploadManager.Find(v=> v.IsImage == true)?.Data.OrderByDescending(o => o.Id).Select(s => new
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
            }

            return Json("OK");
        }

    }
}