using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class GeneralSettingsService : IGeneralSettingsService
    {
        private IMapper _mapper = null;
        private GeneralSettingsManager manager = null;
        public GeneralSettingsService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new GeneralSettingsManager();
        }

        public DataResult<GeneralSettingsDto> Delete(GeneralSettingsDto dto)
        {
            DataResult<GeneralSettingsDto> result = null;
            var entity = _mapper.Map<GeneralSettings>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<GeneralSettingsDto>
            {
                Data = _mapper.Map<GeneralSettingsDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<GeneralSettingsDto>> Find(Expression<Func<GeneralSettings, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<GeneralSettingsDto>> result = new DataResult<List<GeneralSettingsDto>>
            {
                Data = _mapper.Map<List<GeneralSettingsDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<GeneralSettingsDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<GeneralSettingsDto> result = new DataResult<GeneralSettingsDto>
            {
                Data = _mapper.Map<GeneralSettingsDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<GeneralSettingsDto> Save(GeneralSettingsDto dto)
        {
            DataResult<GeneralSettingsDto> result = null;
            var entity = _mapper.Map<GeneralSettings>(dto);
            var data = manager.Save(entity);
            result = new DataResult<GeneralSettingsDto>
            {
                Data = _mapper.Map<GeneralSettingsDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<GeneralSettingsDto> Update(GeneralSettingsDto dto)
        {
            DataResult<GeneralSettingsDto> result = null;
            var entity = _mapper.Map<GeneralSettings>(dto);
            var data = manager.Update(entity);
            result = new DataResult<GeneralSettingsDto>
            {
                Data = _mapper.Map<GeneralSettingsDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
