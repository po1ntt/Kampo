using KampoClientWPF.Models;
using KampoClientWPF.ViewsModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace KampoClientWPF.DataService.DBservice
{
    public class OrderService : MainService
    {
        public KampoDBEntities context = new KampoDBEntities();

        public async Task<List<Orders>> GetOrdersAsync() => await context.Orders.ToListAsync();
    
        public async Task<bool> DeleteOrder(Orders orders)
        {
            try
            {
                var Keytodelete = await context.Orders.FirstOrDefaultAsync(p => p.id_order == orders.id_order);
                context.Orders.Remove(Keytodelete);
                await context.SaveChangesAsync();
                return true;
            }
            catch (Exception exp)
            {

                Console.WriteLine(exp.Message);
                return false;
            }

        }
        public async Task<bool> AddOrderAsync(Orders orders)
        {
            try
            {
               if(orders.OrdersItem != null)
                {
                    context.Orders.Add(new Orders()
                    {
                        NumberOrder = orders.NumberOrder,
                        DateCreated = DateTime.Now,
                        status_id = 1,


                    });
                    context.SaveChanges();
                    await AddOrderItems(orders);
                    return true;

                }
                else
                {
                    return false;
                }
              
            }
            catch (Exception exp)
            {
                Console.WriteLine(exp.Message);
                return false;
            }

        }
        public async Task AddOrderItems(Orders orders)
        {

            var order = context.Orders.FirstOrDefault(p => p.NumberOrder == orders.NumberOrder);
            foreach (var item in orders.OrdersItem)
            {
                context.OrdersItem.Add(new OrdersItem()
                {
                    order_id = order.id_order,
                    ProductCount = item.ProductCount,
                    product_id = item.product_id

                });
            }
            await context.SaveChangesAsync();
        }
        public async Task<bool> UpdateOrderStatus(Orders orders)
        {
            try
            {
                var OrderToUpdate = await context.Orders.FirstOrDefaultAsync(p => p.id_order == orders.id_order);
               
                if (OrderToUpdate!= null)
                {
                    if(orders.status_id != 4)
                    {
                        OrderToUpdate.status_id = orders.status_id + 1;

                        context.SaveChanges();
                        if (OrderToUpdate.status_id == 4)
                        {
                            var categoriesToUpdateList = new List<ProductsCategory>();
                            OrderToUpdate.DateComplete = DateTime.Now;
                            foreach(var item in orders.OrdersItem)
                            {
                                var product = context.Products.FirstOrDefault(p => p.id_product == item.product_id);
                                product.CountProduct = product.CountProduct + item.ProductCount;
                                categoriesToUpdateList.Add(product.ProductsCategory);
                            }
                            context.SaveChanges();
                            categoriesToUpdateList.Distinct();
                            foreach (var item in categoriesToUpdateList)
                            {
                                if (LoggerProductService.loggerProductService.IsTodayLogAboutProductExists(item))
                                    await LoggerProductService.loggerProductService.UpdateLoggerService(item);
                                else
                                    await LoggerProductService.loggerProductService.AddLogerProductService(StaticServices.ServicesStatic.TYPEACTION_ORDER, item);
                            }
                            MessageBox.Show("Кол-во товаров обновлено(Находящихся в заказе)");
                        }
                    }
                    else
                    {
                        MessageBox.Show("Это последний статус, Товар уже добавлен на склад.");
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
