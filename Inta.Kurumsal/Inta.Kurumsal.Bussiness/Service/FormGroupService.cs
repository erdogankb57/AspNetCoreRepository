using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class FormGroupService : IFormGroupService
    {
        private IMapper _mapper = null;
        private FormGroupManager manager = null;
        public FormGroupService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new FormGroupManager();
        }

        public DataResult<FormGroupDto> Delete(FormGroupDto dto)
        {
            var entity = _mapper.Map<FormGroup>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<FormGroupDto>>(data);
            return result;
        }

        public DataResult<List<FormGroupDto>> Find(Expression<Func<FormGroup, bool>> filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<FormGroupDto>>>(data);
            return result;
        }

        public DataResult<FormGroupDto> Get(Expression<Func<FormGroup, bool>> filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<FormGroupDto>>(data);
            return result;
        }

        public DataResult<FormGroupDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<FormGroupDto>>(data);
            return result;
        }

        public DataResult<FormGroupDto> Save(FormGroupDto dto)
        {
            var entity = _mapper.Map<FormGroup>(dto);
            var data = manager.Save(entity);
            var result = _mapper.Map<DataResult<FormGroupDto>>(data);
            return result;
        }

        public DataResult<FormGroupDto> Update(FormGroupDto dto)
        {
            var entity = _mapper.Map<FormGroup>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<FormGroupDto>>(data);
            return result;
        }
    }
}
