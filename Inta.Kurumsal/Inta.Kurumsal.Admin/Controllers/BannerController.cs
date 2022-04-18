using Inta.EntityFramework.Core.Model;
using Inta.Framework.Extension.Common;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class BannerController : BaseController
    {
        private IBannerService _bannerService = null;
        private IBannerTypeService _bannerTypeService = null;
        private IFileUploadService _fileUploadService = null;
        public BannerController(IBannerService bannerService, IBannerTypeService bannerTypeService, IFileUploadService fileUploadService)
        {
            _bannerService = bannerService;
            _bannerTypeService = bannerTypeService;
            _fileUploadService = fileUploadService;
        }
        public ActionResult Index()
        {
            return PartialView("Index");
        }
        public ActionResult GetById(int? id)
        {
            DataResult<BannerDto> banner = new DataResult<BannerDto>();
            if (id.HasValue)
                banner = _bannerService.GetById(id.Value);

            return Json(banner);
        }

        public ActionResult Add(int? id)
        {
            BannerDto banner = new BannerDto();
            var bannerTypes = _bannerTypeService.Find();
            List<SelectListItem> list = new List<SelectListItem>();
            list.Add(new SelectListItem { Text = "Seçiniz", Value = "" });
            list.AddRange(bannerTypes.Data.Select(s => new SelectListItem { Text = s.Name, Value = s.Id.ToString() }).ToList());
            ViewBag.bannerTypes = list;
            if (id.HasValue)
                banner = _bannerService.GetById(id ?? 0).Data;

            return PartialView("Add", banner);
        }

        [HttpPost]
        public ActionResult GetList(DataTableAjaxPostModel request)
        {
            var result = _bannerService.Find().Data;
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
        public ActionResult Save(BannerDto request, IFormFile FileImage)
        {
            DataResult<BannerDto> data = null;
            if (FileImage != null)
            {
                var bannerType = _bannerTypeService.GetById(request.BannerTypeId ?? 0);
                if (bannerType != null && bannerType.Data != null)
                {
                    request.Image = "";
                    var imageResult = ImageManager.ImageBase64Upload(FileImage);

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
                    request.ImageId = fileUploadEntity.Data.Id;
                }

            }

            if (request.Id == 0)
            {
                request.LanguageId = ViewBag.LanguageId;
                request.SystemUserId = ViewBag.SystemUserId;

                data = _bannerService.Save(request);
            }
            else
            {
                var entity = _bannerService.GetById(request.Id);
                if (FileImage == null)
                    request.Image = entity.Data.Image;

                data = _bannerService.Update(request);
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
                    BannerDto banner = _bannerService.GetById(Convert.ToInt32(item)).Data;
                    _bannerService.Delete(banner);
                }
            }

            return Json("OK");
        }
        [HttpPost]
        public ActionResult ListUpdate([FromBody] List<BannerDto> listData)
        {
            foreach (var item in listData)
            {
                var banner = _bannerService.GetById(item.Id).Data;
                if (banner != null)
                {
                    banner.OrderNumber = item.OrderNumber;
                    _bannerService.Update(banner);

                }
            }

            return Json("OK");
        }
        public ActionResult DeleteImage(int id)
        {
            var banner = _bannerService.GetById(id).Data;
            banner.ImageId = null;
            _bannerService.Update(banner);

            return Json("OK");

        }
    }
}
