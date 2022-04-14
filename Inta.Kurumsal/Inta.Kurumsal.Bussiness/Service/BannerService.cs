using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class BannerService : IBannerService
    {
        private IMapper _mapper = null;
        private BannerManager manager = null;
        public BannerService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new BannerManager();
        }

        public DataResult<BannerDto> Delete(BannerDto dto)
        {
            DataResult<BannerDto> result = null;
            var entity = _mapper.Map<Banner>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<BannerDto>
            {
                Data = _mapper.Map<BannerDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<BannerDto>> Find(Expression<Func<Banner, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<BannerDto>> result = new DataResult<List<BannerDto>>
            {
                Data = _mapper.Map<List<BannerDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<BannerDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<BannerDto> result = new DataResult<BannerDto>
            {
                Data = _mapper.Map<BannerDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<BannerDto> Save(BannerDto dto)
        {
            DataResult<BannerDto> result = null;
            var entity = _mapper.Map<Banner>(dto);
            var data = manager.Save(entity);
            result = new DataResult<BannerDto>
            {
                Data = _mapper.Map<BannerDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<BannerDto> Update(BannerDto dto)
        {
            DataResult<BannerDto> result = null;
            var entity = _mapper.Map<Banner>(dto);
            var data = manager.Update(entity);
            result = new DataResult<BannerDto>
            {
                Data = _mapper.Map<BannerDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
