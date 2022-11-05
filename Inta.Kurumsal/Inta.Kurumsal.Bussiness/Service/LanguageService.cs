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
    public class LanguageService : ILanguageService
    {
        private IMapper _mapper;
        private UnitOfWork<DefaultDataContext> unitOfWork = null;
        private RepositoryBase<Language, DefaultDataContext> manager = null;
        public LanguageService(IMapper mapper)
        {
            _mapper = mapper;
            unitOfWork = new UnitOfWork<DefaultDataContext>();
            manager = unitOfWork.AddRepository<Language>();
        }

        public DataResult<LanguageDto> Delete(LanguageDto dto)
        {
            var entity = _mapper.Map<Language>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<LanguageDto>>(data);
            return result;
        }

        public DataResult<List<LanguageDto>> Find(Expression<Func<Language, bool>>? filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<LanguageDto>>>(data);

            return result;
        }

        public DataResult<LanguageDto> Get(Expression<Func<Language, bool>>? filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<LanguageDto>>(data);

            return result;
        }

        public DataResult<LanguageDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<LanguageDto>>(data);
            return result;
        }

        public DataResult<LanguageDto> Save(LanguageDto dto)
        {
            var entity = _mapper.Map<Language>(dto);
            var data = manager.Save(entity);
            unitOfWork.SaveChanges();
            var result = _mapper.Map<DataResult<LanguageDto>>(data);
            return result;
        }

        public DataResult<LanguageDto> Update(LanguageDto dto)
        {
            var entity = _mapper.Map<Language>(dto);
            var data = manager.Update(entity);
            unitOfWork.SaveChanges();
            var result = _mapper.Map<DataResult<LanguageDto>>(data);
            return result;
        }
    }
}
