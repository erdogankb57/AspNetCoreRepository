using AutoMapper;
using Inta.EntityFramework.Core.Base;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Bussiness.DataContext;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class FormElementService : IFormElementService
    {
        private IMapper _mapper;
        private UnitOfWork<DefaultDataContext> unitOfWork;
        private RepositoryBase<FormElement, DefaultDataContext> manager;
        public FormElementService(IMapper mapper)
        {
            _mapper = mapper;
            unitOfWork = new UnitOfWork<DefaultDataContext>();
            manager = unitOfWork.AddRepository<FormElement>();
        }

        public DataResult<FormElementDto> Delete(FormElementDto dto)
        {
            var entity = _mapper.Map<FormElement>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<FormElementDto>>(data);
            return result;
        }

        public DataResult<List<FormElementDto>> Find(Expression<Func<FormElement, bool>>? filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<FormElementDto>>>(data);

            return result;
        }

        public DataResult<FormElementDto> Get(Expression<Func<FormElement, bool>>? filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<FormElementDto>>(data);

            return result;
        }

        public DataResult<FormElementDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<FormElementDto>>(data);
            return result;
        }

        public DataResult<FormElementDto> Save(FormElementDto dto)
        {
            var entity = _mapper.Map<FormElement>(dto);
            var data = manager.Save(entity);
            unitOfWork.SaveChanges();
            var result = _mapper.Map<DataResult<FormElementDto>>(data);
            return result;
        }

        public DataResult<FormElementDto> Update(FormElementDto dto)
        {
            var entity = _mapper.Map<FormElement>(dto);
            var data = manager.Update(entity);
            unitOfWork.SaveChanges();
            var result = _mapper.Map<DataResult<FormElementDto>>(data);
            return result;
        }
    }
}
