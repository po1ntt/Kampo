using KampoClientWPF.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Documents;

namespace KampoClientWPF.DataService.DBservice
{
    public class LoggerProductService : MainService
    {
        public static LoggerProductService loggerProductService = new LoggerProductService();
        public KampoDBEntities context = new KampoDBEntities();
        public async Task<List<LoggerProducts>> GetLoggerProductsAsync(string date, int id_category)
        {
           
                var collection = new List<LoggerProducts>();
                collection = context.LoggerProducts.Include(p => p.ProductsCategory.Products).Where(p => p.DateChanging == date).ToList();

                if (collection.Count == 0 && date == DateTime.Today.ToString("d"))
                {
                 
                }
                if(id_category != 0)
                {
                      collection = context.LoggerProducts.Include(p => p.ProductsCategory.Products).Where(p => p.DateChanging == date && p.productCategory_id == id_category).ToList();
                 }
                  return collection;
               
        }
        public bool IsTodayLogAboutProductExists(ProductsCategory productsCategory)
        {
          
                string dateToday = DateTime.Today.ToString("d");

                LoggerProducts logger = context.LoggerProducts.FirstOrDefault(p => p.productCategory_id == productsCategory.id_productcategory && p.DateChanging == dateToday);
                if (logger != null)
                    return true;
                else
                    return false;
            

         
        }
        public async Task<bool> AddLogerProductService(string typeAction, ProductsCategory productsCategory)
        {
            


            var loggerProduct = new LoggerProducts();
            try
            {
                loggerProduct.productCategory_id = productsCategory.id_productcategory;
                loggerProduct.TypeActionChanging = typeAction;
                loggerProduct.DateChanging = DateTime.Today.ToString("d");
                context.LoggerProducts.Add(loggerProduct);
                context.SaveChanges();
                var LoggerInDB = context.LoggerProducts.FirstOrDefault(p => p.DateChanging == loggerProduct.DateChanging && p.ProductsCategory.id_productcategory == productsCategory.id_productcategory);
                if (productsCategory.Products.ToList().Count != 0 && LoggerInDB != null)
                {
                    AddItemsToLoggerProduct(productsCategory.Products.ToList(), LoggerInDB.id_loggerProducts);
                }
                else
                {
                    return false;
                }
                return true;

            }
            catch (Exception exp)
            {
                Console.WriteLine(exp.Message);
            }
            return loggerProduct.DateChanging != null;
            
         

    }
        private bool AddItemsToLoggerProduct(List<Products> changeProductsLists, int id_loggerProduct)
        {
          

                try
                {
                    foreach (var item in changeProductsLists)
                    {
                        context.ChangeProductsList.Add(new ChangeProductsList()
                        {
                            product_id = item.id_product,
                            logger_products_id = id_loggerProduct,
                            count_product = item.CountProduct

                        });
                        context.SaveChanges();
                }
                    return true;
                }
                catch (Exception exp)
                {
                    Console.WriteLine(exp.Message);
                    return false;
                }
            
           
        }
        public async Task<bool> UpdateLoggerService(ProductsCategory productsCategory)
        {
            

                try
                {
                    string dateToday = DateTime.Today.ToString("d");
                    var loggerDB = context.LoggerProducts.FirstOrDefault(p => p.ProductsCategory.id_productcategory == productsCategory.id_productcategory && p.DateChanging == dateToday);
                    if (loggerDB != null)
                    {
                        var productData = productsCategory.Products.ToList();
                        var listOFproductFromLoggerProduct = loggerDB.ChangeProductsList.ToList();
                        context.ChangeProductsList.RemoveRange(listOFproductFromLoggerProduct);
                        foreach (var item in productData)
                        {
                            context.ChangeProductsList.Add(new ChangeProductsList()
                            {
                                product_id = item.id_product,
                                logger_products_id = loggerDB.id_loggerProducts,
                                count_product = item.CountProduct
                            });
                        context.SaveChanges();
                        }
                       
                    }
                    else
                    {
                        return false;
                    }
                    return true;
                }
                catch (Exception exp)
                {
                    Console.WriteLine(exp.Message);
                    return false;
                }

            

        }
    }
}
