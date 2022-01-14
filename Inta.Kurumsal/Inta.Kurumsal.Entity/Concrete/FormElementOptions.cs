using Inta.EntityFramework.Core.Abstract;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inta.Kurumsal.Entity.Concrete
{
    [Table("FormElementOptions")]
	public class FormElementOptions: IEntity
	{
		public FormElementOptions()
		{
		}


		[Key]
		[Column("Id")]
		public int Id { get; set; }
		[Column("SystemUserId")]
		public int? SystemUserId { get; set; }
		[Column("LanguageId")]
		public int? LanguageId { get; set; }
		[Column("FormElementId")]
		public int? FormElementId { get; set; }
		[Column("Name")]
		public string Name { get; set; }
		[Column("Value")]
		public string? Value { get; set; }
		[Column("IsSelected")]
		public bool IsSelected { get; set; }
		[Column("OrderNumber")]
		public int? OrderNumber { get; set; }
		[Column("RecordDate")]
		public DateTime RecordDate { get; set; }
		[Column("IsActive")]
		public bool IsActive { get; set; }
	}
}
