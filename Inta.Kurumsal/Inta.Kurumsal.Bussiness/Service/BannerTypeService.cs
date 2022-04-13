using AutoMapper;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class BannerTypeService : IBannerTypeService
    {
        private IMapper _mapper = null;
        private BannerTypeManager manager = null;
        public BannerTypeService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new BannerTypeManager();
        }

        public BannerTypeDto Delete(BannerDto dto)
        {
            var entity = _mapper.Map<BannerType>(dto);
            return _mapper.Map<BannerTypeDto>(manager.Delete(entity).Data);
        }

        public List<BannerTypeDto> Find(Expression<Func<BannerType, bool>> filter = null)
        {
            return _mapper.Map<List<BannerTypeDto>>(manager.Find(filter).Data);
        }

        public BannerTypeDto GetById(int id)
        {
            return _mapper.Map<BannerTypeDto>(manager.GetById(id).Data);
        }

        public BannerTypeDto Save(BannerDto dto)
        {
            var entity = _mapper.Map<BannerType>(dto);
            return _mapper.Map<BannerTypeDto>(manager.Save(entity).Data);
        }
    }
}
