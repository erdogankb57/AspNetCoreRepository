using Inta.EntityFramework.Core.Abstract;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System;

namespace Inta.Kurumsal.Entity.Concrete
{
	[Table("SpecialtyType")]
	public class SpecialtyType: IEntity
	{
		public SpecialtyType()
		{
		}


		[Key]
		[Column("Id")]
		public int Id { get; set; }
		[Column("Name")]
		public string Name { get; set; }
	}
}
