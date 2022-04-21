using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface IAuthenticationData
    {
        int LanguageId { get; }
        string UserName { get; }
        string Password { get; }
        bool HasSession { get; }
    }
}
