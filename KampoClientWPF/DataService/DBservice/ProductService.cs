using KampoClientWPF.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace KampoClientWPF.DataService.DBservice
{
    public class ProductService : MainService
    {
        public KampoDBEntities context = new KampoDBEntities();

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
                if (products.ImageUrl == null)
                {
                    products.ImageUrl = "/Resource/ImagesProducts/imagenotfound.png";
                }
                if (!string.IsNullOrWhiteSpace(products.ProductName) || !string.IsNullOrWhiteSpace(products.ProductDescription)
                    || !string.IsNullOrWhiteSpace(products.CountProduct.ToString())
                   )
                {
                    context.Products.Add(new Products()
                    {
                        ProductName = products.ProductName,
                        ProductDescription = products.ProductDescription,
                        productscategory_id = products.ProductsCategory.id_productcategory,
                        CountProduct = products.CountProduct,
                        ImageUrl = products.ImageUrl,
                    });
                    await context.SaveChangesAsync();
                    if (LoggerProductService.loggerProductService.IsTodayLogAboutProductExists(products.ProductsCategory))
                        await LoggerProductService.loggerProductService.UpdateLoggerService(products.ProductsCategory);
                    else
                        await LoggerProductService.loggerProductService.AddLogerProductService(StaticServices.ServicesStatic.TYPEACTION_HAND, products.ProductsCategory);
                    return true;
                }
                else
                {
                    MessageBox.Show("Поля заполнены не корректно");
                    return false;
                }
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
                ProductsCategory previusProductsCategory = ProductToUpdate.ProductsCategory;
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
                    if (LoggerProductService.loggerProductService.IsTodayLogAboutProductExists(ProductToUpdate.ProductsCategory))
                        await LoggerProductService.loggerProductService.UpdateLoggerService(ProductToUpdate.ProductsCategory);
                    else
                        await LoggerProductService.loggerProductService.AddLogerProductService(StaticServices.ServicesStatic.TYPEACTION_HAND, ProductToUpdate.ProductsCategory);
                    if (ProductToUpdate.productscategory_id != previusProductsCategory.id_productcategory)
                    {
                      
                        if (LoggerProductService.loggerProductService.IsTodayLogAboutProductExists(previusProductsCategory))
                            await LoggerProductService.loggerProductService.UpdateLoggerService(previusProductsCategory);
                        else
                            await LoggerProductService.loggerProductService.AddLogerProductService(StaticServices.ServicesStatic.TYPEACTION_HAND, previusProductsCategory);
                    }

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
