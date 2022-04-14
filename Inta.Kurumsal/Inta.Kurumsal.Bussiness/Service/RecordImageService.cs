using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class RecordImageService : IRecordImageService
    {
        private IMapper _mapper = null;
        private RecordImageManager manager = null;
        public RecordImageService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new RecordImageManager();
        }

        public DataResult<RecordImageDto> Delete(RecordImageDto dto)
        {
            DataResult<RecordImageDto> result = null;
            var entity = _mapper.Map<RecordImage>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<RecordImageDto>
            {
                Data = _mapper.Map<RecordImageDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<RecordImageDto>> Find(Expression<Func<RecordImage, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<RecordImageDto>> result = new DataResult<List<RecordImageDto>>
            {
                Data = _mapper.Map<List<RecordImageDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<RecordImageDto> Get(Expression<Func<RecordImage, bool>> filter = null)
        {
            throw new NotImplementedException();
        }

        public DataResult<RecordImageDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<RecordImageDto> result = new DataResult<RecordImageDto>
            {
                Data = _mapper.Map<RecordImageDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<RecordImageDto> Save(RecordImageDto dto)
        {
            DataResult<RecordImageDto> result = null;
            var entity = _mapper.Map<RecordImage>(dto);
            var data = manager.Save(entity);
            result = new DataResult<RecordImageDto>
            {
                Data = _mapper.Map<RecordImageDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<RecordImageDto> Update(RecordImageDto dto)
        {
            DataResult<RecordImageDto> result = null;
            var entity = _mapper.Map<RecordImage>(dto);
            var data = manager.Update(entity);
            result = new DataResult<RecordImageDto>
            {
                Data = _mapper.Map<RecordImageDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
