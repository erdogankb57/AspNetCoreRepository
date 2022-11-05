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
    public class RepositoryBase<TEntity, TContext>:IRepositoryBase<TEntity,TContext> where TEntity : class, IEntity, new() where TContext : DbContext, new()
    {
        private DbContext? _dbContext = null;
        public RepositoryBase(DbContext? dbContext = null)
        {
            _dbContext = dbContext;
        }
        public DataResult<TEntity> Delete(TEntity Entity)
        {
            DataResult<TEntity> result = new DataResult<TEntity>();
            using (var context = new TContext())
            {
                try
                {
                    var deletedEntity = context.Entry(Entity);
                    deletedEntity.State = EntityState.Deleted;
                    context.SaveChanges();
                    
                    result.ResultType = MessageTypeResult.Success;
                    result.Data = Entity;
                }
                catch (Exception ex)
                {
                    result.Data = default(TEntity);
                    result.ResultType = MessageTypeResult.Error;

                    LogManager.InsertLog(ex, this.GetType().Name + " base repository delete", Entity);

                }
            }

            return result;
        }

        public DataResult<TEntity> Get(Expression<Func<TEntity, bool>> filter)
        {
            DataResult<TEntity> result = new DataResult<TEntity>();
            using (var context = new TContext())
            {
                try
                {
                    result.Data = context.Set<TEntity>().SingleOrDefault(filter);
                    result.ResultType = MessageTypeResult.Success;
                }
                catch (Exception ex)
                {
                    result.ResultType = MessageTypeResult.Error;
                    result.Data = default(TEntity);
                    result.ErrorMessage = ex.ToString();

                    LogManager.InsertLog(ex, this.GetType().Name + " base repository get", filter);

                }
            }
            return result;
        }

        public DataResult<TEntity> GetById(int id)
        {
            DataResult<TEntity> result = new DataResult<TEntity>();

            using (var context = new TContext())
            {
                try
                {
                    result.Data = context.Set<TEntity>().SingleOrDefault(s => s.Id == id);
                    result.ResultType = MessageTypeResult.Success;
                }
                catch (Exception ex)
                {
                    result.Data = default(TEntity);
                    result.ResultType = MessageTypeResult.Error;
                    result.ErrorMessage = ex.ToString();

                    LogManager.InsertLog(ex, this.GetType().Name + " base repository getById");

                }
            }

            return result;
        }

        public DataResult<IList<TEntity>> Find(Expression<Func<TEntity, bool>> filter)
        {
            DataResult<IList<TEntity>> result = new DataResult<IList<TEntity>>();
            using (var context = new TContext())
            {
                try
                {
                    if (filter == null)
                        result.Data = context.Set<TEntity>().ToList();
                    else
                        result.Data = context.Set<TEntity>().Where(filter).ToList();
                    result.ResultType = MessageTypeResult.Success;
                }
                catch (Exception ex)
                {
                    result.Data = default(IList<TEntity>);
                    result.ResultType = MessageTypeResult.Error;
                    result.ErrorMessage = ex.ToString();

                    LogManager.InsertLog(ex, this.GetType().Name + " base repository find", filter);

                }
            }
            return result;
        }

        public DataResult<TEntity> Save(TEntity Entity)
        {
            DataResult<TEntity> result = new DataResult<TEntity>();
            using (var context = new TContext())
            {
                try
                {
                    var addedEntity = context.Entry(Entity);
                    addedEntity.State = EntityState.Added;
                    context.SaveChanges();

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
            }

            return result;
        }

        public DataResult<TEntity> Update(TEntity Entity)
        {
            DataResult<TEntity> result = new DataResult<TEntity>();
            using (var context = new TContext())
            {
                try
                {
                    var updatedEntity = context.Entry(Entity);
                    updatedEntity.State = EntityState.Modified;
                    context.SaveChanges();

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
            }

            return result;
        }
    }

}
