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
    public class SystemActionService : ISystemActionService
    {
        private IMapper _mapper;
        private UnitOfWork<DefaultDataContext> unitOfWork;
        private RepositoryBase<SystemAction, DefaultDataContext> manager;
        public SystemActionService(IMapper mapper)
        {
            _mapper = mapper;
            unitOfWork = new UnitOfWork<DefaultDataContext>();
            manager = unitOfWork.AddRepository<SystemAction>();
        }

        public DataResult<SystemActionDto> Delete(SystemActionDto dto)
        {
            var entity = _mapper.Map<SystemAction>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<SystemActionDto>>(data);
            return result;
        }

        public DataResult<List<SystemActionDto>> Find(Expression<Func<SystemAction, bool>>? filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<SystemActionDto>>>(data);
            return result;
        }

        public DataResult<SystemActionDto> Get(Expression<Func<SystemAction, bool>>? filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<SystemActionDto>>(data);
            return result;
        }

        public DataResult<SystemActionDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<SystemActionDto>>(data);
            return result;
        }

        public DataResult<SystemActionDto> Save(SystemActionDto dto)
        {
            var entity = _mapper.Map<SystemAction>(dto);
            var data = manager.Save(entity);
            var result = _mapper.Map<DataResult<SystemActionDto>>(data);
            return result;
        }

        public DataResult<SystemActionDto> Update(SystemActionDto dto)
        {
            var entity = _mapper.Map<SystemAction>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<SystemActionDto>>(data);
            return result;
        }
    }
}
