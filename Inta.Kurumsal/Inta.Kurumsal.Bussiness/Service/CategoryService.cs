using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class CategoryService : ICategoryService
    {
        private IMapper _mapper = null;
        private CategoryManager manager = null;
        public CategoryService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new CategoryManager();
        }

        public DataResult<CategoryDto> Delete(CategoryDto dto)
        {
            DataResult<CategoryDto> result = null;
            var entity = _mapper.Map<Category>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<CategoryDto>
            {
                Data = _mapper.Map<CategoryDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<CategoryDto>> Find(Expression<Func<Category, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<CategoryDto>> result = new DataResult<List<CategoryDto>>
            {
                Data = _mapper.Map<List<CategoryDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<CategoryDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<CategoryDto> result = new DataResult<CategoryDto>
            {
                Data = _mapper.Map<CategoryDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<CategoryDto> Save(CategoryDto dto)
        {
            DataResult<CategoryDto> result = null;
            var entity = _mapper.Map<Category>(dto);
            var data = manager.Save(entity);
            result = new DataResult<CategoryDto>
            {
                Data = _mapper.Map<CategoryDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<CategoryDto> Update(CategoryDto dto)
        {
            DataResult<CategoryDto> result = null;
            var entity = _mapper.Map<Category>(dto);
            var data = manager.Update(entity);
            result = new DataResult<CategoryDto>
            {
                Data = _mapper.Map<CategoryDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
