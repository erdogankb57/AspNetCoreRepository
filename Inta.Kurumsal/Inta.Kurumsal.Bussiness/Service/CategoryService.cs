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
            var entity = _mapper.Map<Category>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<CategoryDto>>(data);
            return result;
        }

        public DataResult<List<CategoryDto>> Find(Expression<Func<Category, bool>> filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<CategoryDto>>>(data);

            return result;
        }

        public DataResult<CategoryDto> Get(Expression<Func<Category, bool>> filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<CategoryDto>>(data);

            return result;
        }

        public DataResult<CategoryDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<CategoryDto>>(data);
            return result;
        }

        public DataResult<CategoryDto> Save(CategoryDto dto)
        {
            var entity = _mapper.Map<Category>(dto);
            var data = manager.Save(entity);
            var result = _mapper.Map<DataResult<CategoryDto>>(data);
            return result;
        }

        public DataResult<CategoryDto> Update(CategoryDto dto)
        {
            var entity = _mapper.Map<Category>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<CategoryDto>>(data);
            return result;
        }
    }
}
