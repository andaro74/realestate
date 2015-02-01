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
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //using (RealEstateService.RealEstateServiceClient service = new RealEstateService.RealEstateServiceClient())
            //{
            //    List<Property> colProp = service.GetProperties();

            //}
            
            ////PropertyBLL objPropBLL = new PropertyBLL();
            ////List<Property> colProp = objPropBLL.GetProperties();


        }
    }
}