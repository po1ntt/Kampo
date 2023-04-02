using KampoClientWPF.Models;
using KampoClientWPF.ViewsModels;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Entity;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;

namespace KampoClientWPF.DataService.DBservice
{
    public class PropertyService : MainService
    {
        public async Task<List<Models.Properties>> GetPropertiesAsync() => await context.Properties.ToListAsync();
        public async Task<Models.Properties> FindPropertyByNameAsync(string name) => await context.Properties.FirstOrDefaultAsync(p=> p.NameProperty == name);
        public async Task<bool> DeleteProductProperties(List<ProductsProperties> productsProperties)
        {
            try
            {
                foreach (var productprops in productsProperties)
                {
                    var keytodelete = context.ProductsProperties.FirstOrDefault (p => p.property_id == productprops.property_id);
                    context.ProductsProperties.Remove(keytodelete);
                }
                await context.SaveChangesAsync();
                return true;
            }
            catch (Exception exp)
            {

                Console.WriteLine(exp.Message);
                return false;
            }

        }
        public async Task<bool> AddToProductProperties(ObservableCollection<ProductsProperties> productsProperties, string nameproduct)
        {

            var product = context.Products.FirstOrDefault(p=> p.ProductName== nameproduct);
            foreach (var item in productsProperties)
            {
                

                context.ProductsProperties.Add(new ProductsProperties()
                {
                    product_id = product.id_product,
                    property_id = item.Properties.id_propertries,
                    ValueProperty = item.ValueProperty,
                   

                });
                await context.SaveChangesAsync();
            }
            return true;
        }
        public async Task<string> NewProperty(string nameproperty)
        {
            try
            {
                var property = await context.Properties.FirstOrDefaultAsync(p => p.NameProperty == nameproperty);
                if (property == null)
                {
                    context.Properties.Add(new Models.Properties()
                    {
                        NameProperty = nameproperty,
                       
                    });
                    await context.SaveChangesAsync();
                    return "Успешно добавлено";
                }
                else
                {
                    return "Cвойство уже существует";
                }
            }
            catch (Exception exp)
            {

                return exp.Message;
            }
            
        }
        public async Task<bool> DeleteProperty(Models.Properties properties)
        {
            try
            {
                var KeyToDelete = await context.Properties.FirstOrDefaultAsync(p => p.id_propertries == properties.id_propertries);
                context.Properties.Remove(KeyToDelete);
                await context.SaveChangesAsync();
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
