using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using KampoAPI.Models;

namespace KampoAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProductsController : Controller
    {
        private readonly ApplicationDBcontext _context;

        public ProductsController(ApplicationDBcontext context)
        {
            _context = context;
        }
        [HttpGet("GetProducts")]
        public async Task<List<Product>> GetProductsAsync()
        {
            List<Product> products = await _context.Products.Include(e=> e.ProductProperties).ToListAsync();
            return products;
        }
        [HttpGet("GetProductsCategory")]
        public async Task<List<ProductCategory>> GetProductsСategoryAsync()
        {
            List<ProductCategory> productCategories = new List<ProductCategory>();
            List<Product> products = await _context.Products.ToListAsync();
            foreach(Product product in products)
            {
                productCategories.Add(product.ProductCategory);
            }
            return productCategories;
        }
    }
}
