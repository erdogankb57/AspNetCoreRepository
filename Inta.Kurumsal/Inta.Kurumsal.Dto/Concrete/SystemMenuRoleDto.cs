namespace Inta.Kurumsal.Entity.Concrete
{
    public class SystemMenuRoleDto
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
