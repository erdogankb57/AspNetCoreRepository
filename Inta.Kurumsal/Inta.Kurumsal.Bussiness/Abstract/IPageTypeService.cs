using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface IPageTypeService
    {
        DataResult<PageTypeDto> GetById(int id);
        DataResult<List<PageTypeDto>> Find(Expression<Func<PageType, bool>> filter = null);
        DataResult<PageTypeDto> Save(PageTypeDto dto);
        DataResult<PageTypeDto> Update(PageTypeDto dto);
        DataResult<PageTypeDto> Delete(PageTypeDto dto);
        DataResult<PageTypeDto> Get(Expression<Func<PageType, bool>> filter = null);

    }
}
