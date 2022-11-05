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
    public class SystemMenuService : ISystemMenuService
    {
        private IMapper _mapper = null;
        private UnitOfWork<DefaultDataContext> unitOfWork;
        private RepositoryBase<SystemMenu, DefaultDataContext> manager;
        public SystemMenuService(IMapper mapper)
        {
            _mapper = mapper;
            unitOfWork = new UnitOfWork<DefaultDataContext>();
            manager = unitOfWork.AddRepository<SystemMenu>();
        }

        public DataResult<SystemMenuDto> Delete(SystemMenuDto dto)
        {
            var entity = _mapper.Map<SystemMenu>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<SystemMenuDto>>(data);
            return result;
        }

        public DataResult<List<SystemMenuDto>> Find(Expression<Func<SystemMenu, bool>>? filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<SystemMenuDto>>>(data);
            return result;
        }

        public DataResult<SystemMenuDto> Get(Expression<Func<SystemMenu, bool>>? filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<SystemMenuDto>>(data);
            return result;
        }

        public DataResult<SystemMenuDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<SystemMenuDto>>(data);
            return result;
        }

        public DataResult<SystemMenuDto> Save(SystemMenuDto dto)
        {
            var entity = _mapper.Map<SystemMenu>(dto);
            var data = manager.Save(entity);
            var result = _mapper.Map<DataResult<SystemMenuDto>>(data);
            return result;
        }

        public int GetTopMenuId(int Id)
        {
            return this.TopMenuId(Id);
        }

        public int TopMenuId(int Id)
        {
            int topMenuId = 0;
            var menu = this.GetById(Id);
            if (menu.Data != null && menu.Data.SystemMenuId != 0)
                topMenuId = TopMenuId(menu.Data.SystemMenuId.Value);
            else if (menu.Data != null)
                topMenuId = menu.Data.Id;

            return topMenuId;
        }

        public DataResult<SystemMenuDto> Update(SystemMenuDto dto)
        {
            var entity = _mapper.Map<SystemMenu>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<SystemMenuDto>>(data);
            return result;
        }
    }
}
