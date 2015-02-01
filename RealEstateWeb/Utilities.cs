using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.IO;
using System.Configuration;
using System.Web.UI;


namespace RealEstateWeb
{
    public static class Utilities
    {
        public static Image ToMaxSize(Image image, int maxWidth, int maxHeight)
        {
            int newWidth = 0;
            int newHeight = 0;
            int currentWidth = image.Width;
            int currentHeight = image.Height;

            if ((currentWidth / (double)maxWidth) > (currentHeight / (double)maxHeight))
            {
                newWidth = maxWidth;
                newHeight = Convert.ToInt32(currentHeight * (maxWidth / (double)currentWidth));
                if (newHeight > maxHeight)
                {
                    newWidth = Convert.ToInt32(maxWidth * (maxHeight / (double)newHeight));
                    newHeight = maxHeight;
                }
            }
            else
            {
                newWidth = Convert.ToInt32(currentWidth * (maxHeight / (double)currentHeight));
                newHeight = maxHeight;
                if (newWidth > maxWidth)
                {
                    newWidth = maxWidth;
                    newHeight = Convert.ToInt32(maxHeight * (maxWidth / (double)newWidth));
                }
            }
           

            Bitmap newImage = new Bitmap(newWidth, newHeight);
            newImage.SetResolution(72, 72); //web resolution;

            //create a graphics object
            Graphics gr = Graphics.FromImage(newImage);

            //just in case it's a transparent GIF force the bg to white
            SolidBrush sb = new SolidBrush(System.Drawing.Color.White);
            gr.FillRectangle(sb, 0, 0, newImage.Width, newImage.Height);

            //Re-draw the image to the specified height and width
            gr.DrawImage(image, 0, 0, newImage.Width, newImage.Height);

            return newImage;
        }


        public static bool DeleteImage(string rootPath, string LargePicture, string ThumbnailPicture)
        {
            bool result = true;

            string ThumbFile=null;
            string LargeFile = null;

            if (LargePicture != null)
                LargeFile = string.Format("{0}{1}", rootPath, LargePicture.Replace('/', '\\'));

            if (ThumbnailPicture != null)
                ThumbFile = string.Format("{0}{1}", rootPath, ThumbnailPicture.Replace('/', '\\')); 
            try
            {
                if (LargeFile!=null)
                    Delete(LargeFile);

                if (ThumbFile!=null)
                    Delete(ThumbFile);
            }
            catch (Exception ex)
            {
                result = false;
            }

            return result;
        }


        public static void Delete(string filepath)
        { 
            
            FileAttributes fa = File.GetAttributes(filepath);

            if ((fa & FileAttributes.ReadOnly) > 0)
            {
                fa ^= FileAttributes.ReadOnly;
                File.SetAttributes(filepath, fa);
            }

            File.Delete(filepath);
            
        }

    }
}