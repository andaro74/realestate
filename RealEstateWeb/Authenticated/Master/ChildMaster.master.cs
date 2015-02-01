using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstateWeb
{
    public partial class ChildMaster : System.Web.UI.MasterPage
    {
        public string MenuPropertyListNavigaterUrl
        {
            get { return this.lnkPropertyListing.NavigateUrl; }
            set { this.lnkPropertyListing.NavigateUrl = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}