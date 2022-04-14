using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface ILanguageService
    {
        DataResult<LanguageDto> GetById(int id);
        DataResult<List<LanguageDto>> Find(Expression<Func<Language, bool>> filter = null);
        DataResult<LanguageDto> Save(LanguageDto dto);
        DataResult<LanguageDto> Update(LanguageDto dto);
        DataResult<LanguageDto> Delete(LanguageDto dto);
        DataResult<LanguageDto> Get(Expression<Func<Language, bool>> filter = null);

    }
}
