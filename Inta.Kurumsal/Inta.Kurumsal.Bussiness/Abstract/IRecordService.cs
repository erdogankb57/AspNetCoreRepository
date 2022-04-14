using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

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
