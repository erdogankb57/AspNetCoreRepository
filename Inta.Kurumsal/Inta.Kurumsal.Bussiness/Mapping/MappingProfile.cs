using AutoMapper;
using Inta.Kurumsal.Entity.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inta.Kurumsal.Bussiness.Mapping
{
    public class MappingProfile:Profile
    {
        public MappingProfile()
        {
            CreateMap<BannerType, BannerTypeDto>();
            CreateMap<BannerTypeDto, BannerType>();

        }
    }
}
