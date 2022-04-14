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
    public interface IFormElementOptionsService
    {
        DataResult<FormElementOptionsDto> GetById(int id);
        DataResult<List<FormElementOptionsDto>> Find(Expression<Func<FormElementOptions, bool>> filter = null);
        DataResult<FormElementOptionsDto> Save(FormElementOptionsDto dto);
        DataResult<FormElementOptionsDto> Update(FormElementOptionsDto dto);
        DataResult<FormElementOptionsDto> Delete(FormElementOptionsDto dto);
    }
}
