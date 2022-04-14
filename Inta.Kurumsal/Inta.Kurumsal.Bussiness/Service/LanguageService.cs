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
            DataResult<LanguageDto> result = null;
            var entity = _mapper.Map<Language>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<LanguageDto>
            {
                Data = _mapper.Map<LanguageDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<LanguageDto>> Find(Expression<Func<Language, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<LanguageDto>> result = new DataResult<List<LanguageDto>>
            {
                Data = _mapper.Map<List<LanguageDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<LanguageDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<LanguageDto> result = new DataResult<LanguageDto>
            {
                Data = _mapper.Map<LanguageDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<LanguageDto> Save(LanguageDto dto)
        {
            DataResult<LanguageDto> result = null;
            var entity = _mapper.Map<Language>(dto);
            var data = manager.Save(entity);
            result = new DataResult<LanguageDto>
            {
                Data = _mapper.Map<LanguageDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<LanguageDto> Update(LanguageDto dto)
        {
            DataResult<LanguageDto> result = null;
            var entity = _mapper.Map<Language>(dto);
            var data = manager.Update(entity);
            result = new DataResult<LanguageDto>
            {
                Data = _mapper.Map<LanguageDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
