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
    public partial class PropertyListingManagement : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
        
            if (!Page.IsPostBack)
            {
                populateStatusFilter();
                BindGrid();
            }
        }

        private void populateStatusFilter()
        {
            this.drpStatusFilter.Items.Add(new ListItem()
            {
                Text = "Available",
                Value = "1"
            });

            this.drpStatusFilter.Items.Add(new ListItem()
            {
                Text = "Sold",
                Value = "0"
            });

            this.drpStatusFilter.Items.Add(new ListItem()
            {
                Text = "On Hold",
                Value = "2"
            });

            //Available properties are selected by default.
            this.drpStatusFilter.SelectedValue = "1";
        }

        protected void GrdPropertyList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.GrdPropertyList.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void GrdPropertyList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chk = e.Row.FindControl("chkActive") as CheckBox;
                
                Label lblStreetAddress = e.Row.FindControl("lblStreetAddress") as Label;
                Label lblLocation = e.Row.FindControl("lblLocation") as Label;
                Label lblPrice = e.Row.FindControl("lblPrice") as Label;
                Label lblStatus = e.Row.FindControl("lblStatus") as Label;
                Label lblMLS = e.Row.FindControl("lblMLS") as Label;
                ImageButton imgDelete = e.Row.FindControl("DeleteButton") as ImageButton; 

                int statusId = (int)DataBinder.Eval(e.Row.DataItem, "StatusId");
                lblStatus.Text = ((Status)statusId).ToString();

                lblMLS.Text = (string)DataBinder.Eval(e.Row.DataItem, "MLSId");

                lblStreetAddress.Text= (string)DataBinder.Eval(e.Row.DataItem, "StreetAddress");
                lblLocation.Text = (string)DataBinder.Eval(e.Row.DataItem, "Location");
                lblPrice.Text = ((decimal)DataBinder.Eval(e.Row.DataItem, "Price")).ToString("C");

                imgDelete.Attributes.Add("onclick", "javascript:return confirm('Are you sure that you want to delete this property?');");
            }
        }

        private void BindGrid()
        {
            PropertyBLL pBLL = new PropertyBLL();
            this.GrdPropertyList.DataSource = pBLL.GetPropertyList((Status?)int.Parse(this.drpStatusFilter.SelectedValue));
            this.GrdPropertyList.DataBind();
        }

        protected void cmdAddProperty_Click(object sender, EventArgs e)
        {
            Response.Redirect("PropertyDetailManagement.aspx?propertyid=0");
        }

        protected void GrdPropertyList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditItem")
            {
                Response.Redirect(String.Format("PropertyDetailManagement.aspx?propertyid={0}", e.CommandArgument));
            }

            if (e.CommandName == "DeleteItem")
            {
                DeleteProperty(int.Parse(e.CommandArgument.ToString()));
            }
        }


        private void DeleteProperty(int propertyid)
        { 
             PropertyBLL pBLL = new PropertyBLL();
             string rootPath = Request.PhysicalApplicationPath;
             List<Picture> lstPics= pBLL.GetImagesByPropertyId(propertyid);

             foreach (Picture p in lstPics)
             {
                 Utilities.DeleteImage(rootPath, p.Url, p.Thumbnail);
             }
             pBLL.DeleteProperty(propertyid);
             BindGrid();
        }

        
        protected void drpStatusFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }
    }
}