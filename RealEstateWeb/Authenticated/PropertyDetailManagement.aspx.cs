using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstateBusinessLayer;
using RealEstatePOCO;


namespace RealEstateWeb
{
    public partial class PropertyDetailManagement : System.Web.UI.Page
    {
   
        private PropertyMaster master;

        protected void Page_Load(object sender, EventArgs e)
        {
            master = (PropertyMaster)Master;
            master.PropertyId = (master.PropertyId == 0) ? int.Parse(Page.Request["propertyid"].ToString()) : master.PropertyId;
            if (master.PropertyId>0)
                master.MenuPropertyPicturesNavigaterUrl = string.Format("~/Authenticated/PictureListManagement.aspx?propertyid={0}", master.PropertyId.ToString());
            
            if (!Page.IsPostBack)
            {
                InitializeForm();
                InitializeData();
            }
        }

        private void InitializeForm()
        {
            
            for (int i=0; i <= 10; i++)
            {
                this.drpBathrooms.Items.Add(i.ToString());
                this.drpBedrooms.Items.Add(i.ToString());
            }

            if (master.PropertyId == 0)
            {
                this.rdActive.Checked = true;
                this.rdActive.Enabled = false;
                this.rdInactive.Enabled = false;
                this.rdHold.Enabled = false;
            }
            else
            {
                this.rdActive.Enabled = true;
                this.rdInactive.Enabled = true;
                this.rdHold.Enabled = true;
                
            }

            this.txtMLSId.Focus();

            //This code has to be replaced by a database call
            this.drpCountry.Items.Add(new ListItem() { Text = "Canada", Value = "1" });
            this.drpCountry.Items.Add(new ListItem() { Text = "United States", Value = "2" });
            this.drpState.Items.Add(new ListItem() { Text = "Ontario", Value = "1" });
            this.drpState.Items.Add(new ListItem() { Text = "Quebec", Value = "2" });
            this.drpState.Items.Add(new ListItem() { Text = "Nova Scotia", Value = "3" });
            this.drpState.Items.Add(new ListItem() { Text = "New Brunswick", Value = "4" });
            this.drpState.Items.Add(new ListItem() { Text = "Manitoba", Value = "5" });
            this.drpState.Items.Add(new ListItem() { Text = "British Columbia", Value = "6" });
            this.drpState.Items.Add(new ListItem() { Text = "Prince Edward Island", Value = "7" });
            this.drpState.Items.Add(new ListItem() { Text = "Saskatchewan", Value = "8" });
            this.drpState.Items.Add(new ListItem() { Text = "Alberta", Value = "9" });
            this.drpState.Items.Add(new ListItem() { Text = "Newfoundland and Labrador", Value = "10" });
            this.drpState.Items.Add(new ListItem() { Text = "Northwest Territories", Value = "11" });
            this.drpState.Items.Add(new ListItem() { Text = "Yukon", Value = "12" });
            this.drpState.Items.Add(new ListItem() { Text = "Nunavut", Value = "13" });

        }

        private void InitializeData()
        {

            if (master.PropertyId != 0)
            {
                PropertyBLL pBLL = new PropertyBLL();
                Property p = pBLL.GetPropertyById(master.PropertyId);
                if (p != null)
                {
                    this.txtMLSId.Text = p.MLSId;
                    this.drpBathrooms.SelectedValue = p.Baths.ToString();
                    this.drpBedrooms.SelectedValue = p.Beds.ToString();

                    this.txtPrice.Text =(p.Price!=null)? ((double)p.Price).ToString(): ((double)0).ToString();

                    if (p.StatusId == 0)
                        this.rdInactive.Checked = true;
                    else if (p.StatusId == 1)
                        this.rdActive.Checked = true;
                    else if (p.StatusId == 2)
                        this.rdHold.Checked = true;

                    this.txtStreetAddress.Text = p.StreetAddress;
                    this.txtCity.Text = p.City;

                    foreach (ListItem i in this.drpState.Items)
                    {
                        if (p.StateProvince == i.Text)
                        {
                            this.drpState.SelectedValue = i.Value;
                            break;
                        }
                    }


                    foreach (ListItem i in this.drpCountry.Items)
                    {
                        if (p.Country == i.Text)
                        {
                            this.drpCountry.SelectedValue = i.Value;
                            break;
                        }
                    }
                    
                    
                    this.txtZip.Text = p.PostalCode;
                    this.txtNeighborhood.Text = p.Location;
                    this.txtMLSUrl.Text = p.MLSUrl;
                    this.txtVirtualTour.Text = p.VirtualTourUrl;

                    this.txtDescription.Text = p.Description;
                }
            }
        }

        

        protected void cmdSaveProperty_Click(object sender, EventArgs e)
        {
            //Validate whether the page is valid.
            if (!Page.IsValid)
                return;

            Property p=populateProperty();
            PropertyBLL pBLL = new RealEstateBusinessLayer.PropertyBLL();
            int propertyid = pBLL.SaveProperty(p);
            if (propertyid > 0)
            {
                master.PropertyId = propertyid;
                
            }
            this.lblSuccess.Text = "Your changes have been saved.";
            Response.Redirect(String.Format("~/Authenticated/PropertyDetailManagement.aspx?propertyid={0}", propertyid.ToString()));
            
        }

        /// <summary>
        /// This method populates a property
        /// </summary>
        /// <returns></returns>
        private Property populateProperty()
        {
            Property p = new Property();
            p.PropertyId = master.PropertyId;
            p.MLSId = this.txtMLSId.Text;
            p.Baths = int.Parse(this.drpBathrooms.SelectedValue);
            p.Beds = int.Parse(this.drpBedrooms.SelectedValue);
            p.Price = decimal.Parse(this.txtPrice.Text);

            if (this.rdActive.Checked)
                p.StatusId = 1;
            else if (this.rdInactive.Checked)
                p.StatusId = 0;
            else if (this.rdHold.Checked)
                p.StatusId = 2;

            p.StreetAddress = this.txtStreetAddress.Text;
            p.StateProvince = this.drpState.SelectedItem.Text;
            p.City = this.txtCity.Text;
            p.PostalCode = this.txtZip.Text;
            p.Country = this.drpCountry.SelectedItem.Text;
            p.Location = this.txtNeighborhood.Text;
            p.MLSUrl = this.txtMLSUrl.Text;
            p.VirtualTourUrl = this.txtVirtualTour.Text;
            p.DateOfListing = DateTime.Now.Date;
            p.Description = this.txtDescription.Text;
            p.AgentId = 1;
            return p;
        }

        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("PropertyListingManagement.aspx");
        }

    }

}