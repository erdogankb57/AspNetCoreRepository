using Inta.EntityFramework.Core.Abstract;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inta.Kurumsal.Entity.Concrete
{
    [Table("Record")]
	public class Record: IEntity
	{
		public Record()
		{
		}


		[Key]
		[Column("Id")]
		public int Id { get; set; }
		[Column("SystemUserId")]
		public int? SystemUserId { get; set; }
		[Column("LanguageId")]
		public int? LanguageId { get; set; }
		[Column("CategoryId")]
		public int CategoryId { get; set; }
		[Column("Name")]
		public string Name { get; set; }
		[Column("RecordUrl")]
		public string RecordUrl { get; set; }
		[Column("Title")]
		public string Title { get; set; }
		[Column("MetaDescription")]
		public string MetaDescription { get; set; }
		[Column("MetaKeywords")]
		public string MetaKeywords { get; set; }
		[Column("Url")]
		public string Url { get; set; }
		[Column("ShortContent")]
		public string ShortContent { get; set; }
		[Column("Link")]
		public string Link { get; set; }
		[Column("TargetType")]
		public int TargetType { get; set; }
		[Column("ShortExplanation")]
		public string ShortExplanation { get; set; }
		[Column("Explanation")]
		public string Explanation { get; set; }
		[Column("Image")]
		public string Image { get; set; }
		[Column("OrderNumber")]
		public int? OrderNumber { get; set; }
		[Column("RecordDate")]
		public DateTime? RecordDate { get; set; }
		[Column("IsActive")]
		public bool IsActive { get; set; }
	}
}
