using Inta.EntityFramework.Core.Abstract;
using Newtonsoft.Json.Linq;
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
        public Expression<Func<TEntity, bool>> CreateExpression(List<ExpressionItem> expressionItems)
        {
            ParameterExpression parameter = Expression.Parameter(typeof(TEntity), "item");
            //ExpressionBuilder<TEntity> expressionBuilder = new ExpressionBuilder<TEntity>();
            Expression expressionResult = null;

            expressionResult = CreateExpressionItem(expressionItems, parameter);

            Expression<Func<TEntity, bool>> newFilter = Expression.Lambda<Func<TEntity, bool>>(expressionResult, parameter);

            return newFilter;
        }

        private Expression CreateExpressionItem(List<ExpressionItem> expressionItems, ParameterExpression parameterExpression)
        {
            //Expression metodlar kullanılırken gönderilen object değeri çok önemlidir. Tablodaki değer int ise gönderilen değerde int olmalıdır.
            MethodInfo stringContainsMethod = typeof(string).GetMethod("Contains", new[] { typeof(string) });
            MethodInfo stringStartsWithMethod = typeof(string).GetMethod("StartsWith", new[] { typeof(string) });
            MethodInfo stringEndsWithMethod = typeof(string).GetMethod("EndsWith", new[] { typeof(string) });

            List<Expression> ExpressionList = new List<Expression>();
            Expression expressionResult = null;

            Expression<Func<TEntity, bool>> newFilter = null;
            newFilter = v => v.Id > 0;
            LambdaExpression lambdaExpression = null;

            try
            {
                foreach (var item in expressionItems)
                {
                    Expression member = Expression.Property(parameterExpression, item.PropertyName.ToString());
                    Expression constant = null;

                    if (item.Operator == ExpressionOperators.Contains)
                        constant = Expression.Convert(Expression.Constant(item.Value), item.Value.GetType());
                    else
                    {
                        constant = Expression.Convert(Expression.Constant(item.Value), member.Type);
                    }

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
                    {
                        if (item.Value.GetType() == typeof(JArray))
                        {
                            if (member.Type == typeof(Int32))
                            {
                                List<int> ob = new List<int>();
                                var val = ((Newtonsoft.Json.Linq.JContainer)item.Value);
                                foreach (var i in val)
                                {
                                    ob.Add(Convert.ToInt32(i));
                                }
                                condition = Expression.Call(Expression.Constant(ob), ob.GetType().GetMethod("Contains", new Type[] { member.Type }), member);
                            }
                            else if (member.Type == typeof(string))
                            {
                                List<string> ob = new List<string>();
                                var val = ((Newtonsoft.Json.Linq.JContainer)item.Value);
                                foreach (var i in val)
                                {
                                    ob.Add(i.ToString());
                                }
                                condition = Expression.Call(Expression.Constant(ob), ob.GetType().GetMethod("Contains", new Type[] { member.Type }), member);
                            }
                            else
                            {
                                throw new Exception("Contains karşılaştırma veri tipi hatası");
                            }
                        }
                        else
                            condition = Expression.Call(Expression.Constant(item.Value), item.Value.GetType().GetMethod("Contains", new Type[] { member.Type }), member);
                    }

                    //Alt queryler sisteme eklenir.
                    if (item.Item != null)
                    {
                        if (item.ItemMergeOperator == MergeOperator.None)
                            throw new Exception("ItemMerge operator none olmamalıdır.");
                        else if (item.ItemMergeOperator == MergeOperator.And)
                            condition = Expression.And(condition, this.CreateExpressionItem(item.Item, parameterExpression));
                        else if (item.ItemMergeOperator == MergeOperator.Or)
                            condition = Expression.Or(condition, this.CreateExpressionItem(item.Item, parameterExpression));
                    }


                    if (condition != null)
                        ExpressionList.Add(condition);
                }

                for (int i = 0; i < ExpressionList.Count; i++)
                {
                    if (i == 0)
                    {
                        expressionResult = Expression.And(Expression.NotEqual(Expression.Constant(1), Expression.Constant(2)), ExpressionList[i]);
                    }
                    else
                    {
                        if (expressionItems[i].MergeOperator == MergeOperator.And)
                            expressionResult = Expression.And(expressionResult, ExpressionList[i]);

                        else if (expressionItems[i].MergeOperator == MergeOperator.Or)
                            expressionResult = Expression.Or(expressionResult, ExpressionList[i]);

                    }

                }


            }
            catch (Exception ex)
            {

            }
            return expressionResult;
        }
    }
}
