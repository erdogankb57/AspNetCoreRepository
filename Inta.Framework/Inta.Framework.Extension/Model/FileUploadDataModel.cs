﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inta.Framework.Extension.Model
{
    public class FileUploadDataModel
    {
        public string Extension { get; set; }
        public string FileName { get; set; }
        public string FileBase64Data { get; set; }
        public string ContentType { get; set; }
    }
}
