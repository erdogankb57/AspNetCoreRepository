using Inta.EntityFramework.Core.Base;
using Inta.Kurumsal.DataAccess.DataContext;
using Inta.Kurumsal.Entity.Concrete;

namespace Inta.Kurumsal.DataAccess.Manager
{
    public class GeneralSettingsManager : RepositoryBase<GeneralSettings, DefaultDataContext>
    {
        public GeneralSettingsManager()
        {
        }
    }
}
