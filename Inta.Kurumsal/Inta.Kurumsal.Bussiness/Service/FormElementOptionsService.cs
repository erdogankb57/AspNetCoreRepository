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
            DataResult<FormElementOptionsDto> result = null;
            var entity = _mapper.Map<FormElementOptions>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<FormElementOptionsDto>
            {
                Data = _mapper.Map<FormElementOptionsDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<FormElementOptionsDto>> Find(Expression<Func<FormElementOptions, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<FormElementOptionsDto>> result = new DataResult<List<FormElementOptionsDto>>
            {
                Data = _mapper.Map<List<FormElementOptionsDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<FormElementOptionsDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<FormElementOptionsDto> result = new DataResult<FormElementOptionsDto>
            {
                Data = _mapper.Map<FormElementOptionsDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<FormElementOptionsDto> Save(FormElementOptionsDto dto)
        {
            DataResult<FormElementOptionsDto> result = null;
            var entity = _mapper.Map<FormElementOptions>(dto);
            var data = manager.Save(entity);
            result = new DataResult<FormElementOptionsDto>
            {
                Data = _mapper.Map<FormElementOptionsDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<FormElementOptionsDto> Update(FormElementOptionsDto dto)
        {
            DataResult<FormElementOptionsDto> result = null;
            var entity = _mapper.Map<FormElementOptions>(dto);
            var data = manager.Update(entity);
            result = new DataResult<FormElementOptionsDto>
            {
                Data = _mapper.Map<FormElementOptionsDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
