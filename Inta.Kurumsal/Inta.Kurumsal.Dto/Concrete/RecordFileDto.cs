using Inta.Kurumsal.Dto.Abstract;

namespace Inta.Kurumsal.Dto.Concrete
{
    public class RecordFileDto : IDto
	{
		public RecordFileDto()
		{
		}
		public int Id { get; set; }
		public int? SystemUserId { get; set; }
		public int? LanguageId { get; set; }
		public int? RecordId { get; set; }
		public string Name { get; set; }
		public string? ShortExplanation { get; set; }
		public string? Explanation { get; set; }
		public string? FileName { get; set; }
		public string? FileTagName { get; set; }
		public string? FileTitleName { get; set; }
		public string? TargetId { get; set; }
		public bool HomePageStatus { get; set; }
		public int? OrderNumber { get; set; }
		public DateTime RecordDate { get; set; }
		public bool IsActive { get; set; }
	}
}
