using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class SystemActionService : ISystemActionService
    {
        private IMapper _mapper = null;
        private SystemActionManager manager = null;
        public SystemActionService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new SystemActionManager();
        }

        public DataResult<SystemActionDto> Delete(SystemActionDto dto)
        {
            DataResult<SystemActionDto> result = null;
            var entity = _mapper.Map<SystemAction>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<SystemActionDto>
            {
                Data = _mapper.Map<SystemActionDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<SystemActionDto>> Find(Expression<Func<SystemAction, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<SystemActionDto>> result = new DataResult<List<SystemActionDto>>
            {
                Data = _mapper.Map<List<SystemActionDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<SystemActionDto> Get(Expression<Func<SystemAction, bool>> filter = null)
        {
            throw new NotImplementedException();
        }

        public DataResult<SystemActionDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<SystemActionDto> result = new DataResult<SystemActionDto>
            {
                Data = _mapper.Map<SystemActionDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<SystemActionDto> Save(SystemActionDto dto)
        {
            DataResult<SystemActionDto> result = null;
            var entity = _mapper.Map<SystemAction>(dto);
            var data = manager.Save(entity);
            result = new DataResult<SystemActionDto>
            {
                Data = _mapper.Map<SystemActionDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<SystemActionDto> Update(SystemActionDto dto)
        {
            DataResult<SystemActionDto> result = null;
            var entity = _mapper.Map<SystemAction>(dto);
            var data = manager.Update(entity);
            result = new DataResult<SystemActionDto>
            {
                Data = _mapper.Map<SystemActionDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
