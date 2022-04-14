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
            DataResult<FormGroupDto> result = null;
            var entity = _mapper.Map<FormGroup>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<FormGroupDto>
            {
                Data = _mapper.Map<FormGroupDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<FormGroupDto>> Find(Expression<Func<FormGroup, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<FormGroupDto>> result = new DataResult<List<FormGroupDto>>
            {
                Data = _mapper.Map<List<FormGroupDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<FormGroupDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<FormGroupDto> result = new DataResult<FormGroupDto>
            {
                Data = _mapper.Map<FormGroupDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<FormGroupDto> Save(FormGroupDto dto)
        {
            DataResult<FormGroupDto> result = null;
            var entity = _mapper.Map<FormGroup>(dto);
            var data = manager.Save(entity);
            result = new DataResult<FormGroupDto>
            {
                Data = _mapper.Map<FormGroupDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<FormGroupDto> Update(FormGroupDto dto)
        {
            DataResult<FormGroupDto> result = null;
            var entity = _mapper.Map<FormGroup>(dto);
            var data = manager.Update(entity);
            result = new DataResult<FormGroupDto>
            {
                Data = _mapper.Map<FormGroupDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
