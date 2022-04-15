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
            var entity = _mapper.Map<EditorTemplate>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<EditorTemplateDto>>(data);
            return result;
        }

        public DataResult<List<EditorTemplateDto>> Find(Expression<Func<EditorTemplate, bool>> filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<EditorTemplateDto>>>(data);

            return result;
        }

        public DataResult<EditorTemplateDto> Get(Expression<Func<EditorTemplate, bool>> filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<EditorTemplateDto>>(data);

            return result;
        }

        public DataResult<EditorTemplateDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<EditorTemplateDto>>(data);
            return result;
        }

        public DataResult<EditorTemplateDto> Save(EditorTemplateDto dto)
        {
            var entity = _mapper.Map<EditorTemplate>(dto);
            var data = manager.Save(entity);
            var result = _mapper.Map<DataResult<EditorTemplateDto>>(data);
            return result;
        }

        public DataResult<EditorTemplateDto> Update(EditorTemplateDto dto)
        {
            var entity = _mapper.Map<EditorTemplate>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<EditorTemplateDto>>(data);
            return result;
        }
    }
}
