using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface IFileUploadService
    {
        DataResult<FileUploadDto> GetById(int id);
        DataResult<List<FileUploadDto>> Find(Expression<Func<FileUpload, bool>> filter = null);
        DataResult<FileUploadDto> Save(FileUploadDto dto);
        DataResult<FileUploadDto> Update(FileUploadDto dto);
        DataResult<FileUploadDto> Delete(FileUploadDto dto);
    }
}
