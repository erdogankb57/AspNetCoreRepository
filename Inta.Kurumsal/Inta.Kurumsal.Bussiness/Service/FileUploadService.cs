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
            var entity = _mapper.Map<FileUpload>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<FileUploadDto>>(data);
            return result;
        }

        public DataResult<List<FileUploadDto>> Find(Expression<Func<FileUpload, bool>> filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<FileUploadDto>>>(data);
            return result;
        }

        public DataResult<FileUploadDto> Get(Expression<Func<FileUpload, bool>> filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<FileUploadDto>>(data);
            return result;
        }

        public DataResult<FileUploadDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<FileUploadDto>>(data);
            return result;
        }

        public DataResult<FileUploadDto> Save(FileUploadDto dto)
        {
            var entity = _mapper.Map<FileUpload>(dto);
            var data = manager.Save(entity);
            var result = _mapper.Map<DataResult<FileUploadDto>>(data);
            return result;
        }

        public DataResult<FileUploadDto> Update(FileUploadDto dto)
        {
            var entity = _mapper.Map<FileUpload>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<FileUploadDto>>(data);
            return result;
        }
    }
}
