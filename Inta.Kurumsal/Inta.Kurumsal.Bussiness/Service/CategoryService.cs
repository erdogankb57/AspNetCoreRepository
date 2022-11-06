using AutoMapper;
using Inta.EntityFramework.Core.Base;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Bussiness.DataContext;
using Inta.Kurumsal.Dto.ComplexType;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class CategoryService : ICategoryService
    {
        private IMapper? _mapper = null;
        UnitOfWork<DefaultDataContext> unitOfWork;
        RepositoryBase<Category, DefaultDataContext> manager;
        public CategoryService(IMapper mapper)
        {
            _mapper = mapper;
            unitOfWork = new UnitOfWork<DefaultDataContext>();
            manager = unitOfWork.AddRepository<Category>();
        }

        public DataResult<CategoryDto> Delete(CategoryDto dto)
        {
            var entity = _mapper?.Map<Category>(dto);
            var data = manager?.Delete(entity ?? new Category());
            var result = _mapper?.Map<DataResult<CategoryDto>>(data);
            return result ?? new DataResult<CategoryDto>();
        }

        public DataResult<List<CategoryDto>> Find(Expression<Func<Category, bool>>? filter = null)
        {
            var data = manager?.Find(filter);
            var result = _mapper?.Map<DataResult<List<CategoryDto>>>(data);

            return result ?? new DataResult<List<CategoryDto>>();
        }

        public DataResult<List<CategoryAndPageTypeDto>> GetCategoryAndPageTypeList(int categoryId)
        {
            DataResult<List<CategoryAndPageTypeDto>> result = new DataResult<List<CategoryAndPageTypeDto>>();

            try
            {
                var categorys = from pt in unitOfWork.GetDataContext?.PageTypes
                                join ct in unitOfWork.GetDataContext?.Categorys on pt.Id equals ct.PageTypeId
                                where ct.Id == categoryId
                                select new CategoryAndPageTypeDto
                                {
                                    Id = ct.Id,
                                    CategoryLink = ct.CategoryLink,
                                    CategoryUrl = ct.CategoryUrl,
                                    Name = ct.Name,
                                    ControllerName = pt.ControllerName,
                                    ActionName = pt.ActionName,
                                    ViewName = pt.ViewName
                                };

                result.Data = categorys.ToList();
                result.ResultType = MessageTypeResult.Success;
            }
            catch (Exception ex)
            {
                result.ErrorMessage = ex.ToString();
                result.ResultType = MessageTypeResult.Error;
            }
                    
            return result;
        }

        public DataResult<CategoryDto> Get(Expression<Func<Category, bool>>? filter = null)
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
            unitOfWork.SaveChanges();
            var result = _mapper.Map<DataResult<CategoryDto>>(data);
            return result;
        }

        public DataResult<CategoryDto> Update(CategoryDto dto)
        {
            var entity = _mapper.Map<Category>(dto);
            var data = manager.Update(entity);
            unitOfWork.SaveChanges();
            var result = _mapper.Map<DataResult<CategoryDto>>(data);
            return result;
        }
    }
}
