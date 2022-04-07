using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.DataAccess.Manager;
using Microsoft.AspNetCore.Mvc;
using System.Drawing;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class FileController : Controller
    {
        private FileUploadManager fileUploadManager = null;
        public FileController()
        {
            fileUploadManager = new FileUploadManager();
        }
        public IActionResult Image(int Id, int width)
        {
            int height = 0;
            var uploadData = fileUploadManager.Get(v => v.Id == Id);
            if (uploadData.Data != null)
            {
                if (width > uploadData.Data.Width)
                {
                    width = uploadData.Data.Width ?? 0;
                }
                height = width * (uploadData.Data.Height ?? 0) / (uploadData.Data.Width ?? 0);
                var bayt = Convert.FromBase64String(uploadData.Data.FileBase64Data);

                MemoryStream stream = new MemoryStream(bayt);

                var image = Bitmap.FromStream(stream);

                using (var bit = new Bitmap(image, new Size { Width = width, Height = height }))
                {
                    stream = new MemoryStream();
                    bit.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                    return File(stream.ToArray(), "image/png");
                }


                return File(bayt, "image/png");
            }
            return null;
        }
    }
}
