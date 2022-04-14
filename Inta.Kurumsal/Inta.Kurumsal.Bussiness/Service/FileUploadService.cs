using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class FileUploadService : IFileUploadService
    {
        private IMapper _mapper = null;
        private FileUploadManager manager = null;
        public FileUploadService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new FileUploadManager();
        }

        public DataResult<FileUploadDto> Delete(FileUploadDto dto)
        {
            DataResult<FileUploadDto> result = null;
            var entity = _mapper.Map<FileUpload>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<FileUploadDto>
            {
                Data = _mapper.Map<FileUploadDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<FileUploadDto>> Find(Expression<Func<FileUpload, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<FileUploadDto>> result = new DataResult<List<FileUploadDto>>
            {
                Data = _mapper.Map<List<FileUploadDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<FileUploadDto> Get(Expression<Func<FileUpload, bool>> filter = null)
        {
            throw new NotImplementedException();
        }

        public DataResult<FileUploadDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<FileUploadDto> result = new DataResult<FileUploadDto>
            {
                Data = _mapper.Map<FileUploadDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<FileUploadDto> Save(FileUploadDto dto)
        {
            DataResult<FileUploadDto> result = null;
            var entity = _mapper.Map<FileUpload>(dto);
            var data = manager.Save(entity);
            result = new DataResult<FileUploadDto>
            {
                Data = _mapper.Map<FileUploadDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<FileUploadDto> Update(FileUploadDto dto)
        {
            DataResult<FileUploadDto> result = null;
            var entity = _mapper.Map<FileUpload>(dto);
            var data = manager.Update(entity);
            result = new DataResult<FileUploadDto>
            {
                Data = _mapper.Map<FileUploadDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
