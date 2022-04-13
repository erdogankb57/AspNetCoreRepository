namespace Inta.Kurumsal.Entity.Concrete
{
    public class SystemMenuDto
	{
		public SystemMenuDto()
		{
		}
		public int Id { get; set; }
		public int? SystemMenuId { get; set; }
		public string Name { get; set; }
		public string? Explanation { get; set; }
		public string? Link { get; set; }
		public string? ControllerName { get; set; }
		public string? ActionName { get; set; }
		public string? MenuIcon { get; set; }
		public DateTime RecordDate { get; set; }
		public bool IsActive { get; set; }
	}
}
