using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RealEstateDataLayer;
using RealEstatePOCO;
using System.Data.Entity;
using System.Data.Common;
using System.Data.Objects;


namespace RealEstateBusinessLayer
{
    public class PropertyBLL
    {
       
        public List<Property> GetProperties(Status? propertyStatus=null)
        {
            List<Property> lstProp;
            using (var context = new RealEstateDataLayer.RealEstateEntities())
            {
                context.ContextOptions.LazyLoadingEnabled = false;
             
                lstProp = new List<Property>();
                List<Property> colProperties=new List<Property>();
                
                colProperties = context.Properties
                                        .Where(p => ((propertyStatus==null) || (p.StatusId == (int)propertyStatus)))
                                        .OrderByDescending(r => r.DateOfListing)
                                        .Select(s => s).ToList();


                foreach (var prop in colProperties)
                {
                    var Pic = context.Pictures
                                .Where(r => r.IsMain)
                                .Where(s => s.PropertyId == prop.PropertyId)
                                .Select(t => t).SingleOrDefault();
                    if (Pic == null)
                    {
                        Pic = new Picture()
                        {
                            IsMain = true,
                            Url = "empty.jpg",
                            PropertyId = prop.PropertyId
                        };
                    }
                    prop.Pictures.Add(Pic);
                    lstProp.Add(prop);
                }

                return lstProp.ToList();
            }
        }

        public Property GetPropertyById(Int32 PId)
        {
            
            Property Prop;
            using (var context = new RealEstateDataLayer.RealEstateEntities())
            {
                context.ContextOptions.LazyLoadingEnabled = false;
                Prop = context.Properties
                              .Include("Pictures")
                              .Where(p=>p.PropertyId==PId)
                              .Select(p => p)
                              .SingleOrDefault();
            }
            return Prop;
        }


        public List<Picture> GetImagesByPropertyId(Int32 PId)
        {

            List<Picture> lstpic;
            using (var context = new RealEstateDataLayer.RealEstateEntities())
            {
                context.ContextOptions.LazyLoadingEnabled = false;
                lstpic = context.Pictures.Where(p => p.PropertyId == PId).OrderBy(p=>p.Order).Select(p => p).ToList();
            }
            return lstpic;
        }


        /// <summary>
        /// This method gets the number of pictures for the property
        /// </summary>
        /// <param name="PId"></param>
        /// <returns></returns>
        public int GetPicturesCount(Int32 PId)
        {

            int picCount = 0;
            using (var context = new RealEstateDataLayer.RealEstateEntities())
            {
                context.ContextOptions.LazyLoadingEnabled = false;
                picCount = context.Pictures.Where(p => p.PropertyId == PId).Select(p => p).Count();
            }
            return picCount;
        }


        public Picture GetImageByPictureId(Int32 PId)
        {
            Picture pic=null;
            using (var context = new RealEstateDataLayer.RealEstateEntities())
            {
                context.ContextOptions.LazyLoadingEnabled = false;
                pic = context.Pictures.Where(p => p.PictureId == PId).FirstOrDefault();
            }
            return pic;
        }

        public List<Property> GetSoldPropertiesBasicInformation()
        {

            List<Property> lstProp = new List<Property>();
            using (var context = new RealEstateDataLayer.RealEstateEntities())
            {
                context.ContextOptions.LazyLoadingEnabled = false;
                var lstProperties= context.Properties.Include("Pictures").Where(p=>p.StatusId==0);
                foreach (Property objProp in lstProperties)
                {
                    Property Prop = new Property();
                    Prop.City = objProp.City;
                    Prop.Location = objProp.Location;
                    var lstPics=objProp.Pictures.Where(p=>p.IsMain==true)
                                .Select(p=>p).ToList();
                    
                        Picture pic = new Picture();
                        pic = objProp.Pictures.Where(p=>p.IsMain==true).Select(p=>p).FirstOrDefault();
                        Prop.Pictures.Add(pic);
                        pic = null;
                    lstProp.Add(Prop);
                    
                }
             
            }
            return lstProp;
        }

        public bool SaveImage(Picture p)
        {
            bool result = false;

            try
            {
                using (var context = new RealEstateDataLayer.RealEstateEntities())
                {
                    context.ContextOptions.LazyLoadingEnabled = false;
                    //Update
                    if (p.PictureId != 0)
                    {
                        var modPic = context.Pictures.Where(s => s.PictureId == p.PictureId).Select(s => s).FirstOrDefault();
                        modPic.IsMain = p.IsMain;
                        modPic.Show = p.Show;
                        modPic.Order = p.Order;

                    }
                        //create a new picture
                    else
                    {
                        var countMain= context.Pictures.Where(s => s.PropertyId == p.PropertyId).Select(s => s.IsMain == true);
                        if (countMain.Count() == 0)
                        {
                            p.IsMain = true;
                            
                        }
                        p.Show = true;
                        p.Order = context.Pictures.Where(s=>s.PropertyId==p.PropertyId).Count() + 1;
                        context.Pictures.AddObject(p);

                    }
                    result = true;
                    
                    context.SaveChanges();
                  
                }
            }
            catch (Exception ex)
            {
                result = false;
            }

            return result;
        }

        public int AddProperty(Property p)
        {
            int propertyId;

            
                using (var context = new RealEstateDataLayer.RealEstateEntities())
                {
                    context.ContextOptions.LazyLoadingEnabled = false;
                    context.Properties.AddObject(p);

                    context.SaveChanges();
                    propertyId = p.PropertyId;
                }
            

            return propertyId;
        }


        public void UpdateProperty(Property p)
        {
            using (var context = new RealEstateDataLayer.RealEstateEntities())
            {
                context.ContextOptions.LazyLoadingEnabled = false;
                Property original = context.Properties.Where(o => o.PropertyId == p.PropertyId).Select(o => o).FirstOrDefault();

                if (p.MLSId!=original.MLSId)
                    original.MLSId=p.MLSId;

                if (p.Baths != original.Baths) 
                    original.Baths = p.Baths;

                if (p.Beds != original.Beds)
                    original.Beds = p.Beds;

                if (p.Price != original.Price)
                    original.Price = p.Price;

                if (p.StatusId != original.StatusId)
                    original.StatusId = p.StatusId;

                if (p.StreetAddress != original.StreetAddress)
                    original.StreetAddress =p.StreetAddress;

                if (p.Country != original.Country)
                    original.Country = p.Country;

                if (p.StateProvince != original.StateProvince)
                    original.StateProvince = p.StateProvince;

                if (p.City != original.City)
                    original.City = p.City;

                if (p.PostalCode != original.PostalCode)
                    original.PostalCode = p.PostalCode;

                if (p.Location != original.Location)
                    original.Location = p.Location;

                if (p.MLSUrl != original.MLSUrl)
                    original.MLSUrl = p.MLSUrl;

                if (p.VirtualTourUrl != original.VirtualTourUrl)
                    original.VirtualTourUrl = p.VirtualTourUrl;

                if (p.Description != original.Description)
                    original.Description = p.Description;
                    
                context.SaveChanges();
            }
            
        }




        public List<Property> GetPropertyList(Status? propertyStatus = null)
        {
            List<Property> colProperties = new List<Property>();
            using (var context = new RealEstateDataLayer.RealEstateEntities())
            {
                context.ContextOptions.LazyLoadingEnabled = false;

                colProperties = context.Properties
                                         .Where(p => p.StatusId == (int)propertyStatus)
                                         .OrderByDescending(r => r.DateOfListing)
                                         .Select(s => s).ToList();
                
            }
            return colProperties;
        }


        /// <summary>
        /// This method deletes the Image according to the picture Id
        /// </summary>
        /// <param name="PictureId"></param>
        /// <returns></returns>
        public bool DeleteImage(int PictureId)
        {
            bool result = false;

            try
            {
                using (var context = new RealEstateDataLayer.RealEstateEntities())
                {
                    context.ContextOptions.LazyLoadingEnabled = false;
                    var delPic = context.Pictures.Where(s => s.PictureId == PictureId).Select(s => s).FirstOrDefault();
                    context.Pictures.DeleteObject(delPic);
                    result = true;
                    context.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                result = false;
            }

            return result;
        }

        public int SaveProperty(Property p)
        {
            int propertyId = 0;

            PropertyBLL pBLL = new RealEstateBusinessLayer.PropertyBLL();
            if (p.PropertyId == 0)
                pBLL.AddProperty(p);
            else
                pBLL.UpdateProperty(p);

            propertyId = p.PropertyId;
            return propertyId;
        }

        /// <summary>
        /// This method deletes a properties.
        /// </summary>
        /// <param name="propertyid"></param>
        /// <returns></returns>
        public bool DeleteProperty(int propertyid)
        {
            bool result = false;
            using (var context = new RealEstateDataLayer.RealEstateEntities())
            {
                context.ContextOptions.LazyLoadingEnabled = false;
                Property original = context.Properties.Where(o => o.PropertyId == propertyid).Select(o => o).FirstOrDefault();

                List<Picture> lstP = context.Pictures.Where(p => p.PropertyId == propertyid).Select(p => p).ToList();
                foreach (Picture p in lstP)
                {
                    context.Pictures.DeleteObject(p);
                }
                context.Properties.DeleteObject(original);
                context.SaveChanges();
                result = true;
            }
            return result;
        }


    }
}
