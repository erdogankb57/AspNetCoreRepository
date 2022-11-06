using Inta.EntityFramework.Core.Model;
using Inta.Framework.Extension.Common;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Bussiness.Common;
using Inta.Kurumsal.Dto.Concrete;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Caching.Memory;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class BannerController : BaseController
    {
        private IBannerService _bannerService;
        private IBannerTypeService _bannerTypeService;
        private IAuthenticationData _authenticationData;
        private IConfiguration _configuration;
        public BannerController(IBannerService bannerService, IBannerTypeService bannerTypeService, IAuthenticationData authenticationData, IConfiguration configuration)
        {
            _bannerService = bannerService;
            _bannerTypeService = bannerTypeService;
            _authenticationData = authenticationData;
            _configuration = configuration;

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
            if (id.HasValue)
                banner = _bannerService?.GetById(id ?? 0)?.Data ?? new BannerDto();

            return PartialView("Add", banner);
        }

        [HttpPost]
        public ActionResult GetList(DataTableAjaxPostModel request)
        {
            var result = _bannerService.Find(v => v.LanguageId == _authenticationData.LanguageId).Data;
            if (request?.order?[0].dir == "asc")
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
                if (request?.order?[0].column == 1)
                    result = result?.OrderByDescending(o => o.Id)?.ToList();
                else if (request?.order?[0].column == 2)
                    result = result?.OrderBy(o => o.Image)?.ToList();
                else if (request?.order?[0].column == 3)
                    result = result?.OrderByDescending(o => o.Name)?.ToList();
                else if (request?.order?[0].column == 4)
                    result = result?.OrderByDescending(o => o.ShortExplanation)?.ToList();
                else if (request?.order?[0].column == 5)
                    result = result?.OrderByDescending(o => o.OrderNumber)?.ToList();
            }
            if (request?.search != null && request.search.value != null)
                result = result?.Where(v => v.Name.ToLower().Contains(request.search.value.ToLower()))?.ToList();

            return Json(new { data = result?.Skip(request?.start ?? 0)?.Take(request?.length ?? 0)?.ToList(), recordsTotal = result?.Count() ?? 0, recordsFiltered = result?.Count() ?? 0 });
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
                    string filePath = Directory.GetCurrentDirectory().ToString() + _configuration.GetSection("ImagesUpload").Value.ToString();

                    int imageSmallWidth = bannerType.Data.SmallImageWidth ?? 100;
                    int imageBigWidth = bannerType.Data.BigImageWidth ?? 500;
                    request.Image = ImageManager.ImageUploadDoubleCopy(FileImage, imageSmallWidth, imageBigWidth, filePath);
                }
            }

            if (request.Id == 0)
            {
                request.LanguageId = _authenticationData.LanguageId;
                request.SystemUserId = ViewBag.SystemUserId;

                data = _bannerService.Save(request);
            }
            else
            {
                var entity = _bannerService.GetById(request.Id);
                if (FileImage == null)
                    request.Image = entity?.Data?.Image;

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
                    BannerDto banner = _bannerService?.GetById(Convert.ToInt32(item))?.Data ?? new BannerDto();
                    _bannerService?.Delete(banner);
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
            var banner = _bannerService.GetById(id).Data ?? new BannerDto();
            banner.Image = null;
            _bannerService.Update(banner);

            return Json("OK");

        }
    }
}
