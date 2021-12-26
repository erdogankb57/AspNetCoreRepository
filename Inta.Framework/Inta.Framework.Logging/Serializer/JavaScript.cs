using Newtonsoft.Json;

namespace Inta.Framework.Logging.Serializer
{
    internal class JavaScript<T>
    {
        internal string Serializer(T obj)
        {
            string val = string.Empty; 
            val = JsonConvert.SerializeObject(obj);
            return val;
        }

        internal T Deserialize(string val)
        {
            var obj = JsonConvert.DeserializeObject<T>(val);
            return obj;
        }

    }
}
