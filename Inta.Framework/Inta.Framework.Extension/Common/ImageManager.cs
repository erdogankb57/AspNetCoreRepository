using Inta.Framework.Extension.Model;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace Inta.Framework.Extension.Common
{
    public class ImageManager
    {

        public static string ImageUploadDoubleCopy(IFormFile ImageFile, int SmallImageWidth, int BigImageWidth, string imageFilePath)
        {
            StringManager stringManager = new StringManager();

            string ImageName = "";
            string extension = System.IO.Path.GetExtension(ImageFile.FileName.ToLower());

            string random = ImageFile.FileName.Replace(extension, "") + "_" + Guid.NewGuid().ToString();
            random = stringManager.TextUrlCharReplace(random);

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
        public static string ImageUploadSingleCopy(IFormFile ImageFile, int ImageWidth, string imageFilePath)
        {
            StringManager stringManager = new StringManager();
            string ImageName = "";
            string extension = System.IO.Path.GetExtension(ImageFile.FileName.ToLower());

            //IConfigurationBuilder builder = new ConfigurationBuilder().AddJsonFile("appsettings.json");
            //IConfigurationRoot configuration = builder.Build();

            //string imageFilePath = configuration.GetSection("FileUpload").Value.ToString();


            string random = ImageFile.FileName.Replace(extension, "") + "_" + Guid.NewGuid().ToString();
            random = stringManager.TextUrlCharReplace(random);

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

        public static string ImageUploadSingleCopy(IFormFile ImageFile,string imageFilePath)
        {
            StringManager stringManager = new StringManager();
            string ImageName = "";
            string extension = System.IO.Path.GetExtension(ImageFile.FileName.ToLower());

            string random = ImageFile.FileName.Replace(extension, "") + "_" + Guid.NewGuid().ToString();
            random = stringManager.TextUrlCharReplace(random);

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

        /*Base64 Formatında Resim Yükleme*/
        public static ImageUploadDataModel ImageBase64Upload(IFormFile ImageFile)
        {
            ImageUploadDataModel result = null;
            StringManager stringManager = new StringManager();
            string extension = System.IO.Path.GetExtension(ImageFile.FileName.ToLower());

            IConfigurationBuilder builder = new ConfigurationBuilder().AddJsonFile("appsettings.json");
            IConfigurationRoot configuration = builder.Build();

            string imageFilePath = Directory.GetCurrentDirectory().ToString() + configuration.GetSection("FileUpload").Value.ToString();

            string random = ImageFile.FileName.Replace(extension, "") + "_" + Guid.NewGuid().ToString();
            random = stringManager.TextUrlCharReplace(random);

            if (extension == ".jpg" | extension == ".jpeg" | extension == ".gif" | extension == ".png")
            {

                using (var stream = new FileStream(imageFilePath + random + extension, FileMode.Create))
                {
                    ImageFile.CopyTo(stream);
                }

                byte[] bytes = System.IO.File.ReadAllBytes(imageFilePath + random + extension);
                var bmp = Bitmap.FromFile(imageFilePath + random + extension);

                result = new ImageUploadDataModel
                {
                    FileBase64Data = Convert.ToBase64String(bytes),
                    Extension = extension,
                    Width = bmp.Width,
                    Height = bmp.Height,
                    FileName = random,
                    ContentType = ImageFile.ContentType
                };

                bmp.Dispose();
            }

            if (File.Exists(imageFilePath + random + extension))
            {
                File.Delete(imageFilePath + random + extension);
            }

            return result;
        }
    }

}
