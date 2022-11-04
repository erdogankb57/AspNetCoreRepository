using AutoMapper;
using Inta.EntityFramework.Core.Base;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.DataContext;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class ContactInformationService: IContactInformationService
    {
        private IMapper _mapper = null;
        private UnitOfWork<DefaultDataContext> unitOfWork = null;
        private RepositoryBase<ContactInformation, DefaultDataContext> manager = null;
        public ContactInformationService(IMapper mapper)
        {
            _mapper = mapper;
            unitOfWork = new UnitOfWork<DefaultDataContext>();
            manager = unitOfWork.AddRepository<ContactInformation>();
        }

        public DataResult<ContactInformationDto> Delete(ContactInformationDto dto)
        {
            var entity = _mapper.Map<ContactInformation>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<ContactInformationDto>>(data);
            return result;
        }

        public DataResult<List<ContactInformationDto>> Find(Expression<Func<ContactInformation, bool>> filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<ContactInformationDto>>>(data);

            return result;
        }

        public DataResult<ContactInformationDto> Get(Expression<Func<ContactInformation, bool>> filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<ContactInformationDto>>(data);
            return result;
        }

        public DataResult<ContactInformationDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<ContactInformationDto>>(data);
            return result;
        }

        public DataResult<ContactInformationDto> Save(ContactInformationDto dto)
        {
            var entity = _mapper.Map<ContactInformation>(dto);
            var data = manager.Save(entity);
            var result = _mapper.Map<DataResult<ContactInformationDto>>(data);
            return result;
        }

        public DataResult<ContactInformationDto> Update(ContactInformationDto dto)
        {
            var entity = _mapper.Map<ContactInformation>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<ContactInformationDto>>(data);
            return result;
        }
    }
}
