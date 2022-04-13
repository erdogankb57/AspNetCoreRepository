namespace Inta.Kurumsal.Entity.Concrete
{
    public class FormGroupDto 
    {
        public FormGroupDto()
        {
        }

        public int Id { get; set; }
        public int? SystemUserId { get; set; }
        public int? LanguageId { get; set; }
        public string Name { get; set; }
        public string? Explanation { get; set; }
        public int? OrderNumber { get; set; }
        public DateTime RecordDate { get; set; }
        public bool IsActive { get; set; }
    }
}
