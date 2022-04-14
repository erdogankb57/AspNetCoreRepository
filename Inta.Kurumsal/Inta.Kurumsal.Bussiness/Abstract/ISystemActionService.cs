using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface ISystemActionService
    {
        DataResult<SystemActionDto> GetById(int id);
        DataResult<List<SystemActionDto>> Find(Expression<Func<SystemAction, bool>> filter = null);
        DataResult<SystemActionDto> Save(SystemActionDto dto);
        DataResult<SystemActionDto> Update(SystemActionDto dto);
        DataResult<SystemActionDto> Delete(SystemActionDto dto);
        DataResult<SystemActionDto> Get(Expression<Func<SystemAction, bool>> filter = null);

    }
}
