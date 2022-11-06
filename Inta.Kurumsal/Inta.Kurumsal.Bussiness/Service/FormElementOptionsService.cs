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
    public class FormElementOptionsService : IFormElementOptionsService
    {
        private IMapper _mapper;
        private UnitOfWork<DefaultDataContext> unitOfWork;
        private RepositoryBase<FormElementOptions, DefaultDataContext> manager;
        public FormElementOptionsService(IMapper mapper)
        {
            _mapper = mapper;
            unitOfWork = new UnitOfWork<DefaultDataContext>();
            manager = unitOfWork.AddRepository<FormElementOptions>();
        }

        public DataResult<FormElementOptionsDto> Delete(FormElementOptionsDto dto)
        {
            var entity = _mapper.Map<FormElementOptions>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<FormElementOptionsDto>>(data);
            return result;
        }

        public DataResult<List<FormElementOptionsDto>> Find(Expression<Func<FormElementOptions, bool>>? filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<FormElementOptionsDto>>>(data);
            return result;
        }

        public DataResult<FormElementOptionsDto> Get(Expression<Func<FormElementOptions, bool>>? filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<FormElementOptionsDto>>(data);
            return result;
        }

        public DataResult<FormElementOptionsDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<FormElementOptionsDto>>(data);
            return result;
        }

        public DataResult<FormElementOptionsDto> Save(FormElementOptionsDto dto)
        {
            var entity = _mapper.Map<FormElementOptions>(dto);
            var data = manager.Save(entity);
            unitOfWork.SaveChanges();
            var result = _mapper.Map<DataResult<FormElementOptionsDto>>(data);
            return result;
        }

        public DataResult<FormElementOptionsDto> Update(FormElementOptionsDto dto, string[]? updateFields = null)
        {
            var entity = _mapper.Map<FormElementOptions>(dto);
            var data = manager.Update(entity);
            unitOfWork.SaveChanges();
            var result = _mapper.Map<DataResult<FormElementOptionsDto>>(data);
            return result;
        }
    }
}
