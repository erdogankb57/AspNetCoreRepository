﻿using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class SystemRoleService : ISystemRoleService
    {
        private IMapper _mapper = null;
        private SystemRoleManager manager = null;
        public SystemRoleService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new SystemRoleManager();
        }

        public DataResult<SystemRoleDto> Delete(SystemRoleDto dto)
        {
            DataResult<SystemRoleDto> result = null;
            var entity = _mapper.Map<SystemRole>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<SystemRoleDto>
            {
                Data = _mapper.Map<SystemRoleDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<SystemRoleDto>> Find(Expression<Func<SystemRole, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<SystemRoleDto>> result = new DataResult<List<SystemRoleDto>>
            {
                Data = _mapper.Map<List<SystemRoleDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<SystemRoleDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<SystemRoleDto> result = new DataResult<SystemRoleDto>
            {
                Data = _mapper.Map<SystemRoleDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<SystemRoleDto> Save(SystemRoleDto dto)
        {
            DataResult<SystemRoleDto> result = null;
            var entity = _mapper.Map<SystemRole>(dto);
            var data = manager.Save(entity);
            result = new DataResult<SystemRoleDto>
            {
                Data = _mapper.Map<SystemRoleDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<SystemRoleDto> Update(SystemRoleDto dto)
        {
            DataResult<SystemRoleDto> result = null;
            var entity = _mapper.Map<SystemRole>(dto);
            var data = manager.Update(entity);
            result = new DataResult<SystemRoleDto>
            {
                Data = _mapper.Map<SystemRoleDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<SystemRoleDto> Get(Expression<Func<SystemRole, bool>> filter = null)
        {
            var data = manager.Get(filter);
            DataResult<SystemRoleDto> result = new DataResult<SystemRoleDto>
            {
                Data = _mapper.Map<SystemRoleDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }
    }
}
