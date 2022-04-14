using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface ICategoryService
    {
        DataResult<CategoryDto> GetById(int id);
        DataResult<List<CategoryDto>> Find(Expression<Func<Category, bool>> filter = null);
        DataResult<CategoryDto> Save(CategoryDto dto);
        DataResult<CategoryDto> Update(CategoryDto dto);
        DataResult<CategoryDto> Delete(CategoryDto dto);
    }
}
