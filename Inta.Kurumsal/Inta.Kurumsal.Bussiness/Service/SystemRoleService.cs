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
    public class SystemRoleService : ISystemRoleService
    {
        private IMapper _mapper;
        private UnitOfWork<DefaultDataContext> unitOfWork;
        private RepositoryBase<SystemRole, DefaultDataContext> manager;
        public SystemRoleService(IMapper mapper)
        {
            _mapper = mapper;
            unitOfWork = new UnitOfWork<DefaultDataContext>();
            manager = unitOfWork.AddRepository<SystemRole>();
        }

        public DataResult<SystemRoleDto> Delete(SystemRoleDto dto)
        {
            var entity = _mapper.Map<SystemRole>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<SystemRoleDto>>(data);
            return result;
        }

        public DataResult<List<SystemRoleDto>> Find(Expression<Func<SystemRole, bool>>? filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<SystemRoleDto>>>(data);
            return result;
        }

        public DataResult<SystemRoleDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<SystemRoleDto>>(data);
            return result;
        }

        public DataResult<SystemRoleDto> Save(SystemRoleDto dto)
        {
            var entity = _mapper.Map<SystemRole>(dto);
            var data = manager.Save(entity);
            unitOfWork.SaveChanges();
            var result = _mapper.Map<DataResult<SystemRoleDto>>(data);
            return result;
        }

        public DataResult<SystemRoleDto> Update(SystemRoleDto dto)
        {
            var entity = _mapper.Map<SystemRole>(dto);
            var data = manager.Update(entity);
            unitOfWork.SaveChanges();
            var result = _mapper.Map<DataResult<SystemRoleDto>>(data);
            return result;
        }

        public DataResult<SystemRoleDto> Get(Expression<Func<SystemRole, bool>>? filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<SystemRoleDto>>(data);

            return result;
        }
    }
}
