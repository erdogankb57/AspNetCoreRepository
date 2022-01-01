using Inta.EntityFramework.Core.Abstract;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inta.Kurumsal.Entity.Concrete
{
    [Table("SystemRole")]
	public class SystemRole: IEntity
	{
		public SystemRole()
		{
		}


		[Key]
		[Column("Id")]
		public int Id { get; set; }
		[Column("Name")]
		public string Name { get; set; }
		[Column("Explanation")]
		public string Explanation { get; set; }
		[Column("RecordDate")]
		public DateTime RecordDate { get; set; }
		[Column("IsActive")]
		public bool IsActive { get; set; }
	}
}
