using Inta.Framework.Extension.Model;
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

        public static FileUploadDataModel FileBase64Upload(IFormFile ImageFile)
        {
            FileUploadDataModel result = null;
            StringManager stringManager = new StringManager();
            string extension = System.IO.Path.GetExtension(ImageFile.FileName.ToLower());

            IConfigurationBuilder builder = new ConfigurationBuilder().AddJsonFile("appsettings.json");
            IConfigurationRoot configuration = builder.Build();

            string imageFilePath = Directory.GetCurrentDirectory().ToString() + configuration.GetSection("FileUpload").Value.ToString();

            string random = ImageFile.FileName.Replace(extension, "") + "_" + Guid.NewGuid().ToString();
            random = stringManager.TextUrlCharReplace(random);

            if (extension != ".exe" || extension != ".dll")
            {

                using (var stream = new FileStream(imageFilePath + random + extension, FileMode.Create))
                {
                    ImageFile.CopyTo(stream);
                }

                byte[] bytes = System.IO.File.ReadAllBytes(imageFilePath + random + extension);

                result = new FileUploadDataModel
                {
                    FileBase64Data = Convert.ToBase64String(bytes),
                    Extension = extension,
                    FileName = random,
                    ContentType = ImageFile.ContentType
                };
            }

            return result;
        }
    }
}
