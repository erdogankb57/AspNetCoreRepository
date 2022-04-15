using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class FormElementOptionsService : IFormElementOptionsService
    {
        private IMapper _mapper = null;
        private FormElementOptionsManager manager = null;
        public FormElementOptionsService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new FormElementOptionsManager();
        }

        public DataResult<FormElementOptionsDto> Delete(FormElementOptionsDto dto)
        {
            var entity = _mapper.Map<FormElementOptions>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<FormElementOptionsDto>>(data);
            return result;
        }

        public DataResult<List<FormElementOptionsDto>> Find(Expression<Func<FormElementOptions, bool>> filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<FormElementOptionsDto>>>(data);
            return result;
        }

        public DataResult<FormElementOptionsDto> Get(Expression<Func<FormElementOptions, bool>> filter = null)
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
            var result = _mapper.Map<DataResult<FormElementOptionsDto>>(data);
            return result;
        }

        public DataResult<FormElementOptionsDto> Update(FormElementOptionsDto dto)
        {
            var entity = _mapper.Map<FormElementOptions>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<FormElementOptionsDto>>(data);
            return result;
        }
    }
}
