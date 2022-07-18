using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class RecordService : IRecordService
    {
        private IMapper _mapper = null;
        private RecordManager manager = null;
        public RecordService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new RecordManager();
        }

        public DataResult<RecordDto> Delete(RecordDto dto)
        {
            var entity = _mapper.Map<Record>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<RecordDto>>(data);
            return result;
        }

        public DataResult<List<RecordDto>> Find(Expression<Func<Record, bool>> filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<RecordDto>>>(data);

            return result;
        }

        public DataResult<RecordDto> Get(Expression<Func<Record, bool>> filter = null)
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
            var result = _mapper.Map<DataResult<RecordDto>>(data);
            return result;
        }

        public DataResult<RecordDto> Update(RecordDto dto)
        {
            var entity = _mapper.Map<Record>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<RecordDto>>(data);
            return result;
        }
    }
}
