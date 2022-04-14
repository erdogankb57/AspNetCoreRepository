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
    public interface IFormElementService
    {
        DataResult<FormElementDto> GetById(int id);
        DataResult<List<FormElementDto>> Find(Expression<Func<FormElement, bool>> filter = null);
        DataResult<FormElementDto> Save(FormElementDto dto);
        DataResult<FormElementDto> Update(FormElementDto dto);
        DataResult<FormElementDto> Delete(FormElementDto dto);
    }
}
