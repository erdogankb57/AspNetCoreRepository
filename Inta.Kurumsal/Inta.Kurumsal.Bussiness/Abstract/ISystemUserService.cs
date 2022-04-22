using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface ISystemUserService : IBaseService<SystemUserDto, SystemUser>
    {
        DataResult<List<SystemActionDto>> GetActiveRole(int systemRoleId);
    }
}
