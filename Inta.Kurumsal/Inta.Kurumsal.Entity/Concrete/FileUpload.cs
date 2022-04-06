using Inta.EntityFramework.Core.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inta.Kurumsal.Entity.Concrete
{
    public class FileUpload : IEntity
    {
        public int Id { get; set; }
        public string? FileName { get; set; }
        public string? FileBase64Data { get; set; }
        public string? FileType { get; set; }
        public DateTime RecordDate { get; set; }
        public int? Width { get; set; }
        public int? Height { get; set; }

    }
}
