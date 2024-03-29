﻿using AutoMapper;
using Inta.EntityFramework.Core.Base;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Bussiness.DataContext;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class EditorTemplateService : IEditorTemplateService
    {
        private IMapper _mapper;
        private UnitOfWork<DefaultDataContext> unitOfWork;
        private RepositoryBase<EditorTemplate, DefaultDataContext> manager;
        public EditorTemplateService(IMapper mapper)
        {
            _mapper = mapper;
            unitOfWork = new UnitOfWork<DefaultDataContext>();
            manager = unitOfWork.AddRepository<EditorTemplate>();
        }

        public DataResult<EditorTemplateDto> Delete(EditorTemplateDto dto)
        {
            var entity = _mapper.Map<EditorTemplate>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<EditorTemplateDto>>(data);
            return result;
        }

        public DataResult<List<EditorTemplateDto>> Find(Expression<Func<EditorTemplate, bool>>? filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<EditorTemplateDto>>>(data);

            return result;
        }

        public DataResult<EditorTemplateDto> Get(Expression<Func<EditorTemplate, bool>>? filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<EditorTemplateDto>>(data);

            return result;
        }

        public DataResult<EditorTemplateDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<EditorTemplateDto>>(data);
            return result;
        }

        public DataResult<EditorTemplateDto> Save(EditorTemplateDto dto)
        {
            var entity = _mapper.Map<EditorTemplate>(dto);
            var data = manager.Save(entity);
            unitOfWork.SaveChanges();
            var result = _mapper.Map<DataResult<EditorTemplateDto>>(data);
            return result;
        }

        public DataResult<EditorTemplateDto> Update(EditorTemplateDto dto, string[]? updateFields = null)
        {
            var entity = _mapper.Map<EditorTemplate>(dto);
            var data = manager.Update(entity);
            unitOfWork.SaveChanges();
            var result = _mapper.Map<DataResult<EditorTemplateDto>>(data);
            return result;
        }
    }
}
