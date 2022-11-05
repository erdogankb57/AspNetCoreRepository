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
    public class SystemUserService : ISystemUserService
    {
        private IMapper _mapper = null;
        private UnitOfWork<DefaultDataContext> unitOfWork;
        private RepositoryBase<SystemUser, DefaultDataContext> manager;
        public SystemUserService(IMapper mapper)
        {
            _mapper = mapper;
            unitOfWork = new UnitOfWork<DefaultDataContext>();
            manager = unitOfWork.AddRepository<SystemUser>();
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
            var data = this.ActiveRole(systemRoleId);
            var result = _mapper.Map<DataResult<List<SystemActionDto>>>(data);

            return result;
        }

        public DataResult<List<SystemAction>> ActiveRole(int roleId)
        {
            DataResult<List<SystemAction>> result = new DataResult<List<SystemAction>>();
            using (var context = new DefaultDataContext())
            {
                var activeRole = from role in context.SystemRoles
                                 join actionRole in context.SystemActionRole on role.Id equals actionRole.SystemRoleId
                                 join action in context.SystemActions on actionRole.SystemActionId equals action.Id
                                 where
                                 role.Id == roleId
                                 select new SystemAction
                                 {
                                     ActionName = action.ActionName,
                                     ControllerName = action.ControllerName,
                                     Description = action.Description,
                                     SystemMenuId = action.SystemMenuId
                                 };

                result.Data = activeRole.ToList();
            }

            return result;
        }
    }
}
