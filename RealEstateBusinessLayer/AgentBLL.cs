using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Entity;
using RealEstatePOCO;
using RealEstateDataLayer;

namespace RealEstateBusinessLayer
{
    public class AgentBLL
    {

        public Agent GetAgentInfo()
        {
            using (var context = new RealEstateEntities())
            {
                context.ContextOptions.LazyLoadingEnabled = false;
                Agent ag=context.Agents.Select(a=>a).SingleOrDefault();

                return ag;
            }
        }
    }
}
