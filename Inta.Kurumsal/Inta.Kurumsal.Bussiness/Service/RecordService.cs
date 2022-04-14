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
            DataResult<RecordDto> result = null;
            var entity = _mapper.Map<Record>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<RecordDto>
            {
                Data = _mapper.Map<RecordDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<RecordDto>> Find(Expression<Func<Record, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<RecordDto>> result = new DataResult<List<RecordDto>>
            {
                Data = _mapper.Map<List<RecordDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<RecordDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<RecordDto> result = new DataResult<RecordDto>
            {
                Data = _mapper.Map<RecordDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<RecordDto> Save(RecordDto dto)
        {
            DataResult<RecordDto> result = null;
            var entity = _mapper.Map<Record>(dto);
            var data = manager.Save(entity);
            result = new DataResult<RecordDto>
            {
                Data = _mapper.Map<RecordDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<RecordDto> Update(RecordDto dto)
        {
            DataResult<RecordDto> result = null;
            var entity = _mapper.Map<Record>(dto);
            var data = manager.Update(entity);
            result = new DataResult<RecordDto>
            {
                Data = _mapper.Map<RecordDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
