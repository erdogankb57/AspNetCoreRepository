using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inta.EntityFramework.Core.DynamicExpression
{
    public class ExpressionModel
    {
        public string ExpressionName { get; set; }
        public ExpressionOperators Operator { get; set; }
        public List<ExpressionItem> Item { get; set; }
        public MergeOperator MergeOperator { get; set; }
    }

    public class ExpressionItem
    {
        public string PropertyName { get; set; }
        public ExpressionOperators Operator { get; set; }
        public object Value { get; set; }
        public List<ExpressionItem> Item { get; set; }
        public MergeOperator MergeOperator { get; set; }
    }

}
