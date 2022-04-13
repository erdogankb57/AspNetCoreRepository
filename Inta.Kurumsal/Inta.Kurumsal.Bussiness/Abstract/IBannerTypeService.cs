using Inta.Kurumsal.Entity.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface IBannerTypeService
    {
        BannerTypeDto GetById(int id);
        List<BannerTypeDto> Find(Expression<Func<BannerType, bool>> filter = null);
    }
}
