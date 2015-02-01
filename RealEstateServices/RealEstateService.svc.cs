using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using RealEstatePOCO;
using RealEstateBusinessLayer;

namespace RealEstateServices
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class RealEstateService
    {
        // To use HTTP GET, add [WebGet] attribute. (Default ResponseFormat is WebMessageFormat.Json)
        // To create an operation that returns XML,
        //     add [WebGet(ResponseFormat=WebMessageFormat.Xml)],
        //     and include the following line in the operation body:
        //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
        //[OperationContract]
        //public List<Property> GetProperties()
        //{
        //    PropertyBLL objPropBLL=new PropertyBLL();
        //    List<Property> colProperties = objPropBLL.GetProperties(null);
        //    return colProperties;
        //}

        [OperationContract]
        [WebGet(UriTemplate="pictures/{propertyid}")]
        public List<Picture> GetPictures(int propertyid)
        {
            return new List<Picture>();
        }


       
    }
}
