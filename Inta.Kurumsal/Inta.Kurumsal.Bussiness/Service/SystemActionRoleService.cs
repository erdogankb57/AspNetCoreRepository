using AutoMapper;
using Inta.EntityFramework.Core.Base;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Bussiness.DataContext;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class SystemActionRoleService : ISystemActionRoleService
    {
        private IMapper _mapper = null;
        private UnitOfWork<DefaultDataContext> unitOfWork;
        private RepositoryBase<SystemActionRole, DefaultDataContext> manager;
        public SystemActionRoleService(IMapper mapper)
        {
            _mapper = mapper;
            unitOfWork = new UnitOfWork<DefaultDataContext>();
            manager = unitOfWork.AddRepository<SystemActionRole>();
        }

        public DataResult<SystemActionRoleDto> Delete(SystemActionRoleDto dto)
        {
            var entity = _mapper.Map<SystemActionRole>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<SystemActionRoleDto>>(data);
            return result;
        }

        public DataResult<List<SystemActionRoleDto>> Find(Expression<Func<SystemActionRole, bool>>? filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<SystemActionRoleDto>>>(data);

            return result;
        }

        public DataResult<SystemActionRoleDto> Get(Expression<Func<SystemActionRole, bool>>? filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<SystemActionRoleDto>>(data);

            return result;
        }

        public DataResult<SystemActionRoleDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<SystemActionRoleDto>>(data);
            return result;
        }

        public DataResult<SystemActionRoleDto> Save(SystemActionRoleDto dto)
        {
            var entity = _mapper.Map<SystemActionRole>(dto);
            var data = manager.Save(entity);
            var result = _mapper.Map<DataResult<SystemActionRoleDto>>(data);
            return result;
        }

        public DataResult<SystemActionRoleDto> Update(SystemActionRoleDto dto)
        {
            var entity = _mapper.Map<SystemActionRole>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<SystemActionRoleDto>>(data);
            return result;
        }
    }
}
