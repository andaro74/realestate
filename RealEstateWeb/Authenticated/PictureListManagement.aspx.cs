using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstateBusinessLayer;
using RealEstatePOCO;
using System.Configuration;
using System.Drawing.Imaging;

namespace RealEstateWeb
{
    public partial class PictureListManagement : System.Web.UI.Page
    {
        private PropertyMaster master;
        private int pictureCount;
        protected void Page_Load(object sender, EventArgs e)
        {
            InitializeData();
            if (!Page.IsPostBack)
            {
                BindData();
                
                
            }
            this.lblInstructions.Text = "Type a title, select a picture and press the upload button to save the picture.";
            this.ImageTitleText.Focus();
        }

        private void InitializeData()
        {
            master = (PropertyMaster)Master;

            

            master.PropertyId = (master.PropertyId == 0) ? int.Parse(Page.Request["propertyid"].ToString()) : master.PropertyId;
            if (master.PropertyId > 0)
                master.MenuPropertyNavigaterUrl = string.Format("~/Authenticated/PropertyDetailManagement.aspx?propertyid={0}", master.PropertyId.ToString());
            

            this.lblError.Text = string.Empty;
            this.lblSuccess.Text = string.Empty;
            if (master.PropertyId>0)
            {
                PropertyBLL pBLL=new PropertyBLL();
                pictureCount = pBLL.GetPicturesCount(master.PropertyId);
                if (pictureCount == 0)
                    this.cmdSaveImagesChanges.Enabled = false;
                else
                    this.cmdSaveImagesChanges.Enabled = true;
            }
        }

        protected void ListViewImages_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
          
            Literal litNumber;
            Literal litTitle;
            Image imgProp;
            CheckBox chkIsMain;

            CheckBox chkShow;
            DropDownList drpOrder;
            HiddenField hdnPictureId;

            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                hdnPictureId = (HiddenField)e.Item.FindControl("hdnPictureId");
                litNumber = (Literal)e.Item.FindControl("litNumber");
                litTitle = (Literal)e.Item.FindControl("litTitle");
                imgProp = (Image)e.Item.FindControl("PropertyImage");
                chkIsMain = (CheckBox)e.Item.FindControl("chkIsMain");
                chkShow = (CheckBox)e.Item.FindControl("chkShow");

                drpOrder = (DropDownList)e.Item.FindControl("drpOrder");

               Picture rowPic = e.Item.DataItem as Picture;
               litNumber.Text = String.Format("{0}) ", (e.Item.DisplayIndex + 1).ToString());
               litTitle.Text = rowPic.Name;

               hdnPictureId.Value = rowPic.PictureId.ToString();
               chkIsMain.Checked = rowPic.IsMain;
               imgProp.ImageUrl=string.Format("~/{0}",rowPic.Url);

               chkShow.Checked = rowPic.Show;

               for (int i=1; i <= pictureCount; i++)
               {
                   drpOrder.Items.Add(new ListItem(i.ToString(), i.ToString()));
               }

               drpOrder.SelectedValue = rowPic.Order.ToString();

            }
        }

        private void BindData()
        { 

            PropertyBLL pBLL = new PropertyBLL();
            List<Picture> lstPic= pBLL.GetImagesByPropertyId(master.PropertyId);
            this.ListViewImages.DataSource = lstPic;
            this.ListViewImages.DataBind();
        }

        protected void cmdAddImage_Click(object sender, EventArgs e)
        {
            Response.Redirect(String.Format("~/Authenticated/PictureManagement.aspx?propertyid={0}", master.PropertyId));
        }

        protected void cmdSaveImagesChanges_Click(object sender, EventArgs e)
        {
            CheckBox chkDelete;
            CheckBox chkIsMain;
            CheckBox chkShow;
            DropDownList drpOrder;
            HiddenField hdnPictureId;
            string rootPath = Request.PhysicalApplicationPath;
            
            PropertyBLL pBLL = new PropertyBLL();
            List<Picture> lstPic = pBLL.GetImagesByPropertyId(master.PropertyId);

            var lst = (IList<ListViewDataItem>)this.ListViewImages.Items;


            var lstMain= lst.Where(s => ((CheckBox)s.FindControl("chkIsMain")).Checked == true).Select(s => s).ToList();

            if (lstMain.Count > 1)
            {
                this.lblError.Text = "There can only be one main picture selected.";
                return;
            }

            foreach (ListViewDataItem d in lst)
            {
                
                chkDelete= (CheckBox)d.FindControl("chkDelete");
                chkIsMain = (CheckBox)d.FindControl("chkIsMain");

                chkShow = (CheckBox)d.FindControl("chkShow");
                drpOrder = (DropDownList)d.FindControl("drpOrder");

                hdnPictureId = (HiddenField)d.FindControl("hdnPictureId");
                int pictureId=int.Parse(hdnPictureId.Value);

                if (chkDelete.Checked == false)
                {
                    //Only update if the main changed
                    var pic = lstPic.Where(p => (p.PictureId == pictureId)).Select(p => p).FirstOrDefault();

                    if (pic != null)
                    {
                        pic.IsMain = chkIsMain.Checked;
                        pic.Order = int.Parse(drpOrder.SelectedValue);
                        pic.Show = chkShow.Checked;
                        pBLL.SaveImage(pic);
                    }
                }
                else
                {

                    //Get the picture to delete
                    var pic = lstPic.Where(p => p.PictureId == pictureId).Select(p => p).FirstOrDefault();

                    if (pic != null)
                    {
                        //Delete first the thumbnail if exists.
                        if (Utilities.DeleteImage(rootPath, pic.Url, pic.Thumbnail))
                            pBLL.DeleteImage(pictureId);
                        else
                        {
                            //TODO: Add logging
                            this.lblError.Text = "There was an error updating the pictures.";
                            return;
                        }
                    }
                }
            }

            BindData();
            this.lblSuccess.Text = "The information has been successfully saved.";
        }

        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(String.Format("~/Authenticated/PropertyDetailManagement.aspx?propertyid={0}", master.PropertyId));
        }


        protected void Submit_Click(object sender, EventArgs e)
        {
            // First check if there is a file present.
            // Should also check that the file is an allowed type.
            if (ImageValueFile.HasFile)
            {
                string LargPicture = null, SmallPicture = null;
                // We have a file. Save the image
                if (SaveImage(ImageValueFile.PostedFile, ImageTitleText.Text, out LargPicture, out SmallPicture))
                {
                    this.lblSubmitResult.Text = "Your Image Has Been Saved";

                    if (this.cmdSaveImagesChanges.Enabled == false)
                        this.cmdSaveImagesChanges.Enabled = true;
                    Response.Redirect(String.Format("~/Authenticated/PictureListManagement.aspx?propertyid={0}", master.PropertyId));
                }
                else
                    this.lblSubmitResult.Text = "There was an error in saving your image.";
            }
        }


        public bool SaveImage(HttpPostedFile image, string title, out string LargePicture, out string SmallPicture)
        {

            bool result = true;
            int MaxWidth = 512;
            int MaxHeight = 400;
            int ThumbMaxWidth = 205;
            int ThumbMaxHeight = 160;

            LargePicture = null;
            SmallPicture = null;

            String LargePicturePath = null;
            String ThumbnailPicturePath = null;

            System.Configuration.Configuration rootWebConfig1 =
                System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration(Request.ApplicationPath);

            if (0 < rootWebConfig1.AppSettings.Settings.Count)
            {
                System.Configuration.KeyValueConfigurationElement largPicSettings = rootWebConfig1.AppSettings.Settings["LargePicturePath"];
                System.Configuration.KeyValueConfigurationElement thPicSettings = rootWebConfig1.AppSettings.Settings["ThumbnailPicturePath"];

                if (null != largPicSettings) LargePicturePath = largPicSettings.Value;
                if (null != thPicSettings) ThumbnailPicturePath = thPicSettings.Value;
            }

            // Ensure a unique filename
            string upFileName = Guid.NewGuid().ToString() + image.FileName.Substring(image.FileName.LastIndexOf("."));

            // Should put this into a config file.
            string LargeFile = String.Format("{0}{1}", LargePicturePath, upFileName);
            string ThumbFile = String.Format("{0}{1}", ThumbnailPicturePath, upFileName);

            try
            {
                System.Drawing.Image UploadedImage = System.Drawing.Image.FromStream(image.InputStream);
                System.Drawing.Image LargeImage = Utilities.ToMaxSize(UploadedImage, MaxWidth, MaxHeight);
                System.Drawing.Image ThumbImage = Utilities.ToMaxSize(UploadedImage, ThumbMaxWidth, ThumbMaxHeight);

                LargeImage.Save(Request.PhysicalApplicationPath + LargeFile, ImageFormat.Jpeg);
                ThumbImage.Save(Request.PhysicalApplicationPath + ThumbFile, ImageFormat.Jpeg);
            }
            catch (Exception ex)
            {
                result = false;
            }

            if (result)
            {
                LargePicture = LargeFile.Replace('\\', '/');
                SmallPicture = ThumbFile.Replace('\\', '/');

                Picture p = new Picture();
                p.Name = title;
                p.PropertyId = master.PropertyId;
                p.Url = LargePicture;
                p.Thumbnail = SmallPicture;
                p.IsMain = false;

                PropertyBLL pBLL = new PropertyBLL();
                result = pBLL.SaveImage(p);

            }
            return result;
        }

   
    }
}