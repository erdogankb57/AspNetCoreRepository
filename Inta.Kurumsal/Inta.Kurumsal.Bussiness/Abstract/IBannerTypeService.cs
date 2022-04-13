using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface IBannerTypeService
    {
        BannerTypeDto GetById(int id);
        List<BannerTypeDto> Find(Expression<Func<BannerType, bool>> filter = null);
        BannerTypeDto Save(BannerDto dto);
        BannerTypeDto Delete(BannerDto dto);

    }
}
