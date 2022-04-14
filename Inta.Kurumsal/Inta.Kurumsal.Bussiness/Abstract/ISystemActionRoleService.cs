using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface ISystemActionRoleService
    {
        DataResult<SystemActionRoleDto> GetById(int id);
        DataResult<List<SystemActionRoleDto>> Find(Expression<Func<SystemActionRole, bool>> filter = null);
        DataResult<SystemActionRoleDto> Save(SystemActionRoleDto dto);
        DataResult<SystemActionRoleDto> Update(SystemActionRoleDto dto);
        DataResult<SystemActionRoleDto> Delete(SystemActionRoleDto dto);
        DataResult<SystemActionRoleDto> Get(Expression<Func<SystemActionRole, bool>> filter = null);

    }
}
