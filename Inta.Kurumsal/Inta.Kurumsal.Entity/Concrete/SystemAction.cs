using Inta.EntityFramework.Core.Abstract;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inta.Kurumsal.Entity.Concrete
{
    [Table("SystemAction")]
    public class SystemAction : IEntity
    {
        public SystemAction()
        {

        }

        public int Id { get; set; }
        public int SystemMenuId { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
        public string Description { get; set; }
    }
}
