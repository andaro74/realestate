
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;

namespace RealEstatePOCO
{
    public class Picture
    {
        #region Primitive Properties

        public string Name
        {
            get;
            set;
        }

        public string Url
        {
            get;
            set;
        }

        public string Thumbnail
        {
            get;
            set;
        }

        public string Description
        {
            get;
            set;
        }

        public bool IsMain
        {
            get;
            set;
        }

        public bool Show
        {
            get;
            set;
        }


        public int? Order
        {
            get;
            set;
        }

        public int PropertyId
        {
            get { return _propertyId; }
            set
            {
                if (_propertyId != value)
                {
                    if (Property != null && Property.PropertyId != value)
                    {
                        Property = null;
                    }
                    _propertyId = value;
                }
            }
        }
        private int _propertyId;

        public int PictureId
        {
            get;
            set;
        }

        #endregion
        #region Navigation Properties

        public Property Property
        {
            get { return _property; }
            set
            {
                if (!ReferenceEquals(_property, value))
                {
                    var previousValue = _property;
                    _property = value;
                    FixupProperty(previousValue);
                }
            }
        }
        private Property _property;

        #endregion
        #region Association Fixup

        private void FixupProperty(Property previousValue)
        {
            if (previousValue != null && previousValue.Pictures.Contains(this))
            {
                previousValue.Pictures.Remove(this);
            }

            if (Property != null)
            {
                if (!Property.Pictures.Contains(this))
                {
                    Property.Pictures.Add(this);
                }
                if (PropertyId != Property.PropertyId)
                {
                    PropertyId = Property.PropertyId;
                }
            }
        }

        #endregion
    }
}
