using AutoMapper;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Entity.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class BannerTypeService: IBannerTypeService
    {
        private IMapper _mapper = null;
        private BannerTypeManager bannerTypeManager = null;
        public BannerTypeService(IMapper mapper)
        {
            _mapper = mapper;
            bannerTypeManager = new BannerTypeManager();
        }

        public List<BannerTypeDto> Find(Expression<Func<BannerType, bool>> filter = null)
        {
            return _mapper.Map<List<BannerTypeDto>>(bannerTypeManager.Find(filter).Data);
        }

        public BannerTypeDto GetById(int id)
        {
            return _mapper.Map<BannerTypeDto>(bannerTypeManager.GetById(id).Data);
        }
    }
}
