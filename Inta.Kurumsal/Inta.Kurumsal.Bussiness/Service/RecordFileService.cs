﻿using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class RecordFileService : IRecordFileService
    {
        private IMapper _mapper = null;
        private RecordFileManager manager = null;
        public RecordFileService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new RecordFileManager();
        }

        public DataResult<RecordFileDto> Delete(RecordFileDto dto)
        {
            var entity = _mapper.Map<RecordFile>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<RecordFileDto>>(data);
            return result;
        }

        public DataResult<List<RecordFileDto>> Find(Expression<Func<RecordFile, bool>> filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<RecordFileDto>>>(data);

            return result;
        }

        public DataResult<RecordFileDto> Get(Expression<Func<RecordFile, bool>> filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<RecordFileDto>>(data);

            return result;
        }

        public DataResult<RecordFileDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<RecordFileDto>>(data);
            return result;
        }

        public DataResult<RecordFileDto> Save(RecordFileDto dto)
        {
            var entity = _mapper.Map<RecordFile>(dto);
            var data = manager.Save(entity);
            var result = _mapper.Map<DataResult<RecordFileDto>>(data);
            return result;
        }

        public DataResult<RecordFileDto> Update(RecordFileDto dto)
        {
            var entity = _mapper.Map<RecordFile>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<RecordFileDto>>(data);
            return result;
        }
    }
}
