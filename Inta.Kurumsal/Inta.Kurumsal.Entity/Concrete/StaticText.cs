using Inta.EntityFramework.Core.Abstract;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System;

namespace Inta.Kurumsal.Entity.Concrete
{
	[Table("StaticText")]
	public class StaticText: IEntity
	{
		public StaticText()
		{
		}


		[Key]
		[Column("Id")]
		public int Id { get; set; }
		[Column("SystemUserId")]
		public int SystemUserId { get; set; }
		[Column("Name")]
		public string Name { get; set; }
		[Column("Explanation")]
		public string Explanation { get; set; }
		[Column("OrderNumber")]
		public int OrderNumber { get; set; }
		[Column("RecordDate")]
		public DateTime RecordDate { get; set; }
		[Column("IsActive")]
		public bool IsActive { get; set; }
	}
}
