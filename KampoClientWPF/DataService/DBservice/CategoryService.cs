using KampoClientWPF.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KampoClientWPF.DataService.DBservice
{
    public class CategoryService : MainService
    {
        public async Task<List<ProductsCategory>> GetCategoryAsync() => await context.ProductsCategory.ToListAsync();
        public async Task<ProductsCategory> FindCategoryByNameAsync(string name) => await context.ProductsCategory.FirstOrDefaultAsync(p => p.CategoryName == name);

        public async Task<string> NewCategory(string namecategory)
        {
            try
            {
                var category = await context.ProductsCategory.FirstOrDefaultAsync(p => p.CategoryName == namecategory);
                if (category == null)
                {
                    context.ProductsCategory.Add(new ProductsCategory
                    {
                        CategoryName = namecategory,

                    });
                    await context.SaveChangesAsync();
                    return "Успешно добавлено";
                }
                else
                {
                    return "Категория уже существует";
                }
            }
            catch (Exception exp)
            {

                return exp.Message;
            }

        }
    }
}
