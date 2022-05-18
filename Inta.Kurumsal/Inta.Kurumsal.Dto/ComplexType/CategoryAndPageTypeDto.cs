using Inta.Kurumsal.Dto.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inta.Kurumsal.Dto.ComplexType
{
    public class CategoryAndPageTypeDto: IDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string CategoryUrl { get; set; }
        public string CategoryLink { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
        public string ViewName { get; set; }
    }
}
