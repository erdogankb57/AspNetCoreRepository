namespace Inta.Kurumsal.Entity.Concrete
{
    public class PageTypeDto
	{
		public PageTypeDto()
		{
		}

		public int Id { get; set; }
		public int? SystemUserId { get; set; }
		public string? Code { get; set; }
		public string Name { get; set; }
		public string? ControllerName { get; set; }
		public string? ActionName { get; set; }
		public string? ViewName { get; set; }
		public bool IsExplanationEnabled { get; set; }
		public bool IsShortExplanationEnabled { get; set; }
		public bool CanContentBeAdded { get; set; }
		public bool IsMenuFirstRecord { get; set; }
		public bool IsMenuFirstCategory { get; set; }
		public bool IsPagingEnabled { get; set; }
		public DateTime? RecordDate { get; set; }
		public bool IsActive { get; set; }
	}
}
