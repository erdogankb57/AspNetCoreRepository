﻿using AutoMapper;
using Inta.EntityFramework.Core.Abstract;
using Inta.EntityFramework.Core.Base;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Bussiness.DataContext;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class BannerService : IBannerService
    {
        private IMapper _mapper;
        private IRepositoryBase<Banner,DefaultDataContext> manager = null;
        private UnitOfWork<DefaultDataContext>? unitOfWork = null;
        public BannerService(IMapper mapper)
        {
            _mapper = mapper;
            unitOfWork = new UnitOfWork<DefaultDataContext>();
            manager = unitOfWork.AddRepository<Banner>();
        }

        public DataResult<BannerDto> Delete(BannerDto dto)
        {
            var entity = _mapper.Map<Banner>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<BannerDto>>(data);
            return result;
        }

        public DataResult<List<BannerDto>> Find(Expression<Func<Banner, bool>>? filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<BannerDto>>>(data);

            return result;
        }

        public DataResult<BannerDto> Get(Expression<Func<Banner, bool>>? filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<BannerDto>>(data);
            return result;
        }

        public DataResult<BannerDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<BannerDto>>(data);
            return result;
        }

        public DataResult<BannerDto> Save(BannerDto dto)
        {
            var entity = _mapper.Map<Banner>(dto);
            var data = manager.Save(entity);
            unitOfWork?.SaveChanges();
            var result = _mapper.Map<DataResult<BannerDto>>(data);
            return result;
        }

        public DataResult<BannerDto> Update(BannerDto dto)
        {
            var entity = _mapper.Map<Banner>(dto);
            var data = manager.Update(entity);
            unitOfWork?.SaveChanges();
            var result = _mapper.Map<DataResult<BannerDto>>(data);
            return result;
        }
    }
}
