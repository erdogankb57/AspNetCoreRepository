using Inta.Framework.Extension.Common;
using Inta.Kurumsal.Admin.Models;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class ImageUploadController : BaseController
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetImageList()
        {
            List<FileInfo> imageList = new List<FileInfo>();
            //string filepath = Server.MapPath(ConfigurationManager.AppSettings["EditorImageUpload"]).ToString();
            string filePath = "";

            DirectoryInfo d = new DirectoryInfo(filePath);

            string supportedExtensions = "*.jpg,*.gif,*.png,*.bmp,*.jpe,*.jpeg,*.wmf,*.emf,*.xbm,*.ico,*.eps,*.tif,*.tiff,*.g01,*.g02,*.g03,*.g04,*.g05,*.g06,*.g07,*.g08";

            // var result = d.GetFiles("*.jpg").Select(s => new { Name = s.Name, FullName = "/Contents/Upload/" + s.Name }).ToList();
            var result = d.GetFiles("*.*", SearchOption.AllDirectories).Where(s => supportedExtensions.Contains(Path.GetExtension(s.FullName).ToLower())).OrderByDescending(f => f.LastWriteTime).Select(s => new { Name = s.Name, FullName = filePath + s.Name }).ToList();

            return Json(result);
        }


        [HttpPost]
        public ActionResult Save(IFormFile Image)
        {
            string filePath = "";
            //string filepath = Server.MapPath(ConfigurationManager.AppSettings["EditorImageUpload"]).ToString();
            DirectoryInfo d = new DirectoryInfo(filePath);

            var result = d.GetFiles("*.*").Select(s => new { Name = s.Name, FullName = filePath + s.Name }).ToList();

            foreach (var item in result)
            {
                if (item.Name == Image.FileName)
                {
                    return Json("EXISTS");
                }
            }

            if (Image != null)
            {
                //string filePath = ConfigurationManager.AppSettings["EditorImageUpload"].ToString();
                ImageManager.ImageUploadSingleCopy(Image);
            }

            return Json("OK");
        }

    }
}