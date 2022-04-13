namespace Inta.Kurumsal.Entity.Concrete
{
    public class FormElementOptionsDto
	{
		public FormElementOptionsDto()
		{
		}

		public int Id { get; set; }
		public int? SystemUserId { get; set; }
		public int? LanguageId { get; set; }
		public int? FormElementId { get; set; }
		public string Name { get; set; }
		public string? Value { get; set; }
		public bool IsSelected { get; set; }
		public int? OrderNumber { get; set; }
		public DateTime RecordDate { get; set; }
		public bool IsActive { get; set; }
	}
}
