using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface IMessageHistoryService
    {
        DataResult<MessageHistoryDto> GetById(int id);
        DataResult<List<MessageHistoryDto>> Find(Expression<Func<MessageHistory, bool>> filter = null);
        DataResult<MessageHistoryDto> Save(MessageHistoryDto dto);
        DataResult<MessageHistoryDto> Update(MessageHistoryDto dto);
        DataResult<MessageHistoryDto> Delete(MessageHistoryDto dto);
    }
}
