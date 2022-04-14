using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface IRecordFileService
    {
        DataResult<RecordFileDto> GetById(int id);
        DataResult<List<RecordFileDto>> Find(Expression<Func<RecordFile, bool>> filter = null);
        DataResult<RecordFileDto> Save(RecordFileDto dto);
        DataResult<RecordFileDto> Update(RecordFileDto dto);
        DataResult<RecordFileDto> Delete(RecordFileDto dto);
        DataResult<RecordFileDto> Get(Expression<Func<RecordFile, bool>> filter = null);

    }
}
