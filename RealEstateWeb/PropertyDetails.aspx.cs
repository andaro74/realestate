using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstatePOCO;
using RealEstateBusinessLayer;
using System.Configuration;
using System.Web.Services;
using System.Web.Script.Services;
using System.Runtime.Serialization.Json;

namespace RealEstateWeb
{
    public partial class PropertyDetails : System.Web.UI.Page
    {
        public string RestURL { get; set; }

        public string RestURLPictures { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                String propertyId = Request.QueryString["PropertyId"];


                Configuration rootWebConfig1 = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration(Request.ApplicationPath);
                if (rootWebConfig1.AppSettings.Settings.Count > 0)
                {
                    System.Configuration.KeyValueConfigurationElement RESTSetting = rootWebConfig1.AppSettings.Settings["RestURL"];
                    if (RESTSetting != null)
                    {
                        RestURL = String.Format("{0}{1}", RESTSetting.Value, propertyId);
                        RestURLPictures = String.Format("{0}{1}", RestURL, "/pictures?callback=?");
                        this.HdnPicturesURL.Value = RestURLPictures;
                    }

                }

                if (!String.IsNullOrEmpty(propertyId))
                {
                    PropertyBLL pBLL = new PropertyBLL();
                    Property prop = pBLL.GetPropertyById(int.Parse(propertyId));

                    this.HdnPropertyId.Value = propertyId;

                    this.LitPropertyHeaderDescription.Text = prop.StreetAddress.ToString();
                    //Property Details
                    this.LitPrice.Text = string.Format("{0:C}", prop.Price);
                    this.LitLocation.Text =
                        String.Format("{0}, {1}", prop.StreetAddress.ToString(), prop.City.ToString());

                    this.LitBedrooms.Text = prop.Beds.ToString();
                    this.LitBathrooms.Text = prop.Baths.ToString();

                    this.LitStatus.Text = (prop.StatusId == 1) ? "Available" : "Sold";

                    this.LitMLSId.Text = prop.MLSId.ToString();
                    this.LitDescription.Text = prop.Description.ToString();

                    string jcontent = String.Format("window.open('{0}')", prop.VirtualTourUrl);

                    string myScript = String.Format(@"function ShowMorePictures(){0}({1}){2};", "{", jcontent, "}");
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "MyScript", myScript, true);
                }
            }
        }

        [WebMethod]
        public static List<Images> GetPictures(string propertyid)
        {
            List<Images> lstimg = new List<Images>();

            //Images p = new Images()
            //{
            //    image= "img1.jpg",
            //    thumb= "thumb1.jpg",
            //    title= "my first image",
            //    description= "Lorem ipsum caption",
            //    link= "http://domain.com"
            //};

            int intPropid = 0;

            int.TryParse(propertyid, out intPropid);

            PropertyBLL pBLL = new PropertyBLL();
            List<Picture> listpic = pBLL.GetImagesByPropertyId(intPropid);

            listpic = listpic.Where(p=>p.Show).OrderBy(p=>p.Order).ToList();

            if ((listpic.Count > 0) && (listpic.Count>10))
            {
                listpic = listpic.Take(11).ToList();
            }

            foreach (Picture p in listpic)
            {
                Images img = new Images()
                {
                    image = p.Url,
                    thumb = p.Url,
                    title = p.Name,
                    description = p.Description,
                    link = p.Url
                };
                lstimg.Add(img);
            }
            return lstimg;
        }

    }
}