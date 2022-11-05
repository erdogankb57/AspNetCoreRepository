using AutoMapper;
using Inta.EntityFramework.Core.Base;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.DataContext;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class PageTypeService : IPageTypeService
    {
        private IMapper _mapper = null;
        private UnitOfWork<DefaultDataContext> unitOfWork;
        private RepositoryBase<PageType, DefaultDataContext> manager;
        public PageTypeService(IMapper mapper)
        {
            _mapper = mapper;
            unitOfWork = new UnitOfWork<DefaultDataContext>();
            manager = unitOfWork.AddRepository<PageType>();
        }

        public DataResult<PageTypeDto> Delete(PageTypeDto dto)
        {
            var entity = _mapper.Map<PageType>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<PageTypeDto>>(data);
            return result;
        }

        public DataResult<List<PageTypeDto>> Find(Expression<Func<PageType, bool>> filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<PageTypeDto>>>(data);

            return result;
        }

        public DataResult<PageTypeDto> Get(Expression<Func<PageType, bool>> filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<PageTypeDto>>(data);
            return result;
        }

        public DataResult<PageTypeDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<PageTypeDto>>(data);
            return result;
        }

        public DataResult<PageTypeDto> Save(PageTypeDto dto)
        {
            var entity = _mapper.Map<PageType>(dto);
            var data = manager.Save(entity);
            var result = _mapper.Map<DataResult<PageTypeDto>>(data);
            return result;
        }

        public DataResult<PageTypeDto> Update(PageTypeDto dto)
        {
            var entity = _mapper.Map<PageType>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<PageTypeDto>>(data);
            return result;
        }
    }
}
