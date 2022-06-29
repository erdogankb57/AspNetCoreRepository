using Inta.EntityFramework.Core.Abstract;
using Inta.EntityFramework.Core.Base;
using Inta.EntityFramework.Core.DynamicExpression;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.DataContext;
using Inta.Kurumsal.Dto.Abstract;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.AspNetCore.Html;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;

namespace Inta.Kurumsal.Bussiness.Common
{
    public static class Html
    {
        private static IHttpContextAccessor httpContext = null;
        public static void SetHttpContext(IHttpContextAccessor context)
        {
            httpContext = context;
        }
        public static IHtmlContent DropDownListForService<TDto, TEntity>(this IHtmlHelper content, string serviceName, string DisplayName, string ValueName, string objectName, string selectedValue, bool isRequired, string DefaultText, string DefaultValue, Expression<Func<TEntity, bool>> filter = null) where TDto : IDto where TEntity : IEntity
        {
            var serviceType = Assembly.GetExecutingAssembly().GetTypes().FirstOrDefault(t => t.Name == "I" + serviceName + "Service");
            var service = (IBaseService<TDto, TEntity>)httpContext.HttpContext.RequestServices.GetService(serviceType);

            StringBuilder sHtml = new StringBuilder();
            sHtml.Append(@$"<select type=""select"" name=""{objectName}"" id=""{objectName}"" class=""form-control"" {(isRequired ? "required" : "")}>");
            sHtml.Append($@"<option value=""{ DefaultValue }"" >{DefaultText}</option>");
            foreach (var item in service.Find(filter)?.Data)
            {
                var text = item.GetType().GetProperty(DisplayName).GetValue(item);
                var val = item.GetType().GetProperty(ValueName).GetValue(item);

                sHtml.Append($@"<option value=""{ val }"" {(selectedValue == val.ToString() ? "selected" : "")}>{text}</option>");
            }
            sHtml.Append(@"</select>");
            return new HtmlString(sHtml.ToString());
        }
    }
}
