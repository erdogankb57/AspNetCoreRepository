using Inta.EntityFramework.Core.Abstract;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inta.Kurumsal.Entity.Concrete
{
    [Table("RecordFile")]
	public class RecordFile : IEntity
	{
		public RecordFile()
		{
		}


		[Key]
		[Column("Id")]
		public int Id { get; set; }
		[Column("SystemUserId")]
		public int? SystemUserId { get; set; }
		[Column("LanguageId")]
		public int? LanguageId { get; set; }
		[Column("RecordId")]
		public int? RecordId { get; set; }
		[Column("Name")]
		public string Name { get; set; }
		[Column("ShortExplanation")]
		public string? ShortExplanation { get; set; }
		[Column("Explanation")]
		public string? Explanation { get; set; }
		[Column("FileName")]
		public string? FileName { get; set; }
		[Column("FileTagName")]
		public string? FileTagName { get; set; }
		[Column("FileTitleName")]
		public string? FileTitleName { get; set; }
		[Column("TargetId")]
		public string? TargetId { get; set; }
		[Column("HomePageStatus")]
		public bool HomePageStatus { get; set; }
		[Column("OrderNumber")]
		public int? OrderNumber { get; set; }
		[Column("RecordDate")]
		public DateTime RecordDate { get; set; }
		[Column("IsActive")]
		public bool IsActive { get; set; }
	}
}
