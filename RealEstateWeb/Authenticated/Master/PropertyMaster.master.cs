using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstateWeb
{
    public partial class PropertyMaster : System.Web.UI.MasterPage
    {
        public int PropertyId
        {
            get;
            set;
        }


        public string MenuPropertyNavigaterUrl
        {
            get { return this.linkProperty.NavigateUrl; }
            set { this.linkProperty.NavigateUrl = value; }
        }

        public string MenuPropertyPicturesNavigaterUrl
        {
            get { return this.linkPropertyPictures.NavigateUrl; }
            set { this.linkPropertyPictures.NavigateUrl = value; }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (PropertyId >0)
            {
                this.linkPropertyPictures.Visible = true;
                
            }
            else
            {
                this.linkPropertyPictures.Visible = false;
            }
        }
    }
}