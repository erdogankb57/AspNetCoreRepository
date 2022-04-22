using Inta.Kurumsal.Dto.Abstract;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inta.Kurumsal.Dto.Concrete
{
    public class SystemActionRoleDto : IDto
    {
        public SystemActionRoleDto()
        {

        }

        public int Id { get; set; }
        public int SystemActionId { get; set; }
        public int SystemRoleId { get; set; }
    }
}
