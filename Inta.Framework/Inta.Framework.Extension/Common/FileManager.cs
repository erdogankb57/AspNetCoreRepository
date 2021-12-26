using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using System.Configuration;

namespace Inta.Framework.Extension.Common
{
    public class FileManager
    {
        public static string FileUpload(IFormFile File)
        {
            string extension = System.IO.Path.GetExtension(File.FileName.ToLower());

            IConfigurationBuilder builder = new ConfigurationBuilder().AddJsonFile("appsettings.json");
            IConfigurationRoot configuration = builder.Build();

            Guid random = Guid.NewGuid();


            if (File.Length > 0)
            {
                using (var stream = new FileStream(configuration.GetSection("FileUpload").ToString() + random + extension , FileMode.Create))
                {
                    File.CopyTo(stream);
                }
            }

            return random + extension;
        }
    }
}
