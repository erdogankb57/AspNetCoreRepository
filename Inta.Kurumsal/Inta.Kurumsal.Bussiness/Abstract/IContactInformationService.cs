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
    public interface IContactInformationService
    {
        DataResult<ContactInformationDto> GetById(int id);
        DataResult<List<ContactInformationDto>> Find(Expression<Func<ContactInformation, bool>> filter = null);
        DataResult<ContactInformationDto> Save(ContactInformationDto dto);
        DataResult<ContactInformationDto> Update(ContactInformationDto dto);
        DataResult<ContactInformationDto> Delete(ContactInformationDto dto);
    }
}
