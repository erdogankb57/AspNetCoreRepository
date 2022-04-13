namespace Inta.Kurumsal.Entity.Concrete
{
    public class FormElementDto
    {
        public FormElementDto()
        {
        }

        public int Id { get; set; }
        public int? SystemUserId { get; set; }
        public int? LanguageId { get; set; }
        public int? CategoryId { get; set; }
        public int? FormGroupId { get; set; }
        public string Name { get; set; }
        public int? ElementTypeId { get; set; }
        public bool AllowNulls { get; set; }
        public int? OrderNumber { get; set; }
        public DateTime RecordDate { get; set; }
        public bool IsActive { get; set; }
    }
}
