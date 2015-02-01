using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using RealEstatePOCO;
using RealEstateBusinessLayer;

namespace RealEstateTests
{
    [TestClass]
    public class PropertyTest
    {
        [TestMethod]
        public void TestGetActiveProperties()
        {
            PropertyBLL objPropBLL = new PropertyBLL();
            List<Property> colProp= objPropBLL.GetProperties(Status.Available);
            Assert.IsTrue((colProp!=null && colProp.Count()>0),"Get Active Properties did not pass" );
        }

        [TestMethod]
        public void TestGetInactiveProperties()
        {
            PropertyBLL objPropBLL = new PropertyBLL();
            List<Property> colProp = objPropBLL.GetProperties(Status.Sold);
            Assert.IsTrue((colProp != null && colProp.Count() > 0), "Get Inactive Properties did not pass");
        }



        [TestMethod]
        public void TestGetProperties()
        {
            PropertyBLL objPropBLL = new PropertyBLL();
            List<Property> colProp = objPropBLL.GetProperties(null);
            Assert.IsTrue((colProp != null && colProp.Count() > 0), "Get All Properties did not pass");
        }


        [TestMethod]
        public void GetSoldPropertiesPictures()
        {
            PropertyBLL objPropBLL = new PropertyBLL();
            List<Property> colProp = objPropBLL.GetSoldPropertiesBasicInformation();
            Assert.IsTrue((colProp != null && colProp.Count() > 0), "Get GetSoldPropertiesPictures did not pass");
        }
        
    }
}
