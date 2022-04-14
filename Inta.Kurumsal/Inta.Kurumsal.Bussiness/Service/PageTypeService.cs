using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class PageTypeService : IPageTypeService
    {
        private IMapper _mapper = null;
        private PageTypeManager manager = null;
        public PageTypeService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new PageTypeManager();
        }

        public DataResult<PageTypeDto> Delete(PageTypeDto dto)
        {
            DataResult<PageTypeDto> result = null;
            var entity = _mapper.Map<PageType>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<PageTypeDto>
            {
                Data = _mapper.Map<PageTypeDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<PageTypeDto>> Find(Expression<Func<PageType, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<PageTypeDto>> result = new DataResult<List<PageTypeDto>>
            {
                Data = _mapper.Map<List<PageTypeDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<PageTypeDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<PageTypeDto> result = new DataResult<PageTypeDto>
            {
                Data = _mapper.Map<PageTypeDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<PageTypeDto> Save(PageTypeDto dto)
        {
            DataResult<PageTypeDto> result = null;
            var entity = _mapper.Map<PageType>(dto);
            var data = manager.Save(entity);
            result = new DataResult<PageTypeDto>
            {
                Data = _mapper.Map<PageTypeDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<PageTypeDto> Update(PageTypeDto dto)
        {
            DataResult<PageTypeDto> result = null;
            var entity = _mapper.Map<PageType>(dto);
            var data = manager.Update(entity);
            result = new DataResult<PageTypeDto>
            {
                Data = _mapper.Map<PageTypeDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
