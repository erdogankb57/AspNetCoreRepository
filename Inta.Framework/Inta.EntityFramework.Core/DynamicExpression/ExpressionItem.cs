using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inta.EntityFramework.Core.DynamicExpression
{
    public class ExpressionItem
    {
        public string PropertyName { get; set; }
        public ExpressionOperators Operator { get; set; }
        public object Value { get; set; }
        public MergeOperator ItemMergeOperator { get; set; } = MergeOperator.None;
        public List<ExpressionItem> Item { get; set; } = null;
        public MergeOperator MergeOperator { get; set; }
    }

}
