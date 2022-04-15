﻿using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class GeneralSettingsService : IGeneralSettingsService
    {
        private IMapper _mapper = null;
        private GeneralSettingsManager manager = null;
        public GeneralSettingsService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new GeneralSettingsManager();
        }

        public DataResult<GeneralSettingsDto> Delete(GeneralSettingsDto dto)
        {
            var entity = _mapper.Map<GeneralSettings>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<GeneralSettingsDto>>(data);
            return result;
        }

        public DataResult<List<GeneralSettingsDto>> Find(Expression<Func<GeneralSettings, bool>> filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<GeneralSettingsDto>>>(data);

            return result;
        }

        public DataResult<GeneralSettingsDto> Get(Expression<Func<GeneralSettings, bool>> filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<GeneralSettingsDto>>(data);

            return result;
        }

        public DataResult<GeneralSettingsDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<GeneralSettingsDto>>(data);
            return result;
        }

        public DataResult<GeneralSettingsDto> Save(GeneralSettingsDto dto)
        {
            var entity = _mapper.Map<GeneralSettings>(dto);
            var data = manager.Save(entity);
            var result = _mapper.Map<DataResult<GeneralSettingsDto>>(data);
            return result;
        }

        public DataResult<GeneralSettingsDto> Update(GeneralSettingsDto dto)
        {
            var entity = _mapper.Map<GeneralSettings>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<GeneralSettingsDto>>(data);
            return result;
        }
    }
}
