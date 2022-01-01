using Inta.EntityFramework.Core.Base;
using Inta.Kurumsal.DataAccess.DataContext;
using Inta.Kurumsal.Entity.Concrete;

namespace Inta.Kurumsal.DataAccess.Manager
{
    public class SystemMenuManager : RepositoryBase<SystemMenu, DefaultDataContext>
    {
        private DefaultDataContext defaultDataContext = null;
        public SystemMenuManager()
        {
            defaultDataContext = new DefaultDataContext();

        }

        public int TopMenuId(int Id)
        {
            int topMenuId = 0;
            var menu = this.GetById(Id);
            if (menu.Data.SystemMenuId != 0)
                topMenuId = TopMenuId(menu.Data.SystemMenuId.Value);
            else
                topMenuId = menu.Data.Id;

            return topMenuId;
        }
    }
}
