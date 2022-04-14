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
            DataResult<SystemUserDto> result = null;
            var entity = _mapper.Map<SystemUser>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<SystemUserDto>
            {
                Data = _mapper.Map<SystemUserDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<SystemUserDto>> Find(Expression<Func<SystemUser, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<SystemUserDto>> result = new DataResult<List<SystemUserDto>>
            {
                Data = _mapper.Map<List<SystemUserDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<SystemUserDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<SystemUserDto> result = new DataResult<SystemUserDto>
            {
                Data = _mapper.Map<SystemUserDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<SystemUserDto> Save(SystemUserDto dto)
        {
            DataResult<SystemUserDto> result = null;
            var entity = _mapper.Map<SystemUser>(dto);
            var data = manager.Save(entity);
            result = new DataResult<SystemUserDto>
            {
                Data = _mapper.Map<SystemUserDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<SystemUserDto> Update(SystemUserDto dto)
        {
            DataResult<SystemUserDto> result = null;
            var entity = _mapper.Map<SystemUser>(dto);
            var data = manager.Update(entity);
            result = new DataResult<SystemUserDto>
            {
                Data = _mapper.Map<SystemUserDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<SystemUserDto> Get(Expression<Func<SystemUser, bool>> filter = null)
        {
            var data = manager.Get(filter);
            DataResult<SystemUserDto> result = new DataResult<SystemUserDto>
            {
                Data = _mapper.Map<SystemUserDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<List<SystemActionDto>> GetActiveRole(int systemRoleId)
        {
            var data = manager.GetActiveRole(systemRoleId);
            DataResult<List<SystemActionDto>> result = new DataResult<List<SystemActionDto>>
            {
                Data = _mapper.Map<List<SystemActionDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }
    }
}
