using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface ISystemMenuService
    {
        DataResult<SystemMenuDto> GetById(int id);
        DataResult<List<SystemMenuDto>> Find(Expression<Func<SystemMenu, bool>> filter = null);
        DataResult<SystemMenuDto> Save(SystemMenuDto dto);
        DataResult<SystemMenuDto> Update(SystemMenuDto dto);
        DataResult<SystemMenuDto> Delete(SystemMenuDto dto);
    }
}
