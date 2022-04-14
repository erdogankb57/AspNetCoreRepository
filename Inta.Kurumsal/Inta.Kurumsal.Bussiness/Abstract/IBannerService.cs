using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface IBannerService
    {
        DataResult<BannerDto> GetById(int id);
        DataResult<List<BannerDto>> Find(Expression<Func<Banner, bool>> filter = null);
        DataResult<BannerDto> Save(BannerDto dto);
        DataResult<BannerDto> Update(BannerDto dto);
        DataResult<BannerDto> Delete(BannerDto dto);
        DataResult<BannerDto> Get(Expression<Func<Banner, bool>> filter = null);

    }
}
