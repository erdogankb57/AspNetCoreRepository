using Inta.EntityFramework.Core.Abstract;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System;

namespace Inta.Kurumsal.Entity.Concrete
{
    [Table("MessageHistory")]
    public class MessageHistory : IEntity
    {
        public MessageHistory()
        {
        }


        [Key]
        [Column("Id")]
        public int Id { get; set; }
        [Column("LanguageId")]
        public int? LanguageId { get; set; }
        [Column("MessageTypeId")]
        public int? MessageTypeId { get; set; }
        [Column("ClientName")]
        public string? ClientName { get; set; }
        [Column("ClientSurname")]
        public string? ClientSurname { get; set; }
        [Column("Email")]
        public string? Email { get; set; }
        [Column("Subject")]
        public string? Subject { get; set; }

        [Column("Phone")]
        public string? Phone { get; set; }
        [Column("Explanation")]
        public string? Explanation { get; set; }
        [Column("IsArchive")]
        public bool? IsArchive { get; set; }
        [Column("IsRead")]
        public bool? IsRead { get; set; }
        [Column("ArchiveDate")]
        public DateTime? ArchiveDate { get; set; }
        [Column("IpNumber")]
        public string? IpNumber { get; set; }
        [Column("RecordDate")]
        public DateTime? RecordDate { get; set; }
    }
}
