
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;

namespace RealEstatePOCO
{
    public class Property
    {
        #region Primitive Properties

        public int PropertyId
        {
            get;
            set;
        }

        public string MLSId
        {
            get;
            set;
        }

        public string MLSUrl
        {
            get;
            set;
        }

        public Nullable<int> Beds
        {
            get;
            set;
        }

        public Nullable<int> Baths
        {
            get;
            set;
        }

        public Nullable<double> SqFt
        {
            get;
            set;
        }

        public string Description
        {
            get;
            set;
        }

        public Nullable<decimal> Price
        {
            get;
            set;
        }

        public string StreetAddress
        {
            get;
            set;
        }

        public string StateProvince
        {
            get;
            set;
        }

        public string City
        {
            get;
            set;
        }

        public string PostalCode
        {
            get;
            set;
        }

        public string Country
        {
            get;
            set;
        }

        public int StatusId
        {
            get;
            set;
        }

        public int AgentId
        {
            get { return _agentId; }
            set
            {
                if (_agentId != value)
                {
                    if (Agent != null && Agent.AgentId != value)
                    {
                        Agent = null;
                    }
                    _agentId = value;
                }
            }
        }
        private int _agentId;

        public string VirtualTourUrl
        {
            get;
            set;
        }

        public Nullable<System.DateTime> DateOfListing
        {
            get;
            set;
        }

        public string Location
        {
            get;
            set;
        }

        #endregion
        #region Navigation Properties

        public Agent Agent
        {
            get { return _agent; }
            set
            {
                if (!ReferenceEquals(_agent, value))
                {
                    var previousValue = _agent;
                    _agent = value;
                    FixupAgent(previousValue);
                }
            }
        }
        private Agent _agent;

        public ICollection<Picture> Pictures
        {
            get
            {
                if (_pictures == null)
                {
                    var newCollection = new FixupCollection<Picture>();
                    newCollection.CollectionChanged += FixupPictures;
                    _pictures = newCollection;
                }
                return _pictures;
            }
            set
            {
                if (!ReferenceEquals(_pictures, value))
                {
                    var previousValue = _pictures as FixupCollection<Picture>;
                    if (previousValue != null)
                    {
                        previousValue.CollectionChanged -= FixupPictures;
                    }
                    _pictures = value;
                    var newValue = value as FixupCollection<Picture>;
                    if (newValue != null)
                    {
                        newValue.CollectionChanged += FixupPictures;
                    }
                }
            }
        }
        private ICollection<Picture> _pictures;

        #endregion
        #region Association Fixup

        private void FixupAgent(Agent previousValue)
        {
            if (previousValue != null && previousValue.Properties.Contains(this))
            {
                previousValue.Properties.Remove(this);
            }

            if (Agent != null)
            {
                if (!Agent.Properties.Contains(this))
                {
                    Agent.Properties.Add(this);
                }
                if (AgentId != Agent.AgentId)
                {
                    AgentId = Agent.AgentId;
                }
            }
        }

        private void FixupPictures(object sender, NotifyCollectionChangedEventArgs e)
        {
            if (e.NewItems != null)
            {
                foreach (Picture item in e.NewItems)
                {
                    item.Property = this;
                }
            }

            if (e.OldItems != null)
            {
                foreach (Picture item in e.OldItems)
                {
                    if (ReferenceEquals(item.Property, this))
                    {
                        item.Property = null;
                    }
                }
            }
        }

        #endregion
    }
}
