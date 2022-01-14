using Inta.EntityFramework.Core.Abstract;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System;

namespace Inta.Kurumsal.Entity.Concrete
{
	[Table("PageType")]
	public class PageType: IEntity
	{
		public PageType()
		{
		}


		[Key]
		[Column("Id")]
		public int Id { get; set; }
		[Column("SystemUserId")]
		public int? SystemUserId { get; set; }
		[Column("Code")]
		public string? Code { get; set; }
		[Column("Name")]
		public string Name { get; set; }
		[Column("ControllerName")]
		public string? ControllerName { get; set; }
		[Column("ActionName")]
		public string? ActionName { get; set; }
		[Column("ViewName")]
		public string? ViewName { get; set; }
		[Column("IsExplanationEnabled")]
		public bool IsExplanationEnabled { get; set; }
		[Column("IsShortExplanationEnabled")]
		public bool IsShortExplanationEnabled { get; set; }
		[Column("CanContentBeAdded")]
		public bool CanContentBeAdded { get; set; }
		[Column("IsMenuFirstRecord")]
		public bool IsMenuFirstRecord { get; set; }
		[Column("IsMenuFirstCategory")]
		public bool IsMenuFirstCategory { get; set; }
		[Column("IsPagingEnabled")]
		public bool IsPagingEnabled { get; set; }
		[Column("RecordDate")]
		public DateTime? RecordDate { get; set; }
		[Column("IsActive")]
		public bool IsActive { get; set; }
	}
}
