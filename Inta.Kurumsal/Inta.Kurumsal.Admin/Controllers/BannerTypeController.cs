using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Bussiness.Service;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class BannerTypeController : BaseController
    {
        private IBannerTypeService _bannerTypeService = null;
        private IBannerService _bannerService = null;

        public BannerTypeController(IBannerTypeService bannerTypeService, IBannerService bannerService)
        {
            _bannerTypeService = bannerTypeService;
            _bannerService = bannerService;
        }
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add(int? id)
        {
            BannerTypeDto banner = new BannerTypeDto();

            if (id.HasValue)
                banner = _bannerTypeService.GetById(id ?? 0).Data;

            return PartialView("Add", banner);
        }


        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            var result = _bannerTypeService.Find().Data;
            if (request.order[0].dir == "asc")
            {
                if (request.order[0].column == 1)
                    result = result.OrderBy(o => o.Id).ToList();
                else if (request.order[0].column == 2)
                    result = result.OrderBy(o => o.Name).ToList();
                else if (request.order[0].column == 3)
                    result = result.OrderBy(o => o.Description).ToList();
            }
            else
            {
                if (request.order[0].column == 1)
                    result = result.OrderByDescending(o => o.Id).ToList();
                else if (request.order[0].column == 2)
                    result = result.OrderByDescending(o => o.Name).ToList();
                else if (request.order[0].column == 3)
                    result = result.OrderByDescending(o => o.Description).ToList();
            }
            if (request.search != null && request.search.value != null)
                result = result.Where(v => v.Name.ToLower().Contains(request.search.value.ToLower())).ToList();

            return Json(new { data = result.Skip(request.start).Take(request.length).ToList(), recordsTotal = result.Count(), recordsFiltered = result.Count() });
        }

        [HttpPost]
        public ActionResult Save(BannerTypeDto request)
        {
           DataResult<BannerTypeDto> data = null;

            if (request.Id == 0)
            {
                request.LanguageId = ViewBag.LanguageId;
                request.SystemUserId = ViewBag.SystemUserId;

                data = _bannerTypeService.Save(request);
            }
            else
            {
                data = _bannerTypeService.Update(request);
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
                    BannerTypeDto bannerType = _bannerTypeService.GetById(Convert.ToInt32(item)).Data;

                    var bannerList = _bannerService.Find(v => v.BannerTypeId == bannerType.Id).Data;

                    if (bannerList != null)
                    {
                        foreach (var banner in bannerList?.ToList())
                            _bannerService.Delete(banner);
                    }

                    _bannerTypeService.Delete(bannerType);

                }
            }

            return Json("OK");
        }
    }
}
