using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace Inta.Framework.Extension.Common
{
    public class ImageManager
    {
        public static string ImageUploadDoubleCopy(IFormFile ImageFile, string filePath, int SmallImageWidth, int BigImageWidth)
        {
            string ImageName = "";
            string extension = System.IO.Path.GetExtension(ImageFile.FileName.ToLower());

            IConfigurationBuilder builder = new ConfigurationBuilder().AddJsonFile("appsettings.json");
            IConfigurationRoot configuration = builder.Build();



            string imageFilePath = Directory.GetCurrentDirectory().ToString() + configuration.GetSection("FileUpload").Value.ToString();



            string random = ImageFile.FileName.Replace(extension, "") + "_" + Guid.NewGuid().ToString();
            random = TextUrlCharReplace(random);

            if ((extension == ".jpg" | extension == ".jpeg" | extension == ".gif" | extension == ".png") && (ImageFile.FileName.ToLower().IndexOf(";") == -1))
            {
                if (extension == ".jpg" | extension == ".jpeg" | extension == ".gif" | extension == ".png")
                {


                    using (var stream = new FileStream(imageFilePath + random + extension, FileMode.Create))
                    {
                        ImageFile.CopyTo(stream);
                    }

                    System.Drawing.Image imgPhotoVert = System.Drawing.Image.FromFile(imageFilePath + random + extension);
                    System.Drawing.Image imgPhoto = null;

                    imgPhoto = ImageResize(imgPhotoVert, SmallImageWidth);

                    if (extension == ".jpg" | extension == ".jpeg")
                        imgPhoto.Save(imageFilePath + "k_" + random.ToString() + extension, System.Drawing.Imaging.ImageFormat.Jpeg);
                    else if (extension == ".gif")
                        imgPhoto.Save(imageFilePath + "k_" + random.ToString() + extension, System.Drawing.Imaging.ImageFormat.Gif);
                    else if (extension == ".png")
                        imgPhoto.Save(imageFilePath + "k_" + random.ToString() + extension, System.Drawing.Imaging.ImageFormat.Png);
                    else
                        imgPhoto.Save(imageFilePath + "k_" + random.ToString() + extension, System.Drawing.Imaging.ImageFormat.Jpeg);

                    System.Drawing.Image imgPhotoBig = null;

                    imgPhotoBig = ImageResize(imgPhotoVert, BigImageWidth);

                    if (extension == ".jpg" | extension == ".jpeg")
                        imgPhotoBig.Save(imageFilePath + "b_" + random.ToString() + extension, System.Drawing.Imaging.ImageFormat.Jpeg);
                    else if (extension == ".gif")
                        imgPhotoBig.Save(imageFilePath + "b_" + random.ToString() + extension, System.Drawing.Imaging.ImageFormat.Gif);
                    else if (extension == ".png")
                        imgPhotoBig.Save(imageFilePath + "b_" + random.ToString() + extension, System.Drawing.Imaging.ImageFormat.Png);
                    else
                        imgPhotoBig.Save(imageFilePath + "b_" + random.ToString() + extension, System.Drawing.Imaging.ImageFormat.Jpeg);

                    imgPhotoVert.Dispose();

                    ImageName = random.ToString() + extension;
                }
            }

            return ImageName;
        }
        public static string ImageUploadSingleCopy(IFormFile ImageFile, string filePath, int ImageWidth)
        {
            string ImageName = "";
            string extension = System.IO.Path.GetExtension(ImageFile.FileName.ToLower());

            IConfigurationBuilder builder = new ConfigurationBuilder().AddJsonFile("appsettings.json");
            IConfigurationRoot configuration = builder.Build();

            string imageFilePath = configuration.GetSection("FileUpload").ToString();


            string random = ImageFile.FileName.Replace(extension, "") + "_" + Guid.NewGuid().ToString();
            random = TextUrlCharReplace(random);

            if ((extension == ".jpg" | extension == ".jpeg" | extension == ".gif" | extension == ".png") && (ImageFile.FileName.ToLower().IndexOf(";") == -1))
            {
                if (extension == ".jpg" | extension == ".jpeg" | extension == ".gif" | extension == ".png")
                {

                    using (var stream = new FileStream(imageFilePath + random + extension, FileMode.Create))
                    {
                        ImageFile.CopyTo(stream);
                    }


                    System.Drawing.Image imgPhotoVert = System.Drawing.Image.FromFile(imageFilePath + random + extension);
                    System.Drawing.Image imgPhoto = null;

                    imgPhoto = ImageResize(imgPhotoVert, ImageWidth);

                    if (extension == ".jpg" | extension == ".jpeg")
                        imgPhoto.Save(imageFilePath + "k_" + random.ToString() + extension, System.Drawing.Imaging.ImageFormat.Jpeg);
                    else if (extension == ".gif")
                        imgPhoto.Save(imageFilePath + "k_" + random.ToString() + extension, System.Drawing.Imaging.ImageFormat.Gif);
                    else if (extension == ".png")
                        imgPhoto.Save(imageFilePath + "k_" + random.ToString() + extension, System.Drawing.Imaging.ImageFormat.Png);
                    else
                        imgPhoto.Save(imageFilePath + "k_" + random.ToString() + extension, System.Drawing.Imaging.ImageFormat.Jpeg);

                    imgPhotoVert.Dispose();

                    ImageName = random.ToString() + extension;
                }
            }

            return ImageName;
        }

        public static string ImageUploadSingleCopy(IFormFile ImageFile, string filePath)
        {
            string ImageName = "";
            string extension = System.IO.Path.GetExtension(ImageFile.FileName.ToLower());

            IConfigurationBuilder builder = new ConfigurationBuilder().AddJsonFile("appsettings.json");
            IConfigurationRoot configuration = builder.Build();

            string imageFilePath = configuration.GetSection("FileUpload").ToString();

            string random = ImageFile.FileName.Replace(extension, "") + "_" + Guid.NewGuid().ToString();
            random = TextUrlCharReplace(random);

            if ((extension == ".jpg" | extension == ".jpeg" | extension == ".gif" | extension == ".png") && (ImageFile.FileName.ToLower().IndexOf(";") == -1))
            {
                if (extension == ".jpg" | extension == ".jpeg" | extension == ".gif" | extension == ".png")
                {
                    using (var stream = new FileStream(imageFilePath + random + extension, FileMode.Create))
                    {
                        ImageFile.CopyTo(stream);
                    }

                    ImageName = random.ToString() + extension;
                }
            }

            return ImageName;
        }

        private static System.Drawing.Image ImageResize(System.Drawing.Image imgPhoto, int yukseklik)
        {
            int sourceWidth = imgPhoto.Width;
            int sourceHeight = imgPhoto.Height;

            int destWidth = yukseklik;
            int destHeight = sourceHeight * yukseklik / imgPhoto.Width;

            Bitmap bmPhoto = new Bitmap(destWidth, destHeight);
            bmPhoto.SetResolution(imgPhoto.HorizontalResolution, imgPhoto.VerticalResolution);

            Graphics grPhoto = Graphics.FromImage(bmPhoto);
            grPhoto.PixelOffsetMode = PixelOffsetMode.HighQuality;
            grPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;
            grPhoto.SmoothingMode = SmoothingMode.HighQuality;

            grPhoto.FillRectangle(Brushes.Transparent, 0, 0, destWidth, destHeight);

            grPhoto.DrawImage(imgPhoto, new Rectangle(0, 0, destWidth, destHeight), new Rectangle(0, 0, sourceWidth, sourceHeight), GraphicsUnit.Pixel);

            grPhoto.Dispose();
            return bmPhoto;
        }

        private static string TextUrlCharReplace(string str)
        {
            if (str != null)
            {
                str = str.Trim();
                string gvCopy = str.ToLowerInvariant().Trim();
                string[,] arr = new string[,]
                {
                { ".", "-" },{ "_", "-" },{ ",", "-" },{ "'", "-" },{ ":", "" },{ "%27", "" },{ "?", "" },{ "*", "" },{ "&#199;", "o" },{ "&#246;", "o" },{ "&#214;", "o" },{ "&#252;", "u" },{ "&#220;", "u" },{ "&#231;", "c" },{ "&#174;", "®" },{ "&amp;", "-" },{ "&nbsp;", "-" },{ " ", "_" },{ ";", "-" },{ "%20", "-" },{ "/", "-" },{ ".", "" },{ "ç", "c" },{ "Ç", "c" },{ "ğ", "g" },{ "Ğ", "g" },{ "İ", "i" },{ "I", "i" },{ "ı", "i" },{ "ö", "o" },{ "Ö", "o" },{ "ş", "s" },{ "Ş", "s" },{ "ü", "u" },{ "Ü", "u" },{ ".", "" },{ "’", "" },{ "'", "" },{ "(", "-" },{ ")", "-" },{ "/", "-" },{ "<", "-" },{ ">", "-" },{ "\"", "-" },{ "\\", "-" },{ "{", "-" },{ "}", "-" },{ "%", "-" },{ "&", "-" },{ "+", "-" },{ "//", "-" },{ "--", "-" },{ "³", "-" },{ "²", "2" },{ "“", null },{ "”", null },{ "’", null },{ "”", null },{ "&", "-" },{ "[^\\w]", "-" },{ "----", "-" },{ "---", "-" },{ "--", "-" },{ "[", "-" },{ "]", "-" },{ "½", "-" },{ "^", "-" },{ "~", "-" },{ "|", "-" },{ "*", "-" },{ "#", "-" },{ "%", "-" },{ "union", "" },{ "select", "" },{ "update", "" },{ "insert", "" },{ "delete", "" },{ "drop", "" },{ "into", "" },{ "where", "" },{ "order", "" },{ "chr", "" },{ "isnull", "" },{ "xtype", "" },{ "sysobject", "" },{ "syscolumns", "" },{ "convert", "" },{ "db_name", "" },{ "@@", "-" },{ "@var", "-" },{ "declare", "" },{ "execute", "" },{ "having", "" },{ "1=1", "-" },{ "exec", "" },{ "cmdshell", "" },{ "master", "" },{ "cmd", "-" },{ "xp_", "-" },{ "--", "-" }
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
