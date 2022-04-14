using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface IRecordImageService
    {
        DataResult<RecordImageDto> GetById(int id);
        DataResult<List<RecordImageDto>> Find(Expression<Func<RecordImage, bool>> filter = null);
        DataResult<RecordImageDto> Save(RecordImageDto dto);
        DataResult<RecordImageDto> Update(RecordImageDto dto);
        DataResult<RecordImageDto> Delete(RecordImageDto dto);
        DataResult<RecordImageDto> Get(Expression<Func<RecordImage, bool>> filter = null);

    }
}
