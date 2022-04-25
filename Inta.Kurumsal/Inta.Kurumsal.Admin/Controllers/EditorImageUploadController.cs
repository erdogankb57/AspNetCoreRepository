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

        public EditorImageUploadController()
        {

        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetImageList()
        {
            //var result = _fileUploadService.Find(v=> v.IsImage == true)?.Data.OrderByDescending(o => o.Id).Select(s => new
            //{
            //    Name = s.Id + "-" + s.FileName,
            //    FullName = $"/upload/Image/{s.Id}/{s.Width}/{s.Id}" + s.Extension
            //});

            //return Json(result);
            return Json("");
        }


        [HttpPost]
        public ActionResult Save(IFormFile Image)
        {
            if (Image != null)
            {
                var imageResult = ImageManager.ImageUploadSingleCopy(Image);
            }

            return Json("OK");
        }

    }
}