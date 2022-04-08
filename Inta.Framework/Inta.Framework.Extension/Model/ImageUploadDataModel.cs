using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inta.Framework.Extension.Model
{
    public class ImageUploadDataModel
    {
        public string Extension { get; set; }
        public string FileName { get; set; }
        public string FileBase64Data { get; set; }
        public int Width { get; set; }
        public int Height { get; set; }
        public string ContentType { get; set; }

    }
}
