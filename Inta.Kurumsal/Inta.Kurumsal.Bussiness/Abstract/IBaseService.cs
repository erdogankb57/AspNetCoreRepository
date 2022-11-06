using Inta.EntityFramework.Core.Abstract;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface IBaseService<IDto,IEntity>
    {
        DataResult<IDto> GetById(int id);
        DataResult<List<IDto>> Find(Expression<Func<IEntity, bool>>? filter = null);
        DataResult<IDto> Save(IDto dto);
        DataResult<IDto> Update(IDto dto, string[]? updateFields = null);
        DataResult<IDto> Delete(IDto dto);
        DataResult<IDto> Get(Expression<Func<IEntity, bool>>? filter = null);
    }
}
