using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface IMessageTypeService
    {
        DataResult<MessageTypeDto> GetById(int id);
        DataResult<List<MessageTypeDto>> Find(Expression<Func<MessageType, bool>> filter = null);
        DataResult<MessageTypeDto> Save(MessageTypeDto dto);
        DataResult<MessageTypeDto> Update(MessageTypeDto dto);
        DataResult<MessageTypeDto> Delete(MessageTypeDto dto);
    }
}
