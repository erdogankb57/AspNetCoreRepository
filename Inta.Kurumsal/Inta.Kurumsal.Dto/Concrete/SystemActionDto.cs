﻿using Inta.Kurumsal.Dto.Abstract;

namespace Inta.Kurumsal.Dto.Concrete
{
    public class SystemActionDto : IDto
    {
        public SystemActionDto()
        {

        }

        public int Id { get; set; }
        public int SystemMenuId { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
        public string Description { get; set; }
    }
}
