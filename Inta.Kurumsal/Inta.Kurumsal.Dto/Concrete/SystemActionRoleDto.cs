using System.ComponentModel.DataAnnotations.Schema;

namespace Inta.Kurumsal.Entity.Concrete
{
    public class SystemActionRoleDto
    {
        public SystemActionRoleDto()
        {

        }

        public int Id { get; set; }
        public int SystemActionId { get; set; }
        public int SystemRoleId { get; set; }
    }
}
