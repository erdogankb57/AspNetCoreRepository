using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inta.EntityFramework.Core.DynamicExpression
{
    public enum ExpressionOperators
    {
        None = 0,
        Equals = 1,
        NotEquals = 2,
        GreaterThan = 3,
        LessThan = 4,
        GreaterThanOrEqual = 5,
        LessThanOrEqual = 6,
        Like = 7,
        StartsWith = 8,
        EndsWith = 9,
        Contains = 10
    }
}
