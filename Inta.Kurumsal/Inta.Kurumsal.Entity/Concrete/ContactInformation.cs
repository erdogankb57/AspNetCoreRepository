using Inta.EntityFramework.Core.Abstract;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System;

namespace Inta.Kurumsal.Entity.Concrete
{
	[Table("ContactInformation")]
	public class ContactInformation: IEntity
	{
		public ContactInformation()
		{
		}


		[Key]
		[Column("Id")]
		public int Id { get; set; }
		[Column("SystemUserId")]
		public int SystemUserId { get; set; }
		[Column("LanguageId")]
		public int LanguageId { get; set; }
		[Column("Name")]
		public string Name { get; set; }
		[Column("Email")]
		public string Email { get; set; }
		[Column("Phone")]
		public string Phone { get; set; }
		[Column("Gsm")]
		public string Gsm { get; set; }
		[Column("Fax")]
		public string Fax { get; set; }
		[Column("Adress")]
		public string Adress { get; set; }
		[Column("Explanation")]
		public string Explanation { get; set; }
		[Column("GoogleMapFrame")]
		public string GoogleMapFrame { get; set; }
		[Column("GoogleMapLink")]
		public string GoogleMapLink { get; set; }
		[Column("GoogleMapX")]
		public string GoogleMapX { get; set; }
		[Column("GoogleMapY")]
		public string GoogleMapY { get; set; }
		[Column("Image")]
		public string Image { get; set; }
		[Column("QrCode")]
		public string QrCode { get; set; }
		[Column("FormSendEmail")]
		public string FormSendEmail { get; set; }
		[Column("OrderNumber")]
		public int OrderNumber { get; set; }
		[Column("RecordDate")]
		public DateTime? RecordDate { get; set; }
		[Column("IsActive")]
		public bool IsActive { get; set; }
	}
}
