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
        private IConfiguration _configuration = null;
        public EditorImageUploadController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetImageList()
        {

            string imageFilePath = Directory.GetCurrentDirectory().ToString() + _configuration.GetSection("FileUploadEditor").Value.ToString();

            List<FileInfo> imageList = new List<FileInfo>();

            DirectoryInfo d = new DirectoryInfo(Directory.GetCurrentDirectory().ToString() + _configuration.GetSection("FileUploadEditor").Value.ToString());

            string supportedExtensions = "*.jpg,*.gif,*.png,*.bmp,*.jpe,*.jpeg,*.wmf,*.emf,*.xbm,*.ico,*.eps,*.tif,*.tiff,*.g01,*.g02,*.g03,*.g04,*.g05,*.g06,*.g07,*.g08";

            var result = d.GetFiles("*.*", SearchOption.AllDirectories).Where(s => supportedExtensions.Contains(Path.GetExtension(s.FullName).ToLower())).OrderByDescending(f => f.LastWriteTime).Select(s => new { Name = s.Name, FullName = _configuration.GetSection("FileUploadEditorShowFolder").Value.ToString() + s.Name }).ToList();

            return Json(result);
        }


        [HttpPost]
        public ActionResult Save(IFormFile Image)
        {
            if (Image != null)
            {
                string filePath = Directory.GetCurrentDirectory().ToString() + _configuration.GetSection("FileUploadEditor").Value.ToString();
                var imageResult = ImageManager.ImageUploadSingleCopy(Image, filePath);
            }

            return Json("OK");
        }

    }
}