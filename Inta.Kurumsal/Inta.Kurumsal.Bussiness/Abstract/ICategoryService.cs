using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.ComplexType;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface ICategoryService : IBaseService<CategoryDto, Category>
    {
        DataResult<List<CategoryAndPageTypeDto>> GetCategoryAndPageTypeList(int categoryId);

        DataResult<List<CategoryDto>> CategoryFilter(List<SearchParameterItemDto> filter);
    }
}
