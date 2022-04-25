using Inta.EntityFramework.Core.Model;
using Inta.Framework.Extension.Common;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    [AuthorizationCheck]
    public class ContactInformationController : BaseController
    {
        private IContactInformationService _contactInformationService = null;
        private IFileUploadService _fileUploadService = null;
        private IAuthenticationData _authenticationData = null;
        public ContactInformationController(IContactInformationService contactInformationService, IFileUploadService fileUploadService, IAuthenticationData authenticationData)
        {
            _contactInformationService = contactInformationService;
            _fileUploadService = fileUploadService;
            _authenticationData = authenticationData;
        }

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetById(int? id)
        {
            DataResult<ContactInformationDto> banner = new DataResult<ContactInformationDto>();
            if (id.HasValue)
                banner = _contactInformationService.GetById(id.Value);

            return Json(banner);
        }
        public ActionResult Add(int? id)
        {
            ContactInformationDto contanct = new ContactInformationDto();

            if (id.HasValue)
                contanct = _contactInformationService.GetById(id ?? 0).Data;

            return PartialView("Add", contanct);
        }

        [HttpPost]
        public ActionResult ListUpdate(List<ContactInformationDto> listData)
        {
            foreach (var item in listData)
            {
                var contact = _contactInformationService.GetById(item.Id).Data;
                if (contact != null)
                {
                    contact.OrderNumber = item.OrderNumber;
                    _contactInformationService.Update(contact);

                }
            }

            return Json("OK");
        }

        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            var result = _contactInformationService.Find(v=> v.LanguageId == _authenticationData.LanguageId).Data;
            List<ContactInformationDto> contactInformations = new List<ContactInformationDto>();
            if (request.order[0].dir == "asc")
            {
                if (request.order[0].column == 1)
                    result = result.OrderBy(o => o.Id).ToList();
                else if (request.order[0].column == 2)
                    result = result.OrderBy(o => o.Name).ToList();
                else if (request.order[0].column == 3)
                    result = result.OrderBy(o => o.Email).ToList();
                else if (request.order[0].column == 4)
                    result = result.OrderBy(o => o.OrderNumber).ToList();
            }
            else
            {
                if (request.order[0].column == 1)
                    result = result.OrderByDescending(o => o.Id).ToList();
                else if (request.order[0].column == 2)
                    result = result.OrderByDescending(o => o.Name).ToList();
                else if (request.order[0].column == 3)
                    result = result.OrderByDescending(o => o.Email).ToList();
                else if (request.order[0].column == 4)
                    result = result.OrderByDescending(o => o.OrderNumber).ToList();
            }
            if (request.search != null && request.search.value != null)
                result = result.Where(v => v.Name.ToLower().Contains(request.search.value.ToLower())).ToList();

            return Json(new { data = result.Skip(request.start).Take(request.length).ToList(), recordsTotal = result.Count(), recordsFiltered = result.Count() });
        }

        [HttpPost]
        public ActionResult Save(ContactInformationDto request, IFormFile FileImage)
        {
            DataResult<ContactInformationDto> data = null;
            var contactInformation = _contactInformationService.GetById(request.Id);
            //string filePath = ConfigurationManager.AppSettings["ImageUpload"].ToString();

            if (FileImage != null)
                request.Image = ImageManager.ImageUploadSingleCopy(FileImage);
            else if (contactInformation.Data != null)
                request.Image = contactInformation.Data.Image;


            if (request.Id == 0)
            {
                request.LanguageId = _authenticationData.LanguageId;
                request.SystemUserId = ViewBag.SystemUserId;
                request.RecordDate = DateTime.Now;
                request.OrderNumber = 0;

                data = _contactInformationService.Save(request);
            }
            else
            {

                data = _contactInformationService.Update(request);
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
                    ContactInformationDto contactInformation = _contactInformationService.GetById(Convert.ToInt32(item)).Data;
                    _contactInformationService.Delete(contactInformation);
                }
            }

            return Json("OK");
        }

        public ActionResult DeleteImage(int id)
        {
            ContactInformationDto contact = _contactInformationService.GetById(id).Data;
            contact.Image = null;
            _contactInformationService.Update(contact);

            return Json("OK");

        }
    }
}