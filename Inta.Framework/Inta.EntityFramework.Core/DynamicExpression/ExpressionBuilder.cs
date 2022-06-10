using Inta.EntityFramework.Core.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Inta.EntityFramework.Core.DynamicExpression
{
    public class ExpressionBuilder<TEntity> where TEntity : IEntity
    {
        public Expression CreateExpression(List<ExpressionModel> expressionModel, ParameterExpression parameter)
        {
            Expression expressionResult = null;


            for (int i = 0; i < expressionModel.Count; i++)
            {
                if (i == 0)
                {
                    expressionResult = CreateExpressionItem(expressionModel[i].Item, parameter);
                }
                else
                {
                    if (expressionModel[i].MergeOperator == MergeOperator.And)
                        expressionResult = Expression.AndAlso(expressionResult, CreateExpressionItem(expressionModel[i].Item, parameter));
                    else if (expressionModel[i].MergeOperator == MergeOperator.Or)
                        expressionResult = Expression.Or(expressionResult, CreateExpressionItem(expressionModel[i].Item, parameter));
                }
            }

            return expressionResult;
        }

        private Expression CreateExpressionItem(List<ExpressionItem> expressionItems, ParameterExpression parameterExpression)
        {
            List<Expression> EnpressionList = new List<Expression>();
            Expression expressionResult = null;
            foreach (var item in expressionItems)
            {
                Expression whereProperty = Expression.Property(parameterExpression, item.PropertyName.ToString());
                Expression constant = Expression.Convert(Expression.Constant(item.Value), whereProperty.Type);
                Expression condition = Expression.Equal(whereProperty, constant);
                EnpressionList.Add(condition);
            }

            for (int i = 0; i < EnpressionList.Count; i++)
            {
                if (i == 0)
                {
                    expressionResult = EnpressionList[i];
                }
                else
                {
                    if (expressionItems[i].MergeOperator == MergeOperator.And)
                        expressionResult = Expression.AndAlso(EnpressionList[i], expressionResult);
                    else if (expressionItems[i].MergeOperator == MergeOperator.Or)
                        expressionResult = Expression.Or(EnpressionList[i], expressionResult);

                }
            }

            return expressionResult;
        }
    }
}
