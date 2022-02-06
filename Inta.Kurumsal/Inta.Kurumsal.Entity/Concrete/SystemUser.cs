using Inta.EntityFramework.Core.Abstract;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inta.Kurumsal.Entity.Concrete
{
    [Table("SystemUser")]
	public class SystemUser: IEntity
	{
		public SystemUser()
		{
		}


		[Key]
		[Column("Id")]
		public int Id { get; set; }
		[Column("SystemUserId")]
		public int SystemUserId { get; set; }
		[Column("SystemRoleId")]
		public int SystemRoleId { get; set; }
		[Column("Name")]
		public string Name { get; set; }
		[Column("SurName")]
		public string? SurName { get; set; }
		[Column("UserName")]
		public string? UserName { get; set; }
		[Column("Password")]
		public string? Password { get; set; }
		[Column("Email")]
		public string? Email { get; set; }
		[Column("Phone")]
		public string? Phone { get; set; }
		[Column("Address")]
		public string? Address { get; set; }
		[Column("RecordDate")]
		public DateTime RecordDate { get; set; }
		[Column("IsActive")]
		public bool IsActive { get; set; }
		[Column("IsAdmin")]
        public bool IsAdmin { get; set; }
    }
}
