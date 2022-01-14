using Inta.EntityFramework.Core.Abstract;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System;

namespace Inta.Kurumsal.Entity.Concrete
{
	[Table("CategorySpecialty")]
	public class CategorySpecialty: IEntity
	{
		public CategorySpecialty()
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
		public int? CategoryId { get; set; }
		[Column("SpecialtyTypeId")]
		public int? SpecialtyTypeId { get; set; }
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
		[Column("TargetType")]
		public string? TargetType { get; set; }
		[Column("HomePageStatus")]
		public bool? HomePageStatus { get; set; }
		[Column("OrderNumber")]
		public int? OrderNumber { get; set; }
		[Column("RecordDate")]
		public DateTime RecordDate { get; set; }
		[Column("IsActive")]
		public bool IsActive { get; set; }
	}
}
