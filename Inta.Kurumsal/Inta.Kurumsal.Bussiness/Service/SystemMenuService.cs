using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class SystemMenuService : ISystemMenuService
    {
        private IMapper _mapper = null;
        private SystemMenuManager manager = null;
        public SystemMenuService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new SystemMenuManager();
        }

        public DataResult<SystemMenuDto> Delete(SystemMenuDto dto)
        {
            DataResult<SystemMenuDto> result = null;
            var entity = _mapper.Map<SystemMenu>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<SystemMenuDto>
            {
                Data = _mapper.Map<SystemMenuDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<SystemMenuDto>> Find(Expression<Func<SystemMenu, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<SystemMenuDto>> result = new DataResult<List<SystemMenuDto>>
            {
                Data = _mapper.Map<List<SystemMenuDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<SystemMenuDto> Get(Expression<Func<SystemMenu, bool>> filter = null)
        {
            throw new NotImplementedException();
        }

        public DataResult<SystemMenuDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<SystemMenuDto> result = new DataResult<SystemMenuDto>
            {
                Data = _mapper.Map<SystemMenuDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<SystemMenuDto> Save(SystemMenuDto dto)
        {
            DataResult<SystemMenuDto> result = null;
            var entity = _mapper.Map<SystemMenu>(dto);
            var data = manager.Save(entity);
            result = new DataResult<SystemMenuDto>
            {
                Data = _mapper.Map<SystemMenuDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<SystemMenuDto> Update(SystemMenuDto dto)
        {
            DataResult<SystemMenuDto> result = null;
            var entity = _mapper.Map<SystemMenu>(dto);
            var data = manager.Update(entity);
            result = new DataResult<SystemMenuDto>
            {
                Data = _mapper.Map<SystemMenuDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
