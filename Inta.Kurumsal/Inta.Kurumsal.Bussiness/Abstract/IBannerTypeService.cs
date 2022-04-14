using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface IBannerTypeService
    {
        DataResult<BannerTypeDto> GetById(int id);
        DataResult<List<BannerTypeDto>> Find(Expression<Func<BannerType, bool>> filter = null);
        DataResult<BannerTypeDto> Save(BannerTypeDto dto);
        DataResult<BannerTypeDto> Update(BannerTypeDto dto);
        DataResult<BannerTypeDto> Delete(BannerTypeDto dto);

    }
}
