using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class SystemMenuService : ISystemMenuService
    {
        private IMapper _mapper = null;
        private SystemMenuManager manager = null;
        public SystemMenuService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new SystemMenuManager();
        }

        public DataResult<SystemMenuDto> Delete(SystemMenuDto dto)
        {
            var entity = _mapper.Map<SystemMenu>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<SystemMenuDto>>(data);
            return result;
        }

        public DataResult<List<SystemMenuDto>> Find(Expression<Func<SystemMenu, bool>> filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<SystemMenuDto>>>(data);
            return result;
        }

        public DataResult<SystemMenuDto> Get(Expression<Func<SystemMenu, bool>> filter = null)
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

        public DataResult<SystemMenuDto> Update(SystemMenuDto dto)
        {
            var entity = _mapper.Map<SystemMenu>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<SystemMenuDto>>(data);
            return result;
        }
    }
}
