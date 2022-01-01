using Inta.EntityFramework.Core.Abstract;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inta.Kurumsal.Entity.Concrete
{
    [Table("SystemActionRole")]
    public class SystemActionRole : IEntity
    {
        public SystemActionRole()
        {

        }

        public int Id { get; set; }
        public int SystemActionId { get; set; }
        public int SystemRoleId { get; set; }
    }
}
