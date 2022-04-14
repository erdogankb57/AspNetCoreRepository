using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface IStaticTextService
    {
        DataResult<StaticTextDto> GetById(int id);
        DataResult<List<StaticTextDto>> Find(Expression<Func<StaticText, bool>> filter = null);
        DataResult<StaticTextDto> Save(StaticTextDto dto);
        DataResult<StaticTextDto> Update(StaticTextDto dto);
        DataResult<StaticTextDto> Delete(StaticTextDto dto);
    }
}
