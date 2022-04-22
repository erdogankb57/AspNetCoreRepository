using Inta.Kurumsal.Dto.Abstract;

namespace Inta.Kurumsal.Dto.Concrete
{
    public class CategorySpecialtyDto : IDto
	{
		public CategorySpecialtyDto()
		{
		}

		public int Id { get; set; }
		public int? SystemUserId { get; set; }
		public int? LanguageId { get; set; }
		public int? CategoryId { get; set; }
		public int? SpecialtyTypeId { get; set; }
		public string Name { get; set; }
		public string? ShortExplanation { get; set; }
		public string? Explanation { get; set; }
		public string? FileName { get; set; }
		public string? FileTagName { get; set; }
		public string? FileTitleName { get; set; }
		public string? TargetType { get; set; }
		public bool? HomePageStatus { get; set; }
		public int? OrderNumber { get; set; }
		public DateTime RecordDate { get; set; }
		public bool IsActive { get; set; }
	}
}
