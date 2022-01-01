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

        public DataResult<IList<CategoryModel>> GetCategoryWithTree()
        {
            DataResult<IList<CategoryModel>> result = new DataResult<IList<CategoryModel>>();
            using (var context = new DefaultDataContext())
            {
                try
                {
                    result.Data = context.Set<CategoryModel>()
                        .FromSqlRaw<CategoryModel>("select  * from Category").ToList();
                    result.ResultType = Inta.EntityFramework.Core.Model.MessageType.Success;
                }
                catch (Exception ex)
                {
                    result.Data = new List<CategoryModel>();
                    result.ResultType = Inta.EntityFramework.Core.Model.MessageType.Error;
                    result.ErrorMessage = ex.ToString();
                }
            }
            return result;
        }


        public DataResult<List<CategoryModel>> FindCategoryList(Expression<Func<Category, bool>> filter)
        {
            DataResult<List<CategoryModel>> result = new DataResult<List<CategoryModel>>();
            using (var context = new DefaultDataContext())
            {
                var categorys = from pt in context.PageTypes
                           join ct in context.Categorys.Where(filter) on pt.Id equals ct.PageTypeId
                           select new CategoryModel
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
