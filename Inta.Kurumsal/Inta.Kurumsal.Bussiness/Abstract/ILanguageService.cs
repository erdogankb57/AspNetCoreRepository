using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface ILanguageService
    {
        DataResult<LanguageDto> GetById(int id);
        DataResult<List<LanguageDto>> Find(Expression<Func<Language, bool>> filter = null);
        DataResult<LanguageDto> Save(LanguageDto dto);
        DataResult<LanguageDto> Update(LanguageDto dto);
        DataResult<LanguageDto> Delete(LanguageDto dto);
    }
}
