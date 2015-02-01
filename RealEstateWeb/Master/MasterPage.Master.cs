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
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {

                AgentBLL aBll = new AgentBLL();
                Agent agent=aBll.GetAgentInfo();
                this.LitCell.Text = String.Format("{0:(###) ###-####}", Double.Parse(agent.CellPhone));
                //this.LitOffice.Text = String.Format("{0:(###) ###-####}", Double.Parse(agent.WorkPhone));
            }
        }
    }
}