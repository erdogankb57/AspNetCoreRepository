using Inta.EntityFramework.Core.Model;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace Inta.EntityFramework.Core.Abstract
{
    public interface IRepositoryBase<TEntity, DataContext>
    {
        DataResult<TEntity> GetById(int id);
        DataResult<TEntity> Get(Expression<Func<TEntity, bool>> filter);
        DataResult<TEntity> Update(TEntity Entity);
        DataResult<TEntity> Save(TEntity Entity);
        DataResult<TEntity> Delete(TEntity Entity);
        DataResult<IList<TEntity>> Find(Expression<Func<TEntity, bool>> filter = null);
    }
}
