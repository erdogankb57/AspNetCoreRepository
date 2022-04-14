using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class ContactInformationService: IContactInformationService
    {
        private IMapper _mapper = null;
        private ContactInformationManager manager = null;
        public ContactInformationService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new ContactInformationManager();
        }

        public DataResult<ContactInformationDto> Delete(ContactInformationDto dto)
        {
            DataResult<ContactInformationDto> result = null;
            var entity = _mapper.Map<ContactInformation>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<ContactInformationDto>
            {
                Data = _mapper.Map<ContactInformationDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<ContactInformationDto>> Find(Expression<Func<ContactInformation, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<ContactInformationDto>> result = new DataResult<List<ContactInformationDto>>
            {
                Data = _mapper.Map<List<ContactInformationDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<ContactInformationDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<ContactInformationDto> result = new DataResult<ContactInformationDto>
            {
                Data = _mapper.Map<ContactInformationDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<ContactInformationDto> Save(ContactInformationDto dto)
        {
            DataResult<ContactInformationDto> result = null;
            var entity = _mapper.Map<ContactInformation>(dto);
            var data = manager.Save(entity);
            result = new DataResult<ContactInformationDto>
            {
                Data = _mapper.Map<ContactInformationDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<ContactInformationDto> Update(ContactInformationDto dto)
        {
            DataResult<ContactInformationDto> result = null;
            var entity = _mapper.Map<ContactInformation>(dto);
            var data = manager.Update(entity);
            result = new DataResult<ContactInformationDto>
            {
                Data = _mapper.Map<ContactInformationDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
