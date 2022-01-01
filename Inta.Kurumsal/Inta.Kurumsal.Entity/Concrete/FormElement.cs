using Inta.EntityFramework.Core.Abstract;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inta.Kurumsal.Entity.Concrete
{
    [Table("FormElement")]
    public class FormElement : IEntity
    {
        public FormElement()
        {
        }


        [Key]
        [Column("Id")]
        public int Id { get; set; }
        [Column("SystemUserId")]
        public int SystemUserId { get; set; }
        [Column("LanguageId")]
        public int LanguageId { get; set; }
        [Column("CategoryId")]
        public int CategoryId { get; set; }


        [Column("FormGroupId")]
        public int FormGroupId { get; set; }
        [Column("Name")]
        public string Name { get; set; }

        [Column("ElementTypeId")]
        public int ElementTypeId { get; set; }
        [Column("AllowNulls")]
        public bool AllowNulls { get; set; }
        [Column("OrderNumber")]
        public int OrderNumber { get; set; }
        [Column("RecordDate")]
        public DateTime RecordDate { get; set; }
        [Column("IsActive")]
        public bool IsActive { get; set; }
    }
}
