namespace Inta.Kurumsal.Dto.Concrete
{
    public class MessageHistoryDto
    {
        public MessageHistoryDto()
        {
        }

        public int Id { get; set; }
        public int? LanguageId { get; set; }
        public int? MessageTypeId { get; set; }
        public string? ClientName { get; set; }
        public string? ClientSurname { get; set; }
        public string? Email { get; set; }
        public string? Subject { get; set; }
        public string? Phone { get; set; }
        public string? Explanation { get; set; }
        public bool? IsArchive { get; set; }
        public bool? IsRead { get; set; }
        public DateTime? ArchiveDate { get; set; }
        public string? IpNumber { get; set; }
        public DateTime? RecordDate { get; set; }
    }
}
