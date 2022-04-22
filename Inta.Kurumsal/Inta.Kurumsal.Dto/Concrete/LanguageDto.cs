using Inta.Kurumsal.Dto.Abstract;

namespace Inta.Kurumsal.Dto.Concrete
{
    public class LanguageDto : IDto
	{
		public LanguageDto()
		{
		}
		public int Id { get; set; }
		public string Code { get; set; }
		public string Name { get; set; }
		public string? Description { get; set; }
		public int? OrderNumber { get; set; }
		public DateTime RecordDate { get; set; }
		public bool IsActive { get; set; }
	}
}
