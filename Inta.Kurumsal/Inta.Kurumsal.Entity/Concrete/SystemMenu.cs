using Inta.EntityFramework.Core.Abstract;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System;

namespace Inta.Kurumsal.Entity.Concrete
{
	[Table("SystemMenu")]
	public class SystemMenu: IEntity
	{
		public SystemMenu()
		{
		}


		[Key]
		[Column("Id")]
		public int Id { get; set; }
		[Column("SystemMenuId")]
		public int? SystemMenuId { get; set; }
		[Column("Name")]
		public string Name { get; set; }
		[Column("Explanation")]
		public string Explanation { get; set; }
		[Column("Link")]
		public string Link { get; set; }
		[Column("ControllerName")]
		public string ControllerName { get; set; }
		[Column("ActionName")]
		public string ActionName { get; set; }
		[Column("MenuIcon")]
		public string MenuIcon { get; set; }
		[Column("RecordDate")]
		public DateTime RecordDate { get; set; }
		[Column("IsActive")]
		public bool IsActive { get; set; }
	}
}
