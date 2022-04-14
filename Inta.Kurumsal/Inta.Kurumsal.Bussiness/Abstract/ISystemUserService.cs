using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface ISystemUserService
    {
        DataResult<SystemUserDto> GetById(int id);
        DataResult<List<SystemUserDto>> Find(Expression<Func<SystemUser, bool>> filter = null);
        DataResult<SystemUserDto> Save(SystemUserDto dto);
        DataResult<SystemUserDto> Update(SystemUserDto dto);
        DataResult<SystemUserDto> Delete(SystemUserDto dto);
    }
}
