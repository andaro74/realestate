using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RealEstateDataLayer;
using RealEstatePOCO;
using System.Data.Entity;
using System.Data.Common;


namespace RealEstateBusinessLayer
{
    public class AgencyBLL
    {
        public Agency GetAgency()
        {
            using (var context = new RealEstateDataLayer.RealEstateEntities())
            {
                
                List<Agency> lstProp = new List<Agency>();
                var colAgencies = context.Agencies.Select(p => p);

                
                 Agency agency = context.Agencies
                                .OrderBy(a=>a.AgencyId)
                                .Select(t => t)
                                .SingleOrDefault();

                
                return agency;
            }
        }

    }
}
