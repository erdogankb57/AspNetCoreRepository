namespace Inta.Kurumsal.Entity.Concrete
{
    public class EditorTemplateDto
	{
		public EditorTemplateDto()
		{
		}

		public int Id { get; set; }
		public int? SystemUserId { get; set; }
		public int? LanguageId { get; set; }
		public string Name { get; set; }
		public string? HtmlContent { get; set; }
		public int? OrderNumber { get; set; }
		public DateTime RecordDate { get; set; }
		public bool IsActive { get; set; }
	}
}
