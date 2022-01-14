using Inta.EntityFramework.Core.Abstract;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inta.Kurumsal.Entity.Concrete
{
    [Table("FormGroup")]
    public class FormGroup : IEntity
    {
        public FormGroup()
        {
        }


        [Key]
        [Column("Id")]
        public int Id { get; set; }
        [Column("SystemUserId")]
        public int? SystemUserId { get; set; }
        [Column("LanguageId")]
        public int? LanguageId { get; set; }
        [Column("Name")]
        public string Name { get; set; }
        [Column("Explanation")]
        public string? Explanation { get; set; }
        [Column("OrderNumber")]
        public int? OrderNumber { get; set; }
        [Column("RecordDate")]
        public DateTime RecordDate { get; set; }
        [Column("IsActive")]
        public bool IsActive { get; set; }
    }
}
