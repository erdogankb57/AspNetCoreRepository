using Inta.Kurumsal.Dto.Abstract;

namespace Inta.Kurumsal.Dto.Concrete
{
    public class SystemMenuRoleDto : IDto
    {
        public SystemMenuRoleDto()
        {
        }

        public int Id { get; set; }
        public int SystemRoleId { get; set; }
        public int SystemMenuId { get; set; }
        public DateTime RecordDate { get; set; }
    }
}
