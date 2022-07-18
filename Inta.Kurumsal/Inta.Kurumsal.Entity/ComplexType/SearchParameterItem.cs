using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inta.Kurumsal.Entity.ComplexType
{
    public class SearchParameterItem 
    {
        public string Key { get; set; }
        public object Value { get; set; }
        public int MergeOperator { get; set; }
        public int Operator { get; set; }
    }
}
