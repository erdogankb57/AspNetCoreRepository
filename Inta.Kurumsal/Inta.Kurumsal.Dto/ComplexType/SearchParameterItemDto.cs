using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inta.Kurumsal.Dto.ComplexType
{
    public class SearchParameterItemDto
    {
        public string Key { get; set; }
        public object Value { get; set; }
        public int MergeOperator { get; set; }
        public int Operator { get; set; }
    }
}
