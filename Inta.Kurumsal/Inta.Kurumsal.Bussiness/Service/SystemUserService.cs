using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class SystemUserService : ISystemUserService
    {
        private IMapper _mapper = null;
        private SystemUserManager manager = null;
        public SystemUserService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new SystemUserManager();
        }

        public DataResult<SystemUserDto> Delete(SystemUserDto dto)
        {
            var entity = _mapper.Map<SystemUser>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<SystemUserDto>>(data);
            return result;
        }

        public DataResult<List<SystemUserDto>> Find(Expression<Func<SystemUser, bool>> filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<SystemUserDto>>>(data);
            return result;
        }

        public DataResult<SystemUserDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<SystemUserDto>>(data);
            return result;
        }

        public DataResult<SystemUserDto> Save(SystemUserDto dto)
        {
            var entity = _mapper.Map<SystemUser>(dto);
            var data = manager.Save(entity);
            var result = _mapper.Map<DataResult<SystemUserDto>>(data);
            return result;
        }

        public DataResult<SystemUserDto> Update(SystemUserDto dto)
        {
            var entity = _mapper.Map<SystemUser>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<SystemUserDto>>(data);
            return result;
        }

        public DataResult<SystemUserDto> Get(Expression<Func<SystemUser, bool>> filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<SystemUserDto>>(data);
            return result;
        }

        public DataResult<List<SystemActionDto>> GetActiveRole(int systemRoleId)
        {
            var data = manager.GetActiveRole(systemRoleId);
            var result = _mapper.Map<DataResult<List<SystemActionDto>>>(data);

            return result;
        }
    }
}
