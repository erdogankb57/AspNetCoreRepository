using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface IGeneralSettingsService
    {
        DataResult<GeneralSettingsDto> GetById(int id);
        DataResult<List<GeneralSettingsDto>> Find(Expression<Func<GeneralSettings, bool>> filter = null);
        DataResult<GeneralSettingsDto> Save(GeneralSettingsDto dto);
        DataResult<GeneralSettingsDto> Update(GeneralSettingsDto dto);
        DataResult<GeneralSettingsDto> Delete(GeneralSettingsDto dto);
    }
}
