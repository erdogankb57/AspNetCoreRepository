using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inta.Framework.Extension.Common
{
    public class StringManager
    {
        public string TextUrlCharReplace(string str)
        {
            if (str != null)
            {
                str = str.Trim();
                string gvCopy = str.ToLowerInvariant().Trim();
                string[,] arr = new string[,]
                {
                { ".", "-" },{ "_", "-" },{ ",", "-" },{ "'", "-" },{ ":", "" },{ "%27", "" },{ "?", "" },{ "*", "" },{ "&#199;", "o" },{ "&#246;", "o" },{ "&#214;", "o" },{ "&#252;", "u" },{ "&#220;", "u" },{ "&#231;", "c" },{ "&#174;", "®" },{ "&amp;", "-" },{ "&nbsp;", "-" },{ " ", "-" },{ ";", "-" },{ "%20", "-" },{ "/", "-" },{ ".", "" },{ "ç", "c" },{ "Ç", "c" },{ "ğ", "g" },{ "Ğ", "g" },{ "İ", "i" },{ "I", "i" },{ "ı", "i" },{ "ö", "o" },{ "Ö", "o" },{ "ş", "s" },{ "Ş", "s" },{ "ü", "u" },{ "Ü", "u" },{ ".", "" },{ "’", "" },{ "'", "" },{ "(", "-" },{ ")", "-" },{ "/", "-" },{ "<", "-" },{ ">", "-" },{ "\"", "-" },{ "\\", "-" },{ "{", "-" },{ "}", "-" },{ "%", "-" },{ "&", "-" },{ "+", "-" },{ "//", "-" },{ "--", "-" },{ "³", "-" },{ "²", "2" },{ "“", null },{ "”", null },{ "’", null },{ "”", null },{ "&", "-" },{ "[^\\w]", "-" },{ "----", "-" },{ "---", "-" },{ "--", "-" },{ "[", "-" },{ "]", "-" },{ "½", "-" },{ "^", "-" },{ "~", "-" },{ "|", "-" },{ "*", "-" },{ "#", "-" },{ "%", "-" },{ "union", "" },{ "select", "" },{ "update", "" },{ "insert", "" },{ "delete", "" },{ "drop", "" },{ "into", "" },{ "where", "" },{ "order", "" },{ "chr", "" },{ "isnull", "" },{ "xtype", "" },{ "sysobject", "" },{ "syscolumns", "" },{ "convert", "" },{ "db_name", "" },{ "@@", "-" },{ "@var", "-" },{ "declare", "" },{ "execute", "" },{ "having", "" },{ "1=1", "-" },{ "exec", "" },{ "cmdshell", "" },{ "master", "" },{ "cmd", "-" },{ "xp_", "-" },{ "--", "-" }
                };
                int abc = -1;
                for (int i = 0; i < arr.Length / 2; i++)
                {
                    abc = gvCopy.IndexOf(arr[i, 0]);
                    if (abc > -1)
                    {
                    bastan:
                        str = str.Substring(0, abc) + arr[i, 1] + str.Substring(abc + arr[i, 0].Length, str.Length - abc - arr[i, 0].Length);
                        gvCopy = gvCopy.Substring(0, abc) + arr[i, 1] + gvCopy.Substring(abc + arr[i, 0].Length, gvCopy.Length - abc - arr[i, 0].Length);
                        abc = gvCopy.IndexOf(arr[i, 0]);
                        if (abc > -1) goto bastan;
                    }
                }
            }
            return str.ToLowerInvariant().Trim();
        }
    }
}
