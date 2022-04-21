namespace Inta.Kurumsal.Dto.Concrete
{
    public class SEOIndexDto
	{
		public SEOIndexDto()
		{
		}

		public int Id { get; set; }
		public int? SystemUserId { get; set; }
		public int? LanguageId { get; set; }
		public string? Url { get; set; }
		public string? RedirectUrl { get; set; }
		public DateTime? RecordDate { get; set; }
		public bool IsActive { get; set; }
	}
}
