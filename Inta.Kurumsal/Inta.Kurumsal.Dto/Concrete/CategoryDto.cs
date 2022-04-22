using Inta.Kurumsal.Dto.Abstract;

namespace Inta.Kurumsal.Dto.Concrete
{
    public class CategoryDto : IDto
    {
        public CategoryDto()
        {
        }


        public int Id { get; set; }
        public int? SystemUserId { get; set; }
        public int? LanguageId { get; set; }
        public int? PageTypeId { get; set; }
        public int CategoryId { get; set; }
        public string? Code { get; set; }
        public string Name { get; set; }
        public string? Title { get; set; }
        public string? CategoryUrl { get; set; }
        public string? CategoryLink { get; set; }
        public string? MetaDecription { get; set; }
        public string? MetaKeywords { get; set; }
        public int? FormGroupId { get; set; }
        public string? ShortExplanation { get; set; }
        public bool CanBeDeleted { get; set; }
        public bool CanSubCategoryBeAdded { get; set; }
        public string? Image { get; set; }
        public string? ImageTag { get; set; }
        public string? ImageTitle { get; set; }
        public int? ImageId { get; set; }
        public int? OrderNumber { get; set; }
        public DateTime? RecordDate { get; set; }
        public bool IsActive { get; set; }
        public string? Explanation { get; set; }
    }
}
