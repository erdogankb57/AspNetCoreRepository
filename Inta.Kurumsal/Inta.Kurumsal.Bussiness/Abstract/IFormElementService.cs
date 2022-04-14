using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface IFormElementService
    {
        DataResult<FormElementDto> GetById(int id);
        DataResult<List<FormElementDto>> Find(Expression<Func<FormElement, bool>> filter = null);
        DataResult<FormElementDto> Save(FormElementDto dto);
        DataResult<FormElementDto> Update(FormElementDto dto);
        DataResult<FormElementDto> Delete(FormElementDto dto);
        DataResult<FormElementDto> Get(Expression<Func<FormElement, bool>> filter = null);

    }
}
