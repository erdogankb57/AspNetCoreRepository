using Inta.Kurumsal.Dto.Abstract;

namespace Inta.Kurumsal.Dto.Concrete
{
    public class SystemMenuActionRoleDto : IDto
    {
        public SystemMenuActionRoleDto()
        {

        }

        public int Id { get; set; }

        public int SystemMenuActionId { get; set; }

        public int SystemUserId { get; set; }
    }

}
