using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface IRecordService
    {
        DataResult<RecordDto> GetById(int id);
        DataResult<List<RecordDto>> Find(Expression<Func<Record, bool>> filter = null);
        DataResult<RecordDto> Save(RecordDto dto);
        DataResult<RecordDto> Update(RecordDto dto);
        DataResult<RecordDto> Delete(RecordDto dto);
    }
}
