namespace Inta.Kurumsal.Dto.Concrete
{
    public class SystemRoleDto
	{
		public SystemRoleDto()
		{
		}

		public int Id { get; set; }
		public string Name { get; set; }
		public string Explanation { get; set; }
		public DateTime RecordDate { get; set; }
		public bool IsActive { get; set; }
	}
}
