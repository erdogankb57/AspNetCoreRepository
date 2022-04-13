namespace Inta.Kurumsal.Entity.Concrete
{
    public class ContactInformationDto
	{
		public ContactInformationDto()
		{
		}
		public int Id { get; set; }
		public int? SystemUserId { get; set; }
		public int? LanguageId { get; set; }
		public string Name { get; set; }
		public string? Email { get; set; }
		public string? Phone { get; set; }
		public string? Gsm { get; set; }
		public string? Fax { get; set; }
		public string? Adress { get; set; }
		public string? Explanation { get; set; }
		public string? GoogleMapFrame { get; set; }
		public string? GoogleMapLink { get; set; }
		public string? GoogleMapX { get; set; }
		public string? GoogleMapY { get; set; }
		public string? Image { get; set; }
		public string? QrCode { get; set; }
		public string? FormSendEmail { get; set; }
		public int? OrderNumber { get; set; }
		public int? ImageId { get; set; }
		public DateTime? RecordDate { get; set; }
		public bool IsActive { get; set; }
	}
}
