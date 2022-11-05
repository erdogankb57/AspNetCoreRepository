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
    public class GeneralSettingsService : IGeneralSettingsService
    {
        private IMapper _mapper;
        private UnitOfWork<DefaultDataContext> unitOfWork;
        private RepositoryBase<GeneralSettings, DefaultDataContext> manager;
        public GeneralSettingsService(IMapper mapper)
        {
            _mapper = mapper;
            unitOfWork = new UnitOfWork<DefaultDataContext>();
            manager = unitOfWork.AddRepository<GeneralSettings>();
        }

        public DataResult<GeneralSettingsDto> Delete(GeneralSettingsDto dto)
        {
            var entity = _mapper.Map<GeneralSettings>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<GeneralSettingsDto>>(data);
            return result;
        }

        public DataResult<List<GeneralSettingsDto>> Find(Expression<Func<GeneralSettings, bool>>? filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<GeneralSettingsDto>>>(data);

            return result;
        }

        public DataResult<GeneralSettingsDto> Get(Expression<Func<GeneralSettings, bool>>? filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<GeneralSettingsDto>>(data);

            return result;
        }

        public DataResult<GeneralSettingsDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<GeneralSettingsDto>>(data);
            return result;
        }

        public DataResult<GeneralSettingsDto> Save(GeneralSettingsDto dto)
        {
            var entity = _mapper.Map<GeneralSettings>(dto);
            var data = manager.Save(entity);
            unitOfWork.SaveChanges();
            var result = _mapper.Map<DataResult<GeneralSettingsDto>>(data);
            return result;
        }

        public DataResult<GeneralSettingsDto> Update(GeneralSettingsDto dto)
        {
            var entity = _mapper.Map<GeneralSettings>(dto);
            var data = manager.Update(entity);
            unitOfWork.SaveChanges();
            var result = _mapper.Map<DataResult<GeneralSettingsDto>>(data);
            return result;
        }
    }
}
