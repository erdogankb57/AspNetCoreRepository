using Inta.EntityFramework.Core.Abstract;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inta.Kurumsal.Entity.Concrete
{
    [Table("Category")]
    public class Category : IEntity
    {
        public Category()
        {
        }


        [Key]
        [Column("Id")]
        public int Id { get; set; }
        [Column("SystemUserId")]
        public int? SystemUserId { get; set; }
        [Column("LanguageId")]
        public int? LanguageId { get; set; }
        [Column("PageTypeId")]
        public int? PageTypeId { get; set; }
        [Column("CategoryId")]
        public int CategoryId { get; set; }
        [Column("Code")]
        public string? Code { get; set; }
        [Column("Name")]
        public string Name { get; set; }
        [Column("Title")]
        public string? Title { get; set; }
        [Column("CategoryUrl")]
        public string? CategoryUrl { get; set; }
        [Column("CategoryLink")]
        public string? CategoryLink { get; set; }
        [Column("MetaDecription")]
        public string? MetaDecription { get; set; }
        [Column("MetaKeywords")]
        public string? MetaKeywords { get; set; }

        [Column("FormGroupId")]
        public int? FormGroupId { get; set; }
        [Column("ShortExplanation")]
        public string? ShortExplanation { get; set; }
        [Column("CanBeDeleted")]
        public bool CanBeDeleted { get; set; }
        [Column("CanSubCategoryBeAdded")]
        public bool CanSubCategoryBeAdded { get; set; }
        [Column("Image")]
        public string? Image { get; set; }
        [Column("ImageTag")]
        public string? ImageTag { get; set; }
        [Column("ImageTitle")]
        public string? ImageTitle { get; set; }
        [Column("OrderNumber")]
        public int? OrderNumber { get; set; }
        [Column("RecordDate")]
        public DateTime? RecordDate { get; set; }
        [Column("IsActive")]
        public bool IsActive { get; set; }
        [Column("Explanation")]
        public string? Explanation { get; set; }
    }
}
