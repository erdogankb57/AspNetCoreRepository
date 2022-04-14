using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class SEOIndexService : ISeoIndexService
    {
        private IMapper _mapper = null;
        private SEOIndexManager manager = null;
        public SEOIndexService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new SEOIndexManager();
        }

        public DataResult<SEOIndexDto> Delete(SEOIndexDto dto)
        {
            DataResult<SEOIndexDto> result = null;
            var entity = _mapper.Map<SEOIndex>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<SEOIndexDto>
            {
                Data = _mapper.Map<SEOIndexDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<SEOIndexDto>> Find(Expression<Func<SEOIndex, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<SEOIndexDto>> result = new DataResult<List<SEOIndexDto>>
            {
                Data = _mapper.Map<List<SEOIndexDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<SEOIndexDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<SEOIndexDto> result = new DataResult<SEOIndexDto>
            {
                Data = _mapper.Map<SEOIndexDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<SEOIndexDto> Save(SEOIndexDto dto)
        {
            DataResult<SEOIndexDto> result = null;
            var entity = _mapper.Map<SEOIndex>(dto);
            var data = manager.Save(entity);
            result = new DataResult<SEOIndexDto>
            {
                Data = _mapper.Map<SEOIndexDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<SEOIndexDto> Update(SEOIndexDto dto)
        {
            DataResult<SEOIndexDto> result = null;
            var entity = _mapper.Map<SEOIndex>(dto);
            var data = manager.Update(entity);
            result = new DataResult<SEOIndexDto>
            {
                Data = _mapper.Map<SEOIndexDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
