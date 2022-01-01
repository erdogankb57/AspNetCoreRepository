using Inta.EntityFramework.Core.Base;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.DataAccess.DataContext;

namespace Inta.Kurumsal.DataAccess.Manager
{
    public class MessageTypeManager : RepositoryBase<Inta.Kurumsal.Entity.Concrete.MessageType, DefaultDataContext>
    {
        public MessageTypeManager()
        {
        }
    }
}
