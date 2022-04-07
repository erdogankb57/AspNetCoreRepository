using Inta.EntityFramework.Core.Model;
using Inta.Framework.Extension.Common;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class BannerController : BaseController
    {
        private BannerManager bannerManager = null;
        private BannerTypeManager bannerTypeManager = null;
        private FileUploadManager fileUploadManager = null;
        public BannerController()
        {
            bannerManager = new BannerManager();
            bannerTypeManager = new BannerTypeManager();
            fileUploadManager = new FileUploadManager();
        }
        public ActionResult Index()
        {
            return PartialView("Index");
        }
        public ActionResult GetById(int? id)
        {
            DataResult<Banner> banner = new DataResult<Banner>();
            if (id.HasValue)
                banner = bannerManager.GetById(id.Value);

            return Json(banner);
        }

        public ActionResult Add(int? id)
        {
            Banner banner = new Banner();
            var bannerTypes = bannerTypeManager.Find();
            List<SelectListItem> list = new List<SelectListItem>();
            list.Add(new SelectListItem { Text = "Seçiniz", Value = "" });
            list.AddRange(bannerTypes.Data.Select(s => new SelectListItem { Text = s.Name, Value = s.Id.ToString() }).ToList());
            ViewBag.bannerTypes = list;
            if (id.HasValue)
                banner = bannerManager.GetById(id ?? 0).Data;

            return PartialView("Add", banner);
        }

        [HttpPost]
        public ActionResult GetList(DataTableAjaxPostModel request)
        {
            var result = bannerManager.Find().Data;
            List<Banner> banner = new List<Banner>();
            if (request.order[0].dir == "asc")
            {
                if (request.order[0].column == 1)
                    result = result?.OrderBy(o => o.Id)?.ToList();
                else if (request.order[0].column == 2)
                    result = result?.OrderBy(o => o.Image)?.ToList();
                else if (request.order[0].column == 3)
                    result = result?.OrderBy(o => o.Name)?.ToList();
                else if (request.order[0].column == 4)
                    result = result?.OrderBy(o => o.ShortExplanation)?.ToList();
                else if (request.order[0].column == 5)
                    result = result?.OrderBy(o => o.OrderNumber)?.ToList();
            }
            else
            {
                if (request.order[0].column == 1)
                    result = result?.OrderByDescending(o => o.Id)?.ToList();
                else if (request.order[0].column == 2)
                    result = result?.OrderBy(o => o.Image)?.ToList();
                else if (request.order[0].column == 3)
                    result = result?.OrderByDescending(o => o.Name)?.ToList();
                else if (request.order[0].column == 4)
                    result = result?.OrderByDescending(o => o.ShortExplanation)?.ToList();
                else if (request.order[0].column == 5)
                    result = result?.OrderByDescending(o => o.OrderNumber)?.ToList();
            }
            if (request.search != null && request.search.value != null)
                result = result.Where(v => v.Name.ToLower().Contains(request.search.value.ToLower()))?.ToList();

            return Json(new { data = result?.Skip(request.start)?.Take(request.length)?.ToList(), recordsTotal = result?.Count() ?? 0, recordsFiltered = result?.Count() ?? 0 });
        }

        [HttpPost]
        public ActionResult Save(Banner request, IFormFile FileImage)
        {
            DataResult<Banner> data = null;
            if (FileImage != null)
            {
                int imageSmallWidth = 100;
                int imageBigWidth = 500;

                //string filepath = ConfigurationManager.AppSettings["ImageUpload"].ToString();
                string filepath = "";

                var bannerType = bannerTypeManager.GetById(request.BannerTypeId ?? 0);
                if (bannerType != null && bannerType.Data != null)
                {
                    request.Image = "";
                    var imageResult = ImageManager.ImageBase64Upload(FileImage);

                    FileUpload fileUpload = new FileUpload
                    {
                        FileBase64Data = imageResult.FileBase64Data,
                        FileType = imageResult.FileType,
                        RecordDate = DateTime.Now,
                        Width = imageResult.Width,
                        Height = imageResult.Height
                    };

                    var fileUploadEntity = fileUploadManager.Save(fileUpload);
                    request.ImageId = fileUploadEntity.Data.Id;
                }

            }

            if (request.Id == 0)
            {
                request.LanguageId = ViewBag.LanguageId;
                request.SystemUserId = ViewBag.SystemUserId;

                data = bannerManager.Save(request);
            }
            else
            {
                var entity = bannerManager.GetById(request.Id);
                if (FileImage == null)
                    request.Image = entity.Data.Image;

                data = bannerManager.Update(request);
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
                    Banner banner = bannerManager.GetById(Convert.ToInt32(item)).Data;
                    bannerManager.Delete(banner);
                }
            }

            return Json("OK");
        }
        [HttpPost]
        public ActionResult ListUpdate([FromBody] List<Banner> listData)
        {
            foreach (var item in listData)
            {
                var banner = bannerManager.GetById(item.Id).Data;
                if (banner != null)
                {
                    banner.OrderNumber = item.OrderNumber;
                    bannerManager.Update(banner);

                }
            }

            return Json("OK");
        }
        public ActionResult DeleteImage(int id)
        {
            Banner banner = bannerManager.GetById(id).Data;
            banner.ImageId = null;
            bannerManager.Update(banner);

            return Json("OK");

        }
    }
}
