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
    public class RecordService : IRecordService
    {
        private IMapper _mapper;
        private UnitOfWork<DefaultDataContext> unitOfWork;
        private RepositoryBase<Record, DefaultDataContext> manager;
        public RecordService(IMapper mapper)
        {
            _mapper = mapper;
            unitOfWork = new UnitOfWork<DefaultDataContext>();
            manager = unitOfWork.AddRepository<Record>();
        }

        public DataResult<RecordDto> Delete(RecordDto dto)
        {
            var entity = _mapper.Map<Record>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<RecordDto>>(data);
            return result;
        }

        public DataResult<List<RecordDto>> Find(Expression<Func<Record, bool>>? filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<RecordDto>>>(data);

            return result;
        }

        public DataResult<RecordDto> Get(Expression<Func<Record, bool>>? filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<RecordDto>>(data);

            return result;
        }

        public DataResult<RecordDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<RecordDto>>(data);
            return result;
        }

        public DataResult<RecordDto> Save(RecordDto dto)
        {
            var entity = _mapper.Map<Record>(dto);
            var data = manager.Save(entity);
            unitOfWork.SaveChanges();
            var result = _mapper.Map<DataResult<RecordDto>>(data);
            return result;
        }

        public DataResult<RecordDto> Update(RecordDto dto, string[]? updateFields = null)
        {
            var entity = _mapper.Map<Record>(dto);
            var data = manager.Update(entity);
            unitOfWork.SaveChanges();
            var result = _mapper.Map<DataResult<RecordDto>>(data);
            return result;
        }
    }
}
