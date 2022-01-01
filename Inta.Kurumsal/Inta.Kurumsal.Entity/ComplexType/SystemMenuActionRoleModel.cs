using Inta.EntityFramework.Core.Abstract;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inta.Kurumsal.Entity.ComplexType
{
    public class SystemMenuActionRoleModel:IEntity
    {
        [Key]
        [Column("Id")]
        public int Id { get; set; }
        public int SystemMenuId { get; set; }
        public int SystemMenuActionId { get; set; }
        public int SystemUserId { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
        public string Description { get; set; }
    }
}
