
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;

namespace RealEstatePOCO
{
    public class Agent
    {
        #region Primitive Properties

        public string FirstName
        {
            get;
            set;
        }

        public string LastName
        {
            get;
            set;
        }

        public int AgentId
        {
            get;
            set;
        }

        public string MiddleName
        {
            get;
            set;
        }

        public string EmailAddress
        {
            get;
            set;
        }

        public string WorkPhone
        {
            get;
            set;
        }

        public string CellPhone
        {
            get;
            set;
        }

        public int AgencyId
        {
            get { return _agencyId; }
            set
            {
                if (_agencyId != value)
                {
                    if (Agency != null && Agency.AgencyId != value)
                    {
                        Agency = null;
                    }
                    _agencyId = value;
                }
            }
        }
        private int _agencyId;

        public string Title
        {
            get;
            set;
        }

        public string URL
        {
            get;
            set;
        }

        #endregion
        #region Navigation Properties

        public Agency Agency
        {
            get { return _agency; }
            set
            {
                if (!ReferenceEquals(_agency, value))
                {
                    var previousValue = _agency;
                    _agency = value;
                    FixupAgency(previousValue);
                }
            }
        }
        private Agency _agency;

        public ICollection<Property> Properties
        {
            get
            {
                if (_properties == null)
                {
                    var newCollection = new FixupCollection<Property>();
                    newCollection.CollectionChanged += FixupProperties;
                    _properties = newCollection;
                }
                return _properties;
            }
            set
            {
                if (!ReferenceEquals(_properties, value))
                {
                    var previousValue = _properties as FixupCollection<Property>;
                    if (previousValue != null)
                    {
                        previousValue.CollectionChanged -= FixupProperties;
                    }
                    _properties = value;
                    var newValue = value as FixupCollection<Property>;
                    if (newValue != null)
                    {
                        newValue.CollectionChanged += FixupProperties;
                    }
                }
            }
        }
        private ICollection<Property> _properties;

        #endregion
        #region Association Fixup

        private void FixupAgency(Agency previousValue)
        {
            if (previousValue != null && previousValue.Agents.Contains(this))
            {
                previousValue.Agents.Remove(this);
            }

            if (Agency != null)
            {
                if (!Agency.Agents.Contains(this))
                {
                    Agency.Agents.Add(this);
                }
                if (AgencyId != Agency.AgencyId)
                {
                    AgencyId = Agency.AgencyId;
                }
            }
        }

        private void FixupProperties(object sender, NotifyCollectionChangedEventArgs e)
        {
            if (e.NewItems != null)
            {
                foreach (Property item in e.NewItems)
                {
                    item.Agent = this;
                }
            }

            if (e.OldItems != null)
            {
                foreach (Property item in e.OldItems)
                {
                    if (ReferenceEquals(item.Agent, this))
                    {
                        item.Agent = null;
                    }
                }
            }
        }

        #endregion
    }
}
