using Inta.Kurumsal.Dto.Abstract;

namespace Inta.Kurumsal.Dto.Concrete
{
    public class FirmVariablesDto : IDto
	{
		public FirmVariablesDto()
		{
		}

		public int Id { get; set; }
		public int LanguageId { get; set; }
		public string Name { get; set; }
		public string? Value { get; set; }
		public string? Description { get; set; }
		public int? OrderNumber { get; set; }
		public DateTime RecordDate { get; set; }
		public bool IsActive { get; set; }
	}
}
