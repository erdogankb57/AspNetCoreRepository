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
    public class StaticTextService : IStaticTextService
    {
        private IMapper _mapper;
        private UnitOfWork<DefaultDataContext> unitOfWork;
        private RepositoryBase<StaticText, DefaultDataContext> manager;
        public StaticTextService(IMapper mapper)
        {
            _mapper = mapper;
            unitOfWork = new UnitOfWork<DefaultDataContext>();
            manager = unitOfWork.AddRepository<StaticText>();
        }

        public DataResult<StaticTextDto> Delete(StaticTextDto dto)
        {
            var entity = _mapper.Map<StaticText>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<StaticTextDto>>(data);
            return result;
        }

        public DataResult<List<StaticTextDto>> Find(Expression<Func<StaticText, bool>>? filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<StaticTextDto>>>(data);
            return result;
        }

        public DataResult<StaticTextDto> Get(Expression<Func<StaticText, bool>>? filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<StaticTextDto>>(data);
            return result;
        }

        public DataResult<StaticTextDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<StaticTextDto>>(data);
            return result;
        }

        public DataResult<StaticTextDto> Save(StaticTextDto dto)
        {
            var entity = _mapper.Map<StaticText>(dto);
            var data = manager.Save(entity);
            unitOfWork.SaveChanges();
            var result = _mapper.Map<DataResult<StaticTextDto>>(data);
            return result;
        }

        public DataResult<StaticTextDto> Update(StaticTextDto dto, string[]? updateFields = null)
        {
            var entity = _mapper.Map<StaticText>(dto);
            var data = manager.Update(entity);
            unitOfWork.SaveChanges();
            var result = _mapper.Map<DataResult<StaticTextDto>>(data);
            return result;
        }
    }
}
