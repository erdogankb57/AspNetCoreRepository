using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace Inta.Framework.Extension.Serializer
{
    public class JavaScript<T>
    {
        public string Serializer(T obj)
        {
            string val = string.Empty;
            val = JsonConvert.SerializeObject(obj);
            return val;
        }

        public T Deserialize(string val)
        {
            var obj = JsonConvert.DeserializeObject<T>(val);
            return obj;
        }

    }
}

