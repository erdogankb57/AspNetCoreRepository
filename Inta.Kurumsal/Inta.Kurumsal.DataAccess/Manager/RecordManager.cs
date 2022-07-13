using Inta.EntityFramework.Core.Base;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.DataAccess.DataContext;
using Inta.Kurumsal.Entity.ComplexType;
using Inta.Kurumsal.Entity.Concrete;

namespace Inta.Kurumsal.DataAccess.Manager
{
    public class RecordManager: RepositoryBase<Record, DefaultDataContext>
	{
		public RecordManager()
		{
		}

        public object Filter(List<SearchParameterItem> filter)
        {
            int categoryId = !String.IsNullOrEmpty(filter.FirstOrDefault(v => v.Key == "CategoryId").Value.ToString()) ?
               Convert.ToInt32(filter.FirstOrDefault(v => v.Key == "CategoryId").Value) : 0;

            int languageId = Convert.ToInt32(filter.FirstOrDefault(v => v.Key == "LanguageId").Value);


            DataResult<List<Record>> result = new DataResult<List<Record>>();
            using (var context = new DefaultDataContext())
            {
                var categorys = from c in context.Records
                                where
                                c.LanguageId == languageId
                                select c;

                if (categoryId>0)
                {
                    categorys = from c in categorys
                                where
                                c.CategoryId == categoryId
                                select c;
                }

                result.Data = categorys.ToList();
            }

            return result;

        }
    }
}
