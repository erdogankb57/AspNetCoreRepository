using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Inta.Kurumsal.Admin.Models
{
    public class ContentImageRequestModel
    {
        public ContentImageRequestModel()
        {
            file = new List<IFormFile>();
        }
        public List<IFormFile> file { get; set; }
        public int ContentId { get; set; }
    }
}