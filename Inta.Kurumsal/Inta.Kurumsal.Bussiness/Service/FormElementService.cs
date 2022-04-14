using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class FormElementService : IFormElementService
    {
        private IMapper _mapper = null;
        private FormElementManager manager = null;
        public FormElementService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new FormElementManager();
        }

        public DataResult<FormElementDto> Delete(FormElementDto dto)
        {
            DataResult<FormElementDto> result = null;
            var entity = _mapper.Map<FormElement>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<FormElementDto>
            {
                Data = _mapper.Map<FormElementDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<FormElementDto>> Find(Expression<Func<FormElement, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<FormElementDto>> result = new DataResult<List<FormElementDto>>
            {
                Data = _mapper.Map<List<FormElementDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<FormElementDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<FormElementDto> result = new DataResult<FormElementDto>
            {
                Data = _mapper.Map<FormElementDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<FormElementDto> Save(FormElementDto dto)
        {
            DataResult<FormElementDto> result = null;
            var entity = _mapper.Map<FormElement>(dto);
            var data = manager.Save(entity);
            result = new DataResult<FormElementDto>
            {
                Data = _mapper.Map<FormElementDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<FormElementDto> Update(FormElementDto dto)
        {
            DataResult<FormElementDto> result = null;
            var entity = _mapper.Map<FormElement>(dto);
            var data = manager.Update(entity);
            result = new DataResult<FormElementDto>
            {
                Data = _mapper.Map<FormElementDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
