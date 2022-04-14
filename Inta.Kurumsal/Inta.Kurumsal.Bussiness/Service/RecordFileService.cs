using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class RecordFileService : IRecordFileService
    {
        private IMapper _mapper = null;
        private RecordFileManager manager = null;
        public RecordFileService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new RecordFileManager();
        }

        public DataResult<RecordFileDto> Delete(RecordFileDto dto)
        {
            DataResult<RecordFileDto> result = null;
            var entity = _mapper.Map<RecordFile>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<RecordFileDto>
            {
                Data = _mapper.Map<RecordFileDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<RecordFileDto>> Find(Expression<Func<RecordFile, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<RecordFileDto>> result = new DataResult<List<RecordFileDto>>
            {
                Data = _mapper.Map<List<RecordFileDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<RecordFileDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<RecordFileDto> result = new DataResult<RecordFileDto>
            {
                Data = _mapper.Map<RecordFileDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<RecordFileDto> Save(RecordFileDto dto)
        {
            DataResult<RecordFileDto> result = null;
            var entity = _mapper.Map<RecordFile>(dto);
            var data = manager.Save(entity);
            result = new DataResult<RecordFileDto>
            {
                Data = _mapper.Map<RecordFileDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<RecordFileDto> Update(RecordFileDto dto)
        {
            DataResult<RecordFileDto> result = null;
            var entity = _mapper.Map<RecordFile>(dto);
            var data = manager.Update(entity);
            result = new DataResult<RecordFileDto>
            {
                Data = _mapper.Map<RecordFileDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
