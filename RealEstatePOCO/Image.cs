using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace RealEstatePOCO
{
    [DataContract]
    public class Images
    {
        [DataMember]
        public string image { get; set; }

        [DataMember]
        public string thumb { get; set; }

        [DataMember]
        public string title { get; set; }

        [DataMember]
        public string description { get; set; }

        [DataMember]
        public string link { get; set; }
    }
}
