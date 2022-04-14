using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class EditorTemplateService : IEditorTemplateService
    {
        private IMapper _mapper = null;
        private EditorTemplateManager manager = null;
        public EditorTemplateService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new EditorTemplateManager();
        }

        public DataResult<EditorTemplateDto> Delete(EditorTemplateDto dto)
        {
            DataResult<EditorTemplateDto> result = null;
            var entity = _mapper.Map<EditorTemplate>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<EditorTemplateDto>
            {
                Data = _mapper.Map<EditorTemplateDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<EditorTemplateDto>> Find(Expression<Func<EditorTemplate, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<EditorTemplateDto>> result = new DataResult<List<EditorTemplateDto>>
            {
                Data = _mapper.Map<List<EditorTemplateDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<EditorTemplateDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<EditorTemplateDto> result = new DataResult<EditorTemplateDto>
            {
                Data = _mapper.Map<EditorTemplateDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<EditorTemplateDto> Save(EditorTemplateDto dto)
        {
            DataResult<EditorTemplateDto> result = null;
            var entity = _mapper.Map<EditorTemplate>(dto);
            var data = manager.Save(entity);
            result = new DataResult<EditorTemplateDto>
            {
                Data = _mapper.Map<EditorTemplateDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<EditorTemplateDto> Update(EditorTemplateDto dto)
        {
            DataResult<EditorTemplateDto> result = null;
            var entity = _mapper.Map<EditorTemplate>(dto);
            var data = manager.Update(entity);
            result = new DataResult<EditorTemplateDto>
            {
                Data = _mapper.Map<EditorTemplateDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
