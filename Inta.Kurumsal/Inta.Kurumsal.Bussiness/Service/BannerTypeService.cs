using AutoMapper;
using Inta.EntityFramework.Core.Model;
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

        public DataResult<BannerTypeDto> Delete(BannerTypeDto dto)
        {
            DataResult<BannerTypeDto> result = null;
            var entity = _mapper.Map<BannerType>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<BannerTypeDto>
            {
                Data = _mapper.Map<BannerTypeDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<BannerTypeDto>> Find(Expression<Func<BannerType, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<BannerTypeDto>> result = new DataResult<List<BannerTypeDto>>
            {
                Data = _mapper.Map<List<BannerTypeDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<BannerTypeDto> Get(Expression<Func<BannerType, bool>> filter = null)
        {
            throw new NotImplementedException();
        }

        public DataResult<BannerTypeDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<BannerTypeDto> result = new DataResult<BannerTypeDto>
            {
                Data = _mapper.Map<BannerTypeDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<BannerTypeDto> Save(BannerTypeDto dto)
        {
            DataResult<BannerTypeDto> result = null;
            var entity = _mapper.Map<BannerType>(dto);
            var data = manager.Save(entity);
            result = new DataResult<BannerTypeDto>
            {
                Data = _mapper.Map<BannerTypeDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<BannerTypeDto> Update(BannerTypeDto dto)
        {
            DataResult<BannerTypeDto> result = null;
            var entity = _mapper.Map<BannerType>(dto);
            var data = manager.Update(entity);
            result = new DataResult<BannerTypeDto>
            {
                Data = _mapper.Map<BannerTypeDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
