namespace Inta.Kurumsal.Dto.Concrete
{
    public class RecordDto
	{
		public RecordDto()
		{
		}
		public int Id { get; set; }
		public int? SystemUserId { get; set; }
		public int? LanguageId { get; set; }
		public int CategoryId { get; set; }
		public string Name { get; set; }
		public string? RecordUrl { get; set; }
		public string? Title { get; set; }
		public string? MetaDescription { get; set; }
		public string? MetaKeywords { get; set; }
		public string? Url { get; set; }
		public string? ShortContent { get; set; }
		public string? Link { get; set; }
		public int? TargetType { get; set; }
		public string? ShortExplanation { get; set; }
		public string? Explanation { get; set; }
		public string? Image { get; set; }
		public int? ImageId { get; set; }
		public int? OrderNumber { get; set; }
		public DateTime? RecordDate { get; set; }
		public bool IsActive { get; set; }
	}
}
