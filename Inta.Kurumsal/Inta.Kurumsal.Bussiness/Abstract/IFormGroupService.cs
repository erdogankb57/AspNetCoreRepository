using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface IFormGroupService
    {
        DataResult<FormGroupDto> GetById(int id);
        DataResult<List<FormGroupDto>> Find(Expression<Func<FormGroup, bool>> filter = null);
        DataResult<FormGroupDto> Save(FormGroupDto dto);
        DataResult<FormGroupDto> Update(FormGroupDto dto);
        DataResult<FormGroupDto> Delete(FormGroupDto dto);
        DataResult<FormGroupDto> Get(Expression<Func<FormGroup, bool>> filter = null);

    }
}
