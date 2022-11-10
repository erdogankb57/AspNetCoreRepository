using Inta.EntityFramework.Core.Abstract;
using Inta.EntityFramework.Core.Model;
using Inta.Framework.Logging.Log;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;

namespace Inta.EntityFramework.Core.Base
{
    public class RepositoryBase<TEntity, TContext> : IRepositoryBase<TEntity, TContext> where TEntity : class, IEntity, new() where TContext : DbContext, new()
    {
        private readonly DbContext? _dbContext = null;
        public RepositoryBase(DbContext? dbContext = null)
        {
            if (_dbContext == null)
                _dbContext = dbContext;
        }
        public DataResult<TEntity> Delete(TEntity Entity)
        {
            DataResult<TEntity> result = new DataResult<TEntity>();
            try
            {
                if (_dbContext != null)
                {
                    var local = _dbContext.Set<TEntity>()
                      .Local
                      .FirstOrDefault(entry => entry.Id.Equals(Entity.Id));

                    if (local != null)
                    {
                        // detach
                        _dbContext.Entry(local).State = EntityState.Detached;
                    }

                    var deletedEntity = _dbContext.Entry(Entity);
                    deletedEntity.State = EntityState.Deleted;
                    result.ResultType = MessageTypeResult.Success;
                    result.Data = Entity;
                }
            }
            catch (Exception ex)
            {
                result.Data = default(TEntity);
                result.ResultType = MessageTypeResult.Error;

                LogManager.InsertLog(ex, this.GetType().Name + " base repository delete", Entity);

            }

            return result;
        }

        public DataResult<TEntity> Get(Expression<Func<TEntity, bool>>? filter)
        {
            DataResult<TEntity> result = new DataResult<TEntity>();
            try
            {
                if (_dbContext != null)
                {
                    if (filter != null)
                    {
                        result.Data = _dbContext.Set<TEntity>().AsNoTracking().SingleOrDefault(filter);
                        //Bu özellik entity frameworkdaki asnotracking (yani izleme özelliğini) kapatır. Bunu eklemezsek önce get sonra update olduğunda hata alıyoruz.
                        //_dbContext.Entry<TEntity>(result.Data).State = EntityState.Detached;
                    }
                    result.ResultType = MessageTypeResult.Success;
                }
            }
            catch (Exception ex)
            {
                result.ResultType = MessageTypeResult.Error;
                result.Data = default(TEntity);
                result.ErrorMessage = ex.ToString();

                LogManager.InsertLog(ex, this.GetType().Name + " base repository get", filter);

            }
            return result;
        }

        public DataResult<TEntity> GetById(int id)
        {
            DataResult<TEntity> result = new DataResult<TEntity>();

            try
            {
                if (_dbContext != null)
                {
                    var data = _dbContext.Set<TEntity>().AsNoTracking().SingleOrDefault(s => s.Id == id);
                    result.Data = data;
                    //_dbContext.Entry<TEntity>(data).State = EntityState.Detached;
                    result.ResultType = MessageTypeResult.Success;
                }

            }
            catch (Exception ex)
            {
                result.Data = default(TEntity);
                result.ResultType = MessageTypeResult.Error;
                result.ErrorMessage = ex.ToString();

                LogManager.InsertLog(ex, this.GetType().Name + " base repository getById");

            }

            return result;
        }

        public DataResult<IList<TEntity>> Find(Expression<Func<TEntity, bool>>? filter)
        {
            DataResult<IList<TEntity>> result = new DataResult<IList<TEntity>>();
            try
            {
                if (_dbContext != null)
                {
                    if (filter == null)
                        result.Data = _dbContext.Set<TEntity>().AsNoTracking().ToList();
                    else
                        result.Data = _dbContext.Set<TEntity>().AsNoTracking().Where(filter).ToList();

                    result.ResultType = MessageTypeResult.Success;
                }
            }
            catch (Exception ex)
            {
                result.Data = default(IList<TEntity>);
                result.ResultType = MessageTypeResult.Error;
                result.ErrorMessage = ex.ToString();

                LogManager.InsertLog(ex, this.GetType().Name + " base repository find", filter);

            }
            return result;
        }

        public DataResult<TEntity> Save(TEntity Entity)
        {
            DataResult<TEntity> result = new DataResult<TEntity>();
            try
            {

                if (_dbContext != null)
                {

                    var addedEntity = _dbContext.Entry(Entity);
                    addedEntity.State = EntityState.Added;
                    //context.SaveChanges();
                }

                result.Data = Entity;
                result.ResultType = MessageTypeResult.Success;
            }
            catch (Exception ex)
            {
                result.Data = default(TEntity);
                result.ResultType = MessageTypeResult.Error;
                result.ErrorMessage = ex.ToString();

                LogManager.InsertLog(ex, this.GetType().Name + " base repository save", Entity);

            }

            return result;
        }

        public DataResult<TEntity> Update(TEntity Entity, string[]? updateFields = null)
        {
            DataResult<TEntity> result = new DataResult<TEntity>();
            try
            {
                if (_dbContext != null)
                {
                    //Trackin hatasından kurtulmak için kullanıldı
                    var local = _dbContext.Set<TEntity>()
                        .Local
                        .FirstOrDefault(entry => entry.Id.Equals(Entity.Id));

                    if (local != null)
                    {
                        // detach
                        _dbContext.Entry(local).State = EntityState.Detached;
                    }

                    //Trackin hatasından kurtulmak için kullanıldı

                    var updatedEntity = _dbContext.Entry<TEntity>(Entity);

                    if (updateFields != null && updateFields.Count() > 0)
                    {
                        foreach (var item in updatedEntity.Properties.Where(v => updateFields.Any(a => a == v.Metadata.Name) && !v.Metadata.IsPrimaryKey()).ToList())
                            item.IsModified = true;
                    }
                    else
                        updatedEntity.State = EntityState.Modified;

                }

                result.Data = Entity;
                result.ResultType = MessageTypeResult.Success;
            }
            catch (Exception ex)
            {
                result.Data = default(TEntity);
                result.ResultType = MessageTypeResult.Error;
                result.ErrorMessage = ex.ToString();

                LogManager.InsertLog(ex, this.GetType().Name + " base repository update", Entity);
            }

            return result;
        }
    }

}
