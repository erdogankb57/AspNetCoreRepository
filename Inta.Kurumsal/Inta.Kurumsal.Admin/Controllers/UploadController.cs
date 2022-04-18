using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Microsoft.AspNetCore.Mvc;
using System.Drawing;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class UploadController : Controller
    {
        private IFileUploadService _fileUploadService = null;
        public UploadController(IFileUploadService fileUploadService)
        {
            _fileUploadService = fileUploadService;
        }
        public IActionResult Image(int Id, int width)
        {
            int height = 0;
            var uploadData = _fileUploadService.Get(v => v.Id == Id);
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

                    return File(stream.ToArray(), uploadData.Data.ContentType);
                }

                return File(bayt, uploadData.Data.ContentType);
            }
            return null;
        }

        public IActionResult File(int Id)
        {
            int height = 0;
            var uploadData = _fileUploadService.Get(v => v.Id == Id);
            if (uploadData.Data != null)
            {
                var bayt = Convert.FromBase64String(uploadData.Data.FileBase64Data);

                MemoryStream stream = new MemoryStream(bayt);

                return File(stream.ToArray(), uploadData.Data.ContentType);

            }
            return null;
        }
    }
}
