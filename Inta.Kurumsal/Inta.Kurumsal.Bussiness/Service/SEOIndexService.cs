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
    public class SEOIndexService : ISEOIndexService
    {
        private IMapper _mapper;
        private UnitOfWork<DefaultDataContext> unitOfWork;
        private RepositoryBase<SEOIndex, DefaultDataContext> manager;
        public SEOIndexService(IMapper mapper)
        {
            _mapper = mapper;
            unitOfWork = new UnitOfWork<DefaultDataContext>();
            manager = unitOfWork.AddRepository<SEOIndex>();
        }

        public DataResult<SEOIndexDto> Delete(SEOIndexDto dto)
        {
            var entity = _mapper.Map<SEOIndex>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<SEOIndexDto>>(data);
            return result;
        }

        public DataResult<List<SEOIndexDto>> Find(Expression<Func<SEOIndex, bool>>? filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<SEOIndexDto>>>(data);
            return result;
        }

        public DataResult<SEOIndexDto> Get(Expression<Func<SEOIndex, bool>>? filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<SEOIndexDto>>(data);
            return result;
        }

        public DataResult<SEOIndexDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<SEOIndexDto>>(data);
            return result;
        }

        public DataResult<SEOIndexDto> Save(SEOIndexDto dto)
        {
            var entity = _mapper.Map<SEOIndex>(dto);
            var data = manager.Save(entity);
            unitOfWork.SaveChanges();
            var result = _mapper.Map<DataResult<SEOIndexDto>>(data);
            return result;
        }

        public DataResult<SEOIndexDto> Update(SEOIndexDto dto)
        {
            var entity = _mapper.Map<SEOIndex>(dto);
            var data = manager.Update(entity);
            unitOfWork.SaveChanges();
            var result = _mapper.Map<DataResult<SEOIndexDto>>(data);
            return result;
        }
    }
}
