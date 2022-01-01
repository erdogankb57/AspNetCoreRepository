using Inta.EntityFramework.Core.Base;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.DataAccess.DataContext;
using Inta.Kurumsal.Entity.Concrete;
using System.Data;

namespace Inta.Kurumsal.DataAccess.Manager
{
    public class SystemRoleManager : RepositoryBase<SystemRole, DefaultDataContext>
    {
        public SystemRoleManager()
        {
        }

        public DataResult<IList<SystemAction>> GetSystemAction(string userName)
        {
            DataResult<IList<SystemAction>> result = new DataResult<IList<SystemAction>>();
            using (var context = new DefaultDataContext())
            {
                try
                {
                    var parameters = new SqlParameter("@userName", SqlDbType.NVarChar);
                    parameters.Value = (object)userName ?? DBNull.Value;


                    result.Data = context.Set<SystemAction>().FromSqlRaw<SystemAction>("select ac.* from SystemUser su inner join [SystemRole] sr on su.SystemRoleId = sr.Id inner join [SystemActionRole] ar on ar.SystemRoleId = sr.Id inner join [SystemAction] ac on ac.Id = ar.SystemActionId where su.UserName=@userName", parameters).ToList();
                    result.ResultType = EntityCore.Model.MessageType.Success;
                }
                catch (SqlException ex)
                {
                    result.Data = new List<SystemAction>();
                    result.ResultType = EntityCore.Model.MessageType.Error;
                    result.ErrorMessage = ex.ToString();
                }
            }
            return result;
        }
    }
}
