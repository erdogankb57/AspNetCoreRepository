using Inta.Framework.Extension.Common;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Microsoft.AspNetCore.Mvc;
using System.Drawing;

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
        public ActionResult CropImage(string imageName, int width, int height, int x, int y)
        {
            string imageUrl = Directory.GetCurrentDirectory().ToString() + _configuration.GetSection("FileUploadEditor").Value.ToString();

            // Create a new image at the cropped size
            Bitmap cropped = new Bitmap(width, height);

            //Load image from file
            using (Image image = Image.FromFile(imageUrl + imageName))
            {
                // Create a Graphics object to do the drawing, *with the new bitmap as the target*
                using (Graphics g = Graphics.FromImage(cropped))
                {
                    // Draw the desired area of the original into the graphics object
                    g.DrawImage(image, new Rectangle(0, 0, width, height), new Rectangle(x, y, width, height), GraphicsUnit.Pixel);
                    image.Dispose();
                    g.Dispose();
                    // Save the result
                    cropped.Save(imageUrl + imageName);
                }
            }
            return Json(new
            {
                ResultMessage = "OK",
                ImageUrl = _configuration.GetSection("FileUploadEditorShowFolder").Value.ToString() + imageName + "?d=" + DateTime.Now.ToString()
            });
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