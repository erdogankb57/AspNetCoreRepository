using Inta.EntityFramework.Core.Abstract;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inta.Kurumsal.Entity.Concrete
{
    [Table("SystemMenuActionRole")]
    public class SystemMenuActionRole : IEntity
    {
        public SystemMenuActionRole()
        {

        }

        [Key]
        [Column("Id")]
        public int Id { get; set; }

        public int SystemMenuActionId { get; set; }

        public int SystemUserId { get; set; }
    }

}
