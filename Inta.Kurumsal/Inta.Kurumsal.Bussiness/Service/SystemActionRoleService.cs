using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class SystemActionRoleService : ISystemActionRoleService
    {
        private IMapper _mapper = null;
        private SystemActionRoleManager manager = null;
        public SystemActionRoleService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new SystemActionRoleManager();
        }

        public DataResult<SystemActionRoleDto> Delete(SystemActionRoleDto dto)
        {
            DataResult<SystemActionRoleDto> result = null;
            var entity = _mapper.Map<SystemActionRole>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<SystemActionRoleDto>
            {
                Data = _mapper.Map<SystemActionRoleDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<SystemActionRoleDto>> Find(Expression<Func<SystemActionRole, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<SystemActionRoleDto>> result = new DataResult<List<SystemActionRoleDto>>
            {
                Data = _mapper.Map<List<SystemActionRoleDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<SystemActionRoleDto> Get(Expression<Func<SystemActionRole, bool>> filter = null)
        {
            throw new NotImplementedException();
        }

        public DataResult<SystemActionRoleDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<SystemActionRoleDto> result = new DataResult<SystemActionRoleDto>
            {
                Data = _mapper.Map<SystemActionRoleDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<SystemActionRoleDto> Save(SystemActionRoleDto dto)
        {
            DataResult<SystemActionRoleDto> result = null;
            var entity = _mapper.Map<SystemActionRole>(dto);
            var data = manager.Save(entity);
            result = new DataResult<SystemActionRoleDto>
            {
                Data = _mapper.Map<SystemActionRoleDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<SystemActionRoleDto> Update(SystemActionRoleDto dto)
        {
            DataResult<SystemActionRoleDto> result = null;
            var entity = _mapper.Map<SystemActionRole>(dto);
            var data = manager.Update(entity);
            result = new DataResult<SystemActionRoleDto>
            {
                Data = _mapper.Map<SystemActionRoleDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
