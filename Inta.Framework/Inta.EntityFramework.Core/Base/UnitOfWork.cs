using Inta.EntityFramework.Core.Abstract;
using Inta.Framework.Logging.Log;
using Microsoft.EntityFrameworkCore;
using System;

namespace Inta.EntityFramework.Core.Base
{
    //Buradaki hata dbcontext in her seferinde yeniden oluşturulmasıdır.
    //DbContext burada oluşturulup repositorylere parametre olarak geçilecek.
    //Birde transaction işlemleri test edilmeli.
    public class UnitOfWork<TContext> : IDisposable where TContext : DbContext, new()
    {
        private readonly TContext? DataContext;
        public UnitOfWork()
        {
            if (DataContext == null)
            {
                DataContext = new TContext();
                //DataContext.ChangeTracker.QueryTrackingBehavior = QueryTrackingBehavior.NoTracking;
            }
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
                    LogManager.InsertLog(ex,"Kayıt işlemi sırasında hata oluştu", null);
                    throw ex;
                }
            }
        }

        private bool Disposed = false;
        protected virtual void Dispose(bool Disposing)
        {
            if (!this.Disposed)
            {
                if (Disposing)
                {
                    DataContext?.Dispose();
                }
            }

            this.Disposed = true;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}
