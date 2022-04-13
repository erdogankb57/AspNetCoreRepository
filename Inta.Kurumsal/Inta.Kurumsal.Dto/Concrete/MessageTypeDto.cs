namespace Inta.Kurumsal.Dto.Concrete
{
    public class MessageTypeDto
	{
		public MessageTypeDto()
		{
		}
		public int Id { get; set; }
		public int SystemUserId { get; set; }
		public string? LanguageCode { get; set; }
		public string Name { get; set; }
		public string? Description { get; set; }
		public DateTime? RecordDate { get; set; }
		public bool IsActive { get; set; }
	}
}
