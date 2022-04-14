using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface ISystemRoleService
    {
        DataResult<SystemRoleDto> GetById(int id);
        DataResult<List<SystemRoleDto>> Find(Expression<Func<SystemRole, bool>> filter = null);
        DataResult<SystemRoleDto> Save(SystemRoleDto dto);
        DataResult<SystemRoleDto> Update(SystemRoleDto dto);
        DataResult<SystemRoleDto> Delete(SystemRoleDto dto);
        DataResult<SystemRoleDto> Get(Expression<Func<SystemRole, bool>> filter = null);
    }
}
