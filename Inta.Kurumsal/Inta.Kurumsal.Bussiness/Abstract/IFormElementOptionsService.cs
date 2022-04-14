using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface IFormElementOptionsService
    {
        DataResult<FormElementOptionsDto> GetById(int id);
        DataResult<List<FormElementOptionsDto>> Find(Expression<Func<FormElementOptions, bool>> filter = null);
        DataResult<FormElementOptionsDto> Save(FormElementOptionsDto dto);
        DataResult<FormElementOptionsDto> Update(FormElementOptionsDto dto);
        DataResult<FormElementOptionsDto> Delete(FormElementOptionsDto dto);
        DataResult<FormElementOptionsDto> Get(Expression<Func<FormElementOptions, bool>> filter = null);

    }
}
