using KampoClientWPF.DataService;
using KampoClientWPF.DataService.DBservice;
using KampoClientWPF.Models;
using KampoClientWPF.Views.Pages;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace KampoClientWPF.ViewsModels
{
    public class AboutOrderVM : BaseVM
    {

        private Models.Orders _OrderInfo;

        public Models.Orders OrderInfo
        {
            get { return _OrderInfo; }
            set { _OrderInfo = value;
                OnPropertyChanged();
            }
        }
        private ObservableCollection<OrdersItem> _OrdersItem;

        public ObservableCollection<OrdersItem> OrdersItem
        {
            get { return _OrdersItem; }
            set
            {
                _OrdersItem = value;
                OnPropertyChanged();
            }
        }

        public AboutOrderVM(Models.Orders orders)
        {
            OrdersItem = new ObservableCollection<OrdersItem>();
            if(orders != null)
            {
                OrderInfo = new Orders();
                OrderInfo = orders;
                LoadOrderItemsFromOrder();
            }
  

        }
        private RelayCommand _UpdateOrderStatus;
        public RelayCommand UpdateOrderStatus
        {
            get
            {
                return _UpdateOrderStatus ??
                    (_UpdateOrderStatus = new RelayCommand(async obj =>
                    {

                        bool result = await orderService.UpdateOrderStatus(OrderInfo);
                        if (result)
                        {
                            OrderInfo = orderService.context.Orders.FirstOrDefault(p => p.id_order == OrderInfo.id_order); 
                            Logger.UpdateData(UsersService.UserInfo, "Заказ", OrderInfo.NumberOrder);
                        }
                        else
                        {
                            MessageBox.Show("Ошибка");
                        }
                    }));
            }
        }
       
        public void LoadOrderItemsFromOrder()
        {
            OrdersItem.Clear();
            if (OrderInfo.OrdersItem.Count != 0)
            {
                foreach (var item in OrderInfo.OrdersItem)
                {
                    OrdersItem.Add(item);
                }
            }

        }
    }
}
