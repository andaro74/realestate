
using System;
using System.Data.Objects;
using System.Data.EntityClient;
using RealEstatePOCO;

namespace RealEstateDataLayer
{
    public partial class RealEstateEntities : ObjectContext
    {
        public const string ConnectionString = "name=RealEstateEntities";
        public const string ContainerName = "RealEstateEntities";

        #region Constructors

        public RealEstateEntities()
            : base(ConnectionString, ContainerName)
        {
            this.ContextOptions.LazyLoadingEnabled = true;
        }

        public RealEstateEntities(string connectionString)
            : base(connectionString, ContainerName)
        {
            this.ContextOptions.LazyLoadingEnabled = true;
        }

        public RealEstateEntities(EntityConnection connection)
            : base(connection, ContainerName)
        {
            this.ContextOptions.LazyLoadingEnabled = true;
        }

        #endregion

        #region ObjectSet Properties

        public ObjectSet<Agency> Agencies
        {
            get { return _agencies ?? (_agencies = CreateObjectSet<Agency>("Agencies")); }
        }
        private ObjectSet<Agency> _agencies;

        public ObjectSet<Agent> Agents
        {
            get { return _agents ?? (_agents = CreateObjectSet<Agent>("Agents")); }
        }
        private ObjectSet<Agent> _agents;

        public ObjectSet<Picture> Pictures
        {
            get { return _pictures ?? (_pictures = CreateObjectSet<Picture>("Pictures")); }
        }
        private ObjectSet<Picture> _pictures;

        public ObjectSet<Property> Properties
        {
            get { return _properties ?? (_properties = CreateObjectSet<Property>("Properties")); }
        }
        private ObjectSet<Property> _properties;

        #endregion
    }
}
