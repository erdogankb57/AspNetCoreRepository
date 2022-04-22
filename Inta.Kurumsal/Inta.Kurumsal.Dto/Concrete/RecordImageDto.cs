using Inta.Kurumsal.Dto.Abstract;

namespace Inta.Kurumsal.Dto.Concrete
{
    public class RecordImageDto : IDto
	{
		public RecordImageDto()
		{
		}
		public int Id { get; set; }
		public int? SystemUserId { get; set; }
		public int? LanguageId { get; set; }
		public int? RecordId { get; set; }
		public string Name { get; set; }
		public string? ShortExplanation { get; set; }
		public string? Explanation { get; set; }
		public string? ImageName { get; set; }
		public string? ImageTagName { get; set; }
		public string? ImageTitleName { get; set; }
		public int? TargetId { get; set; }
		public bool HomePageStatus { get; set; }
		public int? ImageId { get; set; }
		public int? OrderNumber { get; set; }
		public DateTime RecordDate { get; set; }
		public bool IsActive { get; set; }
	}
}
