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
    public class FirmVariablesService: IFirmVariablesService
    {
        private IMapper _mapper = null;
        private FirmVariablesManager manager = null;
        public FirmVariablesService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new FirmVariablesManager();
        }

        public DataResult<FirmVariablesDto> Delete(FirmVariablesDto dto)
        {
            DataResult<FirmVariablesDto> result = null;
            var entity = _mapper.Map<FirmVariables>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<FirmVariablesDto>
            {
                Data = _mapper.Map<FirmVariablesDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<FirmVariablesDto>> Find(Expression<Func<FirmVariables, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<FirmVariablesDto>> result = new DataResult<List<FirmVariablesDto>>
            {
                Data = _mapper.Map<List<FirmVariablesDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<FirmVariablesDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<FirmVariablesDto> result = new DataResult<FirmVariablesDto>
            {
                Data = _mapper.Map<FirmVariablesDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<FirmVariablesDto> Save(FirmVariablesDto dto)
        {
            DataResult<FirmVariablesDto> result = null;
            var entity = _mapper.Map<FirmVariables>(dto);
            var data = manager.Save(entity);
            result = new DataResult<FirmVariablesDto>
            {
                Data = _mapper.Map<FirmVariablesDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<FirmVariablesDto> Update(FirmVariablesDto dto)
        {
            DataResult<FirmVariablesDto> result = null;
            var entity = _mapper.Map<FirmVariables>(dto);
            var data = manager.Update(entity);
            result = new DataResult<FirmVariablesDto>
            {
                Data = _mapper.Map<FirmVariablesDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
