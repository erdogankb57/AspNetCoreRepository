using Inta.EntityFramework.Core.Base;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.DataAccess.DataContext;
using Inta.Kurumsal.Entity.ComplexType;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.EntityFrameworkCore;
using System.Data.SqlClient;

namespace Inta.Kurumsal.DataAccess.Manager
{
    public class SystemMenuActionRoleManager : RepositoryBase<SystemMenuActionRole, DefaultDataContext>
    {
        public SystemMenuActionRoleManager()
        {

        }

        public DataResult<List<SystemMenuActionRoleModel>> GetSystemMenuActionRoleByUserId(int UserId)
        {
            DataResult<List<SystemMenuActionRoleModel>> result = new DataResult<List<SystemMenuActionRoleModel>>();
            using (var context = new DefaultDataContext())
            {
                try
                {
                    SqlParameter parameter = new SqlParameter("SystemUserId", UserId);
                    result.Data = context.Set<SystemMenuActionRoleModel>().FromSqlRaw<SystemMenuActionRoleModel>
                        ("select r.Id, m.SystemMenuId, r.SystemMenuActionId, r.SystemUserId, m.ControllerName, m.ActionName, m.[Description] from [SystemMenuAction] m inner join SystemMenuActionRole r on m.Id=r.SystemMenuActionId where r.SystemUserId = 44", parameter)
                        .ToList();
                    result.ResultType = EntityFramework.Core.Model.MessageType.Success;
                }
                catch (Exception ex)
                {
                    result.Data = new List<SystemMenuActionRoleModel>();
                    result.ResultType = EntityFramework.Core.Model.MessageType.Error;
                    result.ErrorMessage = ex.ToString();
                }
            }
            return result;
        }
    }
}
