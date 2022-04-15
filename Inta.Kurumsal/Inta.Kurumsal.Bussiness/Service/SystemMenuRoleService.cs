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
            var entity = _mapper.Map<SystemMenuRole>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<SystemMenuRoleDto>>(data);
            return result;
        }

        public DataResult<List<SystemMenuRoleDto>> Find(Expression<Func<SystemMenuRole, bool>> filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<SystemMenuRoleDto>>>(data);
            return result;
        }

        public DataResult<SystemMenuRoleDto> Get(Expression<Func<SystemMenuRole, bool>> filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<SystemMenuRoleDto>>(data);
            return result;
        }

        public DataResult<SystemMenuRoleDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<SystemMenuRoleDto>>(data);
            return result;
        }

        public DataResult<SystemMenuRoleDto> Save(SystemMenuRoleDto dto)
        {
            var entity = _mapper.Map<SystemMenuRole>(dto);
            var data = manager.Save(entity);
            var result = _mapper.Map<DataResult<SystemMenuRoleDto>>(data);
            return result;
        }

        public DataResult<SystemMenuRoleDto> Update(SystemMenuRoleDto dto)
        {
            var entity = _mapper.Map<SystemMenuRole>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<SystemMenuRoleDto>>(data);
            return result;
        }
    }
}
