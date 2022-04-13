using System.ComponentModel.DataAnnotations.Schema;

namespace Inta.Kurumsal.Entity.Concrete
{
    public class GeneralSettingsDto
    {
        public GeneralSettingsDto()
        {
        }
        public int Id { get; set; }
        public int? LanguageId { get; set; }
        public int? SystemUserId { get; set; }
        public string EmailIpAdress { get; set; }
        public string EmailAdress { get; set; }
        public int EmailPort { get; set; }
        public string EmailPassword { get; set; }
        public string DomainName { get; set; }
        public string CdnUrl { get; set; }
        public string ImageUploadPath { get; set; }
        public string FileUploadPath { get; set; }
        public string DeveloperName { get; set; }
        public string DeveloperEmail { get; set; }
        public int CategoryImageSmallWidth { get; set; }
        public int CategoryImageSmallHeight { get; set; }
        public int CategoryImageBigWidth { get; set; }
        public int CategoryImageBigHeight { get; set; }



        [Column("ContentImageSmallWidth")]
        public int ContentImageSmallWidth { get; set; }
        [Column("ContentImageSmallHeight")]
        public int ContentImageSmallHeight { get; set; }

        [Column("ContentImageBigWidth")]
        public int ContentImageBigWidth { get; set; }
        [Column("ContentImageBigHeight")]
        public int ContentImageBigHeight { get; set; }

    }
}
