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
        public List<Products> GetProductsAsync() => context.Products.ToList();
        public async Task<List<Products>> GetProductsByName(string name) => await context.Products.Where(p=> p.ProductName.ToLower().Contains(name.ToLower())).ToListAsync();
        public async Task<List<Products>> GetProductsByCategoryName(string name) => await context.Products.Where(p => p.ProductsCategory.CategoryName == name).ToListAsync();
        public async Task<bool> DeleteProduct(Products products)
        {
            try
            {
                var producttodelete = await context.Products.FirstOrDefaultAsync(p => p.id_product == products.id_product);
                context.Products.Remove(producttodelete);
                await context.SaveChangesAsync();
                return true;
            }
            catch (Exception exp)
            {

                Console.WriteLine(exp.Message);
                return false;
            }
           
        }
        public async Task<bool> AddProductAsync(Products products)
        {
            try
            { 
                if(products.ImageUrl == null)
                {
                    products.ImageUrl = "/Resource/ImagesProducts/imagenotfound.png";
                }
                context.Products.Add(new Products()
                {
                    ProductName= products.ProductName,
                    ProductDescription = products.ProductDescription,
                    productscategory_id = products.ProductsCategory.id_productcategory,
                    CountProduct = products.CountProduct,
                    ImageUrl= products.ImageUrl,
                });
                await context.SaveChangesAsync();
                return true;
            }
            catch (Exception exp)
            {
                Console.WriteLine(exp.Message);
                return false;
            }
            
        }
        public async Task<bool> UpdateProduct(Products products)
        {
            try
            {
                var ProductToUpdate = await context.Products.FirstOrDefaultAsync(p => p.id_product == products.id_product);
                var productproperties = await context.ProductsProperties.Where(p => p.product_id == products.id_product).ToListAsync();
                if(ProductToUpdate.ImageUrl == null)
                {
                    ProductToUpdate.ImageUrl = "/Resource/ImagesProducts/imagenotfound.png";
                }
                if (ProductToUpdate != null) 
                {
                    ProductToUpdate.productscategory_id = products.productscategory_id;
                    ProductToUpdate.ProductName = products.ProductName;
                    ProductToUpdate.CountProduct = products.CountProduct;
                    ProductToUpdate.ProductDescription = products.ProductDescription;
                    productproperties = products.ProductsProperties.ToList();
                    ProductToUpdate.ImageUrl = products.ImageUrl;
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

    }

}
