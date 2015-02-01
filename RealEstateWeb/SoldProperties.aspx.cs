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
    public partial class SoldProperties : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ListViewImages_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            Literal Location;
            Image ImgMainHouse;
            
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                Location = (Literal)e.Item.FindControl("LitLocation");
                ImgMainHouse = (Image)e.Item.FindControl("PropertyImage");

                Property rowProp = e.Item.DataItem as Property;
                Location.Text = (rowProp.Location != null) ? rowProp.Location.ToString() : string.Empty;
                Picture pic = rowProp.Pictures.Select(p => p).SingleOrDefault();
                ImgMainHouse.ImageUrl = pic.Url;
            }
        }

        protected void ListViewImages_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            this.ListingsPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        }

        protected void ListingsPager_PreRender(object sender, EventArgs e)
        {
            List<Property> lstProp;
            PropertyBLL propBLL = new PropertyBLL();

            lstProp = propBLL.GetSoldPropertiesBasicInformation();
            this.ListViewImages.DataSource = lstProp;
            this.ListViewImages.DataBind();

            this.ListingsPager.PageSize = 12;
            this.ListingsPager.Visible = (lstProp.Count > 12) ? true : false;
        }
    }
}