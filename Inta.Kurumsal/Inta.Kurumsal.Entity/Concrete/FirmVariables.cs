using Inta.EntityFramework.Core.Abstract;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System;

namespace Inta.Kurumsal.Entity.Concrete
{
	[Table("FirmVariables")]
	public class FirmVariables: IEntity
	{
		public FirmVariables()
		{
		}


		[Key]
		[Column("Id")]
		public int Id { get; set; }
		[Column("LanguageId")]
		public int LanguageId { get; set; }
		[Column("Name")]
		public string Name { get; set; }
		[Column("Value")]
		public string? Value { get; set; }
		[Column("Description")]
		public string? Description { get; set; }
		[Column("OrderNumber")]
		public int? OrderNumber { get; set; }
		[Column("RecordDate")]
		public DateTime RecordDate { get; set; }
		[Column("IsActive")]
		public bool IsActive { get; set; }
	}
}
