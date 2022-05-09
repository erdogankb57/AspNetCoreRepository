using Inta.Framework.Extension.Serializer;
using Inta.Kurumsal.Bussiness.Abstract;
using Microsoft.AspNetCore.Http;
using System.Text;

namespace Inta.Kurumsal.Bussiness.Common
{
    public class AuthenticationData : IAuthenticationData
    {
        private IHttpContextAccessor _httpContextAccessor;
        public AuthenticationData(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }

        public int LanguageId
        {
            get
            {
                if (GetAuthenticationData.ContainsKey("languageId"))
                    return Convert.ToInt32(GetAuthenticationData["languageId"]);
                else
                    return 0;
            }
        }

        public string UserName
        {
            get
            {
                if (GetAuthenticationData.ContainsKey("userName"))
                    return GetAuthenticationData["userName"].ToString();
                else
                    return "";
            }
        }

        public string Password
        {
            get
            {
                if (GetAuthenticationData.ContainsKey("password"))
                    return GetAuthenticationData["password"].ToString();
                else
                    return "";
            }
        }
        public string LoginDate
        {
            get
            {
                if (GetAuthenticationData.ContainsKey("loginDate"))
                    return GetAuthenticationData["loginDate"].ToString();
                else
                    return "";
            }
        }
        public bool HasSession
        {
            get
            {
                if (GetAuthenticationData.Count > 0)
                    return true;
                else
                    return false;
            }
        }

        private Dictionary<string, string> GetAuthenticationData
        {
            get
            {
                JavaScript<Dictionary<string, string>> serializer = new JavaScript<Dictionary<string, string>>();

                if (_httpContextAccessor.HttpContext.Session.GetString("AuthData") != null)
                    return serializer.Deserialize(_httpContextAccessor.HttpContext.Session.GetString("AuthData"));
                else if (_httpContextAccessor.HttpContext.Request.Cookies["AuthData"] != null)
                    return serializer.Deserialize(_httpContextAccessor.HttpContext.Request.Cookies["AuthData"]);
                else
                    return new Dictionary<string, string>();
            }
        }


    }
}
