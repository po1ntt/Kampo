using KampoClientWPF.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KampoClientWPF.DataService.DBservice
{
    public class ProductService : MainService
    {
        public async Task<List<Products>> GetProductsAsync() => await context.Products.ToListAsync();
        public async Task<bool> AddProductAsync(Products products)
        {
            try
            {
                context.Products.Add(new Products()
                {
                    ProductName= products.ProductName,
                    ProductDescription = products.ProductDescription,
                    productscategory_id = products.ProductsCategory.id_productcategory,
                    CountProduct = products.CountProduct
                });
                context.SaveChanges();
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
