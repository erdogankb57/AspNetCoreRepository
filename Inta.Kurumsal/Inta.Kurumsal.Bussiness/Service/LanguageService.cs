using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class LanguageService : ILanguageService
    {
        private IMapper _mapper = null;
        private LanguageManager manager = null;
        public LanguageService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new LanguageManager();
        }

        public DataResult<LanguageDto> Delete(LanguageDto dto)
        {
            var entity = _mapper.Map<Language>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<LanguageDto>>(data);
            return result;
        }

        public DataResult<List<LanguageDto>> Find(Expression<Func<Language, bool>> filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<LanguageDto>>>(data);

            return result;
        }

        public DataResult<LanguageDto> Get(Expression<Func<Language, bool>> filter = null)
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
            var result = _mapper.Map<DataResult<LanguageDto>>(data);
            return result;
        }

        public DataResult<LanguageDto> Update(LanguageDto dto)
        {
            var entity = _mapper.Map<Language>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<LanguageDto>>(data);
            return result;
        }
    }
}
