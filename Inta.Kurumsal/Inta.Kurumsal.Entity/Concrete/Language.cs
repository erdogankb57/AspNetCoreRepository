using Inta.EntityFramework.Core.Abstract;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System;

namespace Inta.Kurumsal.Entity.Concrete
{
	[Table("Language")]
	public class Language: IEntity
	{
		public Language()
		{
		}


		[Key]
		[Column("Id")]
		public int Id { get; set; }
		[Column("Code")]
		public string Code { get; set; }
		[Column("Name")]
		public string Name { get; set; }
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
