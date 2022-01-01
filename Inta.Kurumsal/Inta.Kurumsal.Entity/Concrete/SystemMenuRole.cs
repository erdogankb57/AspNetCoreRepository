using Inta.EntityFramework.Core.Abstract;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inta.Kurumsal.Entity.Concrete
{
    [Table("SystemMenuRole")]
    public class SystemMenuRole : IEntity
    {
        public SystemMenuRole()
        {
        }


        [Key]
        [Column("Id")]
        public int Id { get; set; }
        [Column("SystemRoleId")]
        public int SystemRoleId { get; set; }
        [Column("SystemMenuId")]
        public int SystemMenuId { get; set; }
        [Column("RecordDate")]
        public DateTime RecordDate { get; set; }
    }
}
