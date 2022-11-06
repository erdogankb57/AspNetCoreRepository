using Inta.EntityFramework.Core.Abstract;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inta.Kurumsal.Entity.Concrete
{
    [Table("GeneralSettings")]
    public class GeneralSettings : IEntity
    {
        public GeneralSettings()
        {

        }


        [Key]
        [Column("Id")]
        public int Id { get; set; }
        [Column("LanguageId")]
        public int? LanguageId { get; set; }
        [Column("SystemUserId")]
        public int? SystemUserId { get; set; }
        [Column("EmailIpAdress")]
        public string EmailIpAdress { get; set; }
        [Column("EmailAdress")]
        public string EmailAdress { get; set; }
        [Column("EmailPort")]
        public int EmailPort { get; set; }
        [Column("EmailPassword")]
        public string EmailPassword { get; set; }
        [Column("DomainName")]
        public string DomainName { get; set; }
        [Column("CdnUrl")]
        public string CdnUrl { get; set; }
        [Column("ImageUploadPath")]
        public string ImageUploadPath { get; set; }
        [Column("FileUploadPath")]
        public string FileUploadPath { get; set; }
        [Column("DeveloperName")]
        public string DeveloperName { get; set; }
        [Column("DeveloperEmail")]
        public string DeveloperEmail { get; set; }


        [Column("CategoryImageSmallWidth")]
        public int CategoryImageSmallWidth { get; set; }
        [Column("CategoryImageSmallHeight")]
        public int CategoryImageSmallHeight { get; set; }

        [Column("CategoryImageBigWidth")]
        public int CategoryImageBigWidth { get; set; }
        [Column("CategoryImageBigHeight")]
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
