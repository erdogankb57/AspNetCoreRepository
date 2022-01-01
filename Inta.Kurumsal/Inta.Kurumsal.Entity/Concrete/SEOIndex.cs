using Inta.EntityFramework.Core.Abstract;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System;

namespace Inta.Kurumsal.Entity.Concrete
{
	[Table("SEOIndex")]
	public class SEOIndex: IEntity
	{
		public SEOIndex()
		{
		}


		[Key]
		[Column("Id")]
		public int Id { get; set; }
		[Column("SystemUserId")]
		public int SystemUserId { get; set; }
		[Column("LanguageCode")]
		public string LanguageCode { get; set; }
		[Column("Url")]
		public string Url { get; set; }
		[Column("RedirectUrl")]
		public string RedirectUrl { get; set; }
		[Column("RecordDate")]
		public DateTime RecordDate { get; set; }
		[Column("IsActive")]
		public bool IsActive { get; set; }
	}
}
