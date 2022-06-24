using Inta.EntityFramework.Core.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Inta.EntityFramework.Core.DynamicExpression
{
    public class ExpressionBuilder<TEntity> where TEntity : IEntity
    {
        public Expression<Func<TEntity, bool>> CreateExpression(List<ExpressionModel> expressionModel)
        {
            ParameterExpression parameter = Expression.Parameter(typeof(TEntity), "item");
            //ExpressionBuilder<TEntity> expressionBuilder = new ExpressionBuilder<TEntity>();

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

            Expression<Func<TEntity, bool>> newFilter = Expression.Lambda<Func<TEntity, bool>>(expressionResult, parameter);

            return newFilter;
        }

        private Expression CreateExpressionItem(List<ExpressionItem> expressionItems, ParameterExpression parameterExpression)
        {
            //Expression metodlar kullanılırken gönderilen object değeri çok önemlidir. Tablodaki değer int ise gönderilen değerde int olmalıdır.
            MethodInfo stringContainsMethod = typeof(string).GetMethod("Contains", new[] { typeof(string) });
            MethodInfo stringStartsWithMethod = typeof(string).GetMethod("StartsWith", new[] { typeof(string) });
            MethodInfo stringEndsWithMethod = typeof(string).GetMethod("EndsWith", new[] { typeof(string) });

            List<Expression> EnpressionList = new List<Expression>();
            Expression expressionResult = null;
            foreach (var item in expressionItems)
            {
                Expression member = Expression.Property(parameterExpression, item.PropertyName.ToString());
                Expression constant = null;
                if (item.Operator == ExpressionOperators.Contains)
                    constant = Expression.Convert(Expression.Constant(item.Value), item.Value.GetType());
                else
                    constant = Expression.Convert(Expression.Constant(item.Value), member.Type);

                Expression condition = null;
                if (item.Operator == ExpressionOperators.Equals)
                    condition = Expression.Equal(member, constant);
                else if (item.Operator == ExpressionOperators.GreaterThan)
                    condition = Expression.GreaterThan(member, constant);
                else if (item.Operator == ExpressionOperators.GreaterThanOrEqual)
                    condition = Expression.GreaterThanOrEqual(member, constant);
                else if (item.Operator == ExpressionOperators.LessThan)
                    condition = Expression.LessThan(member, constant);
                else if (item.Operator == ExpressionOperators.LessThanOrEqual)
                    condition = Expression.LessThanOrEqual(member, constant);
                else if (item.Operator == ExpressionOperators.NotEquals)
                    condition = Expression.NotEqual(member, constant);
                else if (item.Operator == ExpressionOperators.Like)
                    condition = Expression.Call(member, stringContainsMethod, constant);
                else if (item.Operator == ExpressionOperators.StartsWith)
                    condition = Expression.Call(member, stringStartsWithMethod, constant);
                else if (item.Operator == ExpressionOperators.EndsWith)
                    condition = Expression.Call(member, stringEndsWithMethod, constant);
                else if (item.Operator == ExpressionOperators.Contains)
                    condition = Expression.Call(Expression.Constant(item.Value), item.Value.GetType().GetMethod("Contains",
      new Type[] { member.Type }), member);

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
