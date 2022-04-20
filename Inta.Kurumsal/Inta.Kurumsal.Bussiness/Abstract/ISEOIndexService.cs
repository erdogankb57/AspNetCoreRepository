using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface ISEOIndexService
    {
        DataResult<SEOIndexDto> GetById(int id);
        DataResult<List<SEOIndexDto>> Find(Expression<Func<SEOIndex, bool>> filter = null);
        DataResult<SEOIndexDto> Save(SEOIndexDto dto);
        DataResult<SEOIndexDto> Update(SEOIndexDto dto);
        DataResult<SEOIndexDto> Delete(SEOIndexDto dto);
        DataResult<SEOIndexDto> Get(Expression<Func<SEOIndex, bool>> filter = null);

    }
}
