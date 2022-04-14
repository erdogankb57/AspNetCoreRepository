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
    public interface IFormGroupService
    {
        DataResult<FormGroupDto> GetById(int id);
        DataResult<List<FormGroupDto>> Find(Expression<Func<FormGroup, bool>> filter = null);
        DataResult<FormGroupDto> Save(FormGroupDto dto);
        DataResult<FormGroupDto> Update(FormGroupDto dto);
        DataResult<FormGroupDto> Delete(FormGroupDto dto);
    }
}
