using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using RealEstatePOCO;
using System.Runtime.Serialization;
using RealEstateBusinessLayer;

namespace RealEstateRESTServices
{

    // Start the service and browse to http://<machine_name>:<port>/Service1/help to view the service's generated help page
    // NOTE: By default, a new instance of the service is created for each call; change the InstanceContextMode to Single if you want
    // a single instance of the service to process all calls.	
    [ServiceContract]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.PerCall)]
    // NOTE: If the service is renamed, remember to update the global.asax.cs file
    public class REServices
    {
        [WebGet(UriTemplate = "properties/{propertyid}/pictures")]
        public List<Images> GetPictures(string propertyid)
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

            int intPropid=0;

            int.TryParse(propertyid, out intPropid);

            PropertyBLL pBLL = new PropertyBLL();
            List<Picture> listpic=  pBLL.GetImagesByPropertyId(intPropid);

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