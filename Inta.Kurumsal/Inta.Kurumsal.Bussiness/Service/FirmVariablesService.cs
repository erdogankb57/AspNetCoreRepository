using AutoMapper;
using Inta.EntityFramework.Core.Base;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Bussiness.DataContext;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class FirmVariablesService: IFirmVariablesService
    {
        private IMapper _mapper;
        private UnitOfWork<DefaultDataContext> unitOfWork;
        private RepositoryBase<FirmVariables, DefaultDataContext> manager;
        public FirmVariablesService(IMapper mapper)
        {
            _mapper = mapper;
            unitOfWork = new UnitOfWork<DefaultDataContext>();
            manager = unitOfWork.AddRepository<FirmVariables>();
        }

        public DataResult<FirmVariablesDto> Delete(FirmVariablesDto dto)
        {
            var entity = _mapper.Map<FirmVariables>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<FirmVariablesDto>>(data);
            return result;
        }

        public DataResult<List<FirmVariablesDto>> Find(Expression<Func<FirmVariables, bool>> filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<FirmVariablesDto>>>(data);

            return result;
        }

        public DataResult<FirmVariablesDto> Get(Expression<Func<FirmVariables, bool>> filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<FirmVariablesDto>>(data);

            return result;
        }

        public DataResult<FirmVariablesDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<FirmVariablesDto>>(data);
            return result;
        }

        public DataResult<FirmVariablesDto> Save(FirmVariablesDto dto)
        {
            var entity = _mapper.Map<FirmVariables>(dto);
            var data = manager.Save(entity);
            var result = _mapper.Map<DataResult<FirmVariablesDto>>(data);
            return result;
        }

        public DataResult<FirmVariablesDto> Update(FirmVariablesDto dto)
        {
            var entity = _mapper.Map<FirmVariables>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<FirmVariablesDto>>(data);
            return result;
        }
    }
}
