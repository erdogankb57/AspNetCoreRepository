using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface IEditorTemplateService
    {
        DataResult<EditorTemplateDto> GetById(int id);
        DataResult<List<EditorTemplateDto>> Find(Expression<Func<EditorTemplate, bool>> filter = null);
        DataResult<EditorTemplateDto> Save(EditorTemplateDto dto);
        DataResult<EditorTemplateDto> Update(EditorTemplateDto dto);
        DataResult<EditorTemplateDto> Delete(EditorTemplateDto dto);
        DataResult<EditorTemplateDto> Get(Expression<Func<EditorTemplate, bool>> filter = null);

    }
}