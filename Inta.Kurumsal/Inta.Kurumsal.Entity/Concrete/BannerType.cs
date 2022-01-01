using Inta.EntityFramework.Core.Abstract;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System;

namespace Inta.Kurumsal.Entity.Concrete
{
	[Table("BannerType")]
	public class BannerType: IEntity
	{
		public BannerType()
		{
		}


		[Key]
		[Column("Id")]
		public int Id { get; set; }
		[Column("SystemUserId")]
		public int? SystemUserId { get; set; }
		[Column("LanguageId")]
		public int? LanguageId { get; set; }
		[Column("Name")]
		public string Name { get; set; }
		[Column("Description")]
		public string Description { get; set; }
		[Column("SmallImageWidth")]
		public int? SmallImageWidth { get; set; }
		[Column("BigImageWidth")]
		public int? BigImageWidth { get; set; }
		[Column("RecordDate")]
		public DateTime? RecordDate { get; set; }
		[Column("IsActive")]
		public bool? IsActive { get; set; }
	}
}
