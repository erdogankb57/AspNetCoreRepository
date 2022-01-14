using Inta.EntityFramework.Core.Model;
using Inta.Framework.Extension.Common;
using Inta.Kurumsal.Admin.Models;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace Inta.Kurumsal.Admin.Controllers
{
    public class ContactInformationController : Controller
    {
        private ContactInformationManager manager = null;

        public ContactInformationController()
        {
            manager = new ContactInformationManager();
        }

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetById(int? id)
        {
            DataResult<ContactInformation> banner = new DataResult<ContactInformation>();
            if (id.HasValue)
                banner = manager.GetById(id.Value);

            return Json(banner);
        }
        public ActionResult Add(int? id)
        {
            ContactInformation contanct = new ContactInformation();

            if (id.HasValue)
                contanct = manager.GetById(id ?? 0).Data;

            return PartialView("Add", contanct);
        }

        [HttpPost]
        public ActionResult ListUpdate(List<ContactInformation> listData)
        {
            foreach (var item in listData)
            {
                var contact = manager.GetById(item.Id).Data;
                if (contact != null)
                {
                    contact.OrderNumber = item.OrderNumber;
                    manager.Update(contact);

                }
            }

            return Json("OK");
        }

        [HttpPost]
        public ActionResult GetDataList(DataTableAjaxPostModel request)
        {
            var result = manager.Find().Data;
            List<ContactInformation> contactInformations = new List<ContactInformation>();
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
        public ActionResult Save(ContactInformation request, IFormFile FileImage)
        {
            DataResult<ContactInformation> data = null;
            var contactInformation = manager.GetById(request.Id);
            //string filePath = ConfigurationManager.AppSettings["ImageUpload"].ToString();
            string filePath = "";

            if (FileImage != null)
                request.Image = ImageManager.ImageUploadSingleCopy(FileImage, filePath);
            else if (contactInformation.Data != null)
                request.Image = contactInformation.Data.Image;


            if (request.Id == 0)
            {
                request.LanguageId = ViewBag.LanguageId;
                request.SystemUserId = ViewBag.SystemUserId;
                request.RecordDate = DateTime.Now;

                data = manager.Save(request);
            }
            else
            {

                data = manager.Update(request);
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
                    ContactInformation contactInformation = manager.GetById(Convert.ToInt32(item)).Data;
                    manager.Delete(contactInformation);
                }
            }

            return Json("OK");
        }

        public ActionResult DeleteImage(int id)
        {
            ContactInformation contact = manager.GetById(id).Data;
            contact.Image = null;
            manager.Update(contact);

            return Json("OK");

        }
    }
}