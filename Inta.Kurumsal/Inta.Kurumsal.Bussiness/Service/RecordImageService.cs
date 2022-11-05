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
    public class RecordImageService : IRecordImageService
    {
        private IMapper _mapper = null;
        private UnitOfWork<DefaultDataContext> unitOfWork;
        private RepositoryBase<RecordImage, DefaultDataContext> manager;
        public RecordImageService(IMapper mapper)
        {
            _mapper = mapper;
            unitOfWork = new UnitOfWork<DefaultDataContext>();
            manager = unitOfWork.AddRepository<RecordImage>();
        }

        public DataResult<RecordImageDto> Delete(RecordImageDto dto)
        {
            var entity = _mapper.Map<RecordImage>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<RecordImageDto>>(data);
            return result;
        }

        public DataResult<List<RecordImageDto>> Find(Expression<Func<RecordImage, bool>>? filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<RecordImageDto>>>(data);
            return result;
        }

        public DataResult<RecordImageDto> Get(Expression<Func<RecordImage, bool>>? filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<RecordImageDto>>(data);
            return result;
        }

        public DataResult<RecordImageDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<RecordImageDto>>(data);
            return result;
        }

        public DataResult<RecordImageDto> Save(RecordImageDto dto)
        {
            var entity = _mapper.Map<RecordImage>(dto);
            var data = manager.Save(entity);
            var result = _mapper.Map<DataResult<RecordImageDto>>(data);
            return result;
        }

        public DataResult<RecordImageDto> Update(RecordImageDto dto)
        {
            var entity = _mapper.Map<RecordImage>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<RecordImageDto>>(data);
            return result;
        }
    }
}
