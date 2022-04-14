using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface IFirmVariablesService
    {
        DataResult<FirmVariablesDto> GetById(int id);
        DataResult<List<FirmVariablesDto>> Find(Expression<Func<FirmVariables, bool>> filter = null);
        DataResult<FirmVariablesDto> Save(FirmVariablesDto dto);
        DataResult<FirmVariablesDto> Update(FirmVariablesDto dto);
        DataResult<FirmVariablesDto> Delete(FirmVariablesDto dto);
        DataResult<FirmVariablesDto> Get(Expression<Func<FirmVariables, bool>> filter = null);

    }
}
