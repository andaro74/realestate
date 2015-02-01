using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstatePOCO;
using RealEstateBusinessLayer;

namespace RealEstateWeb
{
    public partial class Listings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListViewProperties_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            Literal Location;
            Literal Bedrooms;
            Literal Bathrooms;
            Image ImgMainHouse;
            Literal MLSId;
            Literal Description;
            Literal Price;
            
            HiddenField HdnPropertyId;
            HyperLink hyperLinkViewDetails;
            HyperLink hyperLinkMLS;
            HyperLink lnkPicture;

            Panel pnlSoldBanner;
            

            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                Location = (Literal)e.Item.FindControl("LitLocation");
                Bedrooms = (Literal)e.Item.FindControl("LitBedrooms");
                Bathrooms = (Literal)e.Item.FindControl("LitBathrooms");
            
                ImgMainHouse = (Image)e.Item.FindControl("LitImgMainHouse");

                MLSId = (Literal)e.Item.FindControl("LitMLSId");
                Description = (Literal)e.Item.FindControl("LitDescription");
                Price = (Literal)e.Item.FindControl("LitPrice");
                HdnPropertyId = (HiddenField)e.Item.FindControl("HdnPropertyId");

                hyperLinkViewDetails = (HyperLink)e.Item.FindControl("hyperLinkViewDetails");
                hyperLinkMLS = (HyperLink)e.Item.FindControl("hyperLinkMLS");
                lnkPicture = (HyperLink)e.Item.FindControl("lnkPicture");
                pnlSoldBanner = (Panel)e.Item.FindControl("pnlSoldBanner");

                Property rowProp = e.Item.DataItem as Property;
                Location.Text = String.Format("{0}, {1}", rowProp.StreetAddress.ToString(), rowProp.City.ToString());
                
                Bedrooms.Text = rowProp.Beds.ToString();
                Bathrooms.Text = rowProp.Baths.ToString();
                Picture pic = rowProp.Pictures.Select(p => p).SingleOrDefault();
                ImgMainHouse.ImageUrl = pic.Url;
                MLSId.Text = String.Format("MLS {0}",rowProp.MLSId);

                string shortDescription= new string(rowProp.Description.Take(300).Select(s => s).ToArray());
                Description.Text = (rowProp.Description.Count()>300)? String.Format("{0}...",shortDescription):shortDescription;
               
                hyperLinkViewDetails.Enabled = true;
                hyperLinkViewDetails.NavigateUrl = String.Format("PropertyDetails.aspx?PropertyId={0}", rowProp.PropertyId.ToString());
                lnkPicture.NavigateUrl = String.Format("PropertyDetails.aspx?PropertyId={0}", rowProp.PropertyId.ToString());

                hyperLinkMLS.Enabled = true;
                hyperLinkMLS.Target ="_new";
                hyperLinkMLS.NavigateUrl = (rowProp.MLSUrl!=null)? rowProp.MLSUrl:string.Empty;
                hyperLinkMLS.Text =String.Format("MLS {0}",rowProp.MLSId);

                
                Price.Text = string.Format("{0:C}", rowProp.Price);
                HdnPropertyId.Value = rowProp.PropertyId.ToString();
            }
        }

        protected void ListViewProperties_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            this.ListingsPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false); 

        }

        protected void ListingsPager_PreRender(object sender, EventArgs e)
        {

            List<Property> lstProp;
            PropertyBLL propBLL = new PropertyBLL();
            String strStatus = Request.QueryString["status"];
            lstProp = propBLL.GetProperties(Status.Available);
            this.ListViewProperties.DataSource = lstProp;
            this.ListViewProperties.DataBind();
            this.ListingsPager.PageSize = 8;
            this.ListingsPager.Visible = (lstProp.Count > this.ListingsPager.PageSize) ? true : false;
        }

      
    }
}