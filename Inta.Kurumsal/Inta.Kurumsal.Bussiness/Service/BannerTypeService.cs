using AutoMapper;
using Inta.EntityFramework.Core.Base;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.DataContext;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class BannerTypeService : IBannerTypeService
    {
        private IMapper _mapper = null;
        RepositoryBase<BannerType, DefaultDataContext> manager = null;
        UnitOfWork<DefaultDataContext> unitOfWork = null;
        public BannerTypeService(IMapper mapper)
        {
            _mapper = mapper;
            unitOfWork = new UnitOfWork<DefaultDataContext>();
            manager = unitOfWork.AddRepository<BannerType>();
        }

        public DataResult<BannerTypeDto> Delete(BannerTypeDto dto)
        {
            var entity = _mapper.Map<BannerType>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<BannerTypeDto>>(data);
            return result;
        }

        public DataResult<List<BannerTypeDto>> Find(Expression<Func<BannerType, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<BannerTypeDto>> result = _mapper.Map<DataResult<List<BannerTypeDto>>>(data);
            return result;
        }

        public DataResult<BannerTypeDto> Get(Expression<Func<BannerType, bool>> filter = null)
        {
            var data = manager.Get(filter);
            DataResult<BannerTypeDto> result = _mapper.Map<DataResult<BannerTypeDto>>(data);
            return result;
        }

        public DataResult<BannerTypeDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<BannerTypeDto> result = _mapper.Map<DataResult<BannerTypeDto>>(data);
            return result;
        }

        public DataResult<BannerTypeDto> Save(BannerTypeDto dto)
        {
            var entity = _mapper.Map<BannerType>(dto);
            var data = manager.Save(entity);
            var result = _mapper.Map<DataResult<BannerTypeDto>>(data);
            return result;
        }

        public DataResult<BannerTypeDto> Update(BannerTypeDto dto)
        {
            var entity = _mapper.Map<BannerType>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<BannerTypeDto>>(data);
            return result;
        }
    }
}
