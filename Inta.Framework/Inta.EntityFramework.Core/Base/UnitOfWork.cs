using Inta.EntityFramework.Core.Abstract;
using Microsoft.EntityFrameworkCore;
using System;

namespace Inta.EntityFramework.Core.Base
{
    public class UnitOfWork<TContext> : IDisposable where TContext:DbContext,new() 
    {
        private DbContext _dbContext;
        public UnitOfWork()
        {
            _dbContext = new TContext();
        }

        public RepositoryBase<TEntity,TContext> AddRepository<TEntity>() where TEntity: class, IEntity, new()
        {
            return new RepositoryBase<TEntity, TContext>();
        }

        public void SaveChanges()
        {
            using (var transaction = _dbContext.Database.BeginTransaction())
            {
                try
                {
                    _dbContext.SaveChanges();
                    transaction.Commit();

                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                }
            }
        }

        private bool disposed = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    _dbContext.Dispose();
                }
            }

            this.disposed = true;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}
