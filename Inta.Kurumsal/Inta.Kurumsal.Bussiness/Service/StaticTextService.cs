using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class StaticTextService : IStaticTextService
    {
        private IMapper _mapper = null;
        private StaticTextManager manager = null;
        public StaticTextService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new StaticTextManager();
        }

        public DataResult<StaticTextDto> Delete(StaticTextDto dto)
        {
            DataResult<StaticTextDto> result = null;
            var entity = _mapper.Map<StaticText>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<StaticTextDto>
            {
                Data = _mapper.Map<StaticTextDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<StaticTextDto>> Find(Expression<Func<StaticText, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<StaticTextDto>> result = new DataResult<List<StaticTextDto>>
            {
                Data = _mapper.Map<List<StaticTextDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<StaticTextDto> Get(Expression<Func<StaticText, bool>> filter = null)
        {
            throw new NotImplementedException();
        }

        public DataResult<StaticTextDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<StaticTextDto> result = new DataResult<StaticTextDto>
            {
                Data = _mapper.Map<StaticTextDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<StaticTextDto> Save(StaticTextDto dto)
        {
            DataResult<StaticTextDto> result = null;
            var entity = _mapper.Map<StaticText>(dto);
            var data = manager.Save(entity);
            result = new DataResult<StaticTextDto>
            {
                Data = _mapper.Map<StaticTextDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<StaticTextDto> Update(StaticTextDto dto)
        {
            DataResult<StaticTextDto> result = null;
            var entity = _mapper.Map<StaticText>(dto);
            var data = manager.Update(entity);
            result = new DataResult<StaticTextDto>
            {
                Data = _mapper.Map<StaticTextDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
