using Inta.EntityFramework.Core.Abstract;
using Microsoft.EntityFrameworkCore;
using System;

namespace Inta.EntityFramework.Core.Base
{
    //Buradaki hata dbcontext in her seferinde yeniden oluşturulmasıdır.
    //DbContext burada oluşturulup repositorylere parametre olarak geçilecek.
    //Birde transaction işlemleri test edilmeli.
    public class UnitOfWork<TContext> : IDisposable where TContext : DbContext, new()
    {
        private static TContext? DataContext;
        public UnitOfWork()
        {
            if (DataContext == null || DataContext.GetType() != typeof(TContext))
                DataContext = new TContext();
        }
            
        public TContext? GetDataContext => DataContext;
        public RepositoryBase<TEntity, TContext> AddRepository<TEntity>() where TEntity : class, IEntity, new()
        {
            return new RepositoryBase<TEntity, TContext>(DataContext);
        }

        public void SaveChanges()
        {
            using (var transaction = DataContext?.Database.BeginTransaction())
            {
                try
                {
                    DataContext?.SaveChanges();
                    transaction?.Commit();

                }
                catch (Exception ex)
                {
                    transaction?.Rollback();
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
                    DataContext?.Dispose();
                    DataContext = null;
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
