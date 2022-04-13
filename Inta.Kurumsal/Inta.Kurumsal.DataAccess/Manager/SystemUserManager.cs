using Inta.EntityFramework.Core.Base;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.DataAccess.DataContext;
using Inta.Kurumsal.Entity.Concrete;

namespace Inta.Kurumsal.DataAccess.Manager
{
    public class SystemUserManager : RepositoryBase<SystemUser, DefaultDataContext>
    {
        public SystemUserManager()
        {
        }

        public DataResult<List<SystemAction>> GetActiveRole(int roleId)
        {
            DataResult<List<SystemAction>> result = new DataResult<List<SystemAction>>();
            using (var context = new DefaultDataContext())
            {
                var activeRole = from role in context.SystemRoles
                                 join actionRole in context.SystemActionRole on role.Id equals actionRole.SystemRoleId
                                 join action in context.SystemActions on actionRole.SystemActionId equals action.Id
                                 where 
                                 role.Id == roleId
                                 select new SystemAction
                                 {
                                     ActionName = action.ActionName,
                                     ControllerName = action.ControllerName,
                                     Description = action.Description,
                                     SystemMenuId = action.SystemMenuId
                                 };

                result.Data = activeRole.ToList();
            }

            return result;
        }
    }
}
