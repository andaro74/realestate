using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace RealEstatePOCO
{
    [DataContract]
    public enum Status
    { 
        Sold=0,
        Available=1,
        Inactive=2
    }

    
}
