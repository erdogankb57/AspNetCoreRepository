using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface ICategoryService
    {
        DataResult<CategoryDto> GetById(int id);
        DataResult<List<CategoryDto>> Find(Expression<Func<Category, bool>> filter = null);
        DataResult<CategoryDto> Save(CategoryDto dto);
        DataResult<CategoryDto> Update(CategoryDto dto);
        DataResult<CategoryDto> Delete(CategoryDto dto);
        DataResult<CategoryDto> Get(Expression<Func<Category, bool>> filter = null);

    }
}
