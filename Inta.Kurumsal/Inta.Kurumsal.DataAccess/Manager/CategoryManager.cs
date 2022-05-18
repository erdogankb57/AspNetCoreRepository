using Inta.EntityFramework.Core.Base;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.DataAccess.DataContext;
using Inta.Kurumsal.Entity.ComplexType;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;

namespace Inta.Kurumsal.DataAccess.Manager
{
    public class CategoryManager : RepositoryBase<Category, DefaultDataContext>
    {
        public CategoryManager()
        {
        }



        public DataResult<IList<CategoryAndPageType>> GetCategoryWithTree()
        {
            DataResult<IList<CategoryAndPageType>> result = new DataResult<IList<CategoryAndPageType>>();
            using (var context = new DefaultDataContext())
            {
                try
                {
                    result.Data = context.Set<CategoryAndPageType>()
                        .FromSqlRaw<CategoryAndPageType>("select  * from Category").ToList();
                    result.ResultType = Inta.EntityFramework.Core.Model.MessageTypeResult.Success;
                }
                catch (Exception ex)
                {
                    result.Data = new List<CategoryAndPageType>();
                    result.ResultType = Inta.EntityFramework.Core.Model.MessageTypeResult.Error;
                    result.ErrorMessage = ex.ToString();
                }
            }
            return result;
        }


        public DataResult<List<CategoryAndPageType>> FindCategoryAndPageTypeList(int categoryId)
        {
            DataResult<List<CategoryAndPageType>> result = new DataResult<List<CategoryAndPageType>>();
            using (var context = new DefaultDataContext())
            {
                var categorys = from pt in context.PageTypes
                                join ct in context.Categorys on pt.Id equals ct.PageTypeId
                                where ct.Id == categoryId
                                select new CategoryAndPageType
                                {
                                    Id = ct.Id,
                                    CategoryLink = ct.CategoryLink,
                                    CategoryUrl = ct.CategoryUrl,
                                    Name = ct.Name,
                                    ControllerName = pt.ControllerName,
                                    ActionName = pt.ActionName,
                                    ViewName = pt.ViewName
                                };

                result.Data = categorys.ToList();
            }


            return result;
        }

        /*
        public DataResult<List<CategoryModel>> FindCategoryList(Expression<Func<Category, bool>> filter)
        {
            DataResult<List<CategoryModel>> result = new DataResult<List<CategoryModel>>();
            
            var data = this.Find(filter);
            result.ResultType = data.ResultType;
            result.Data = data.Data.Select(s => new CategoryModel
            {
                Id = s.Id,
                Name = s.Name,
                CategoryUrl = !string.IsNullOrEmpty(s.CategoryLink) ? s.CategoryLink : s.CategoryUrl
            }).ToList();

            return result;
        }
        */
    }
}
