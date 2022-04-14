using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class SystemMenuRoleService : ISystemMenuRoleService
    {
        private IMapper _mapper = null;
        private SystemMenuRoleManager manager = null;
        public SystemMenuRoleService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new SystemMenuRoleManager();
        }

        public DataResult<SystemMenuRoleDto> Delete(SystemMenuRoleDto dto)
        {
            DataResult<SystemMenuRoleDto> result = null;
            var entity = _mapper.Map<SystemMenuRole>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<SystemMenuRoleDto>
            {
                Data = _mapper.Map<SystemMenuRoleDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<SystemMenuRoleDto>> Find(Expression<Func<SystemMenuRole, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<SystemMenuRoleDto>> result = new DataResult<List<SystemMenuRoleDto>>
            {
                Data = _mapper.Map<List<SystemMenuRoleDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<SystemMenuRoleDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<SystemMenuRoleDto> result = new DataResult<SystemMenuRoleDto>
            {
                Data = _mapper.Map<SystemMenuRoleDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<SystemMenuRoleDto> Save(SystemMenuRoleDto dto)
        {
            DataResult<SystemMenuRoleDto> result = null;
            var entity = _mapper.Map<SystemMenuRole>(dto);
            var data = manager.Save(entity);
            result = new DataResult<SystemMenuRoleDto>
            {
                Data = _mapper.Map<SystemMenuRoleDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<SystemMenuRoleDto> Update(SystemMenuRoleDto dto)
        {
            DataResult<SystemMenuRoleDto> result = null;
            var entity = _mapper.Map<SystemMenuRole>(dto);
            var data = manager.Update(entity);
            result = new DataResult<SystemMenuRoleDto>
            {
                Data = _mapper.Map<SystemMenuRoleDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
