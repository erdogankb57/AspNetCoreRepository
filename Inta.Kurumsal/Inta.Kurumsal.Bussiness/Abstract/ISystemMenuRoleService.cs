using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface ISystemMenuRoleService
    {
        DataResult<SystemMenuRoleDto> GetById(int id);
        DataResult<List<SystemMenuRoleDto>> Find(Expression<Func<SystemMenuRole, bool>> filter = null);
        DataResult<SystemMenuRoleDto> Save(SystemMenuRoleDto dto);
        DataResult<SystemMenuRoleDto> Update(SystemMenuRoleDto dto);
        DataResult<SystemMenuRoleDto> Delete(SystemMenuRoleDto dto);
        DataResult<SystemMenuRoleDto> Get(Expression<Func<SystemMenuRole, bool>> filter = null);

    }
}
