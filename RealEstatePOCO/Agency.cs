
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;

namespace RealEstatePOCO
{
    public class Agency
    {
        #region Primitive Properties

        public int AgencyId
        {
            get;
            set;
        }

        public string AgencyName
        {
            get;
            set;
        }

        public string AddressLine1
        {
            get;
            set;
        }

        public string AddressLine2
        {
            get;
            set;
        }

        public string City
        {
            get;
            set;
        }

        public string StateProvince
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

        public string Phone1
        {
            get;
            set;
        }

        public string Phone2
        {
            get;
            set;
        }

        public string Fax
        {
            get;
            set;
        }

        public string WebPage
        {
            get;
            set;
        }

        public string EmailAddress
        {
            get;
            set;
        }

        #endregion
        #region Navigation Properties

        public ICollection<Agent> Agents
        {
            get
            {
                if (_agents == null)
                {
                    var newCollection = new FixupCollection<Agent>();
                    newCollection.CollectionChanged += FixupAgents;
                    _agents = newCollection;
                }
                return _agents;
            }
            set
            {
                if (!ReferenceEquals(_agents, value))
                {
                    var previousValue = _agents as FixupCollection<Agent>;
                    if (previousValue != null)
                    {
                        previousValue.CollectionChanged -= FixupAgents;
                    }
                    _agents = value;
                    var newValue = value as FixupCollection<Agent>;
                    if (newValue != null)
                    {
                        newValue.CollectionChanged += FixupAgents;
                    }
                }
            }
        }
        private ICollection<Agent> _agents;

        #endregion
        #region Association Fixup

        private void FixupAgents(object sender, NotifyCollectionChangedEventArgs e)
        {
            if (e.NewItems != null)
            {
                foreach (Agent item in e.NewItems)
                {
                    item.Agency = this;
                }
            }

            if (e.OldItems != null)
            {
                foreach (Agent item in e.OldItems)
                {
                    if (ReferenceEquals(item.Agency, this))
                    {
                        item.Agency = null;
                    }
                }
            }
        }

        #endregion
    }
}
