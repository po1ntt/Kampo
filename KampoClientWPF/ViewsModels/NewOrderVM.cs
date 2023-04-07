using KampoClientWPF.DataService;
using KampoClientWPF.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace KampoClientWPF.ViewsModels
{
    public class NewOrderVM : BaseVM
    {
        public ObservableCollection<Products> ListProducts { get; set; } = new ObservableCollection<Products>();
        private Orders _OrderInfo;

        public Orders OrderInfo
        {
            get { return _OrderInfo; }
            set
            {
                _OrderInfo = value;
                OnPropertyChanged();
            }
        }

        public ObservableCollection<OrdersItem> OrdersItem { get; set; } = new ObservableCollection<OrdersItem>();

        private Products _ProductsSelect;

        public Products ProductsSelect
        {
            get { return _ProductsSelect; }
            set
            {
                _ProductsSelect = value;
                OnPropertyChanged();
            }

        }
        private int _ProductsSelectCount;

        public int ProductsSelectCount
        {
            get { return _ProductsSelectCount; }
            set
            {
                _ProductsSelectCount = value;
                OnPropertyChanged();
            }
        }
        public NewOrderVM()
        {
            OrderInfo = new Orders();
            LoadProducts(ListProducts);
        }
        private RelayCommand _AddOrder;
        public RelayCommand AddOrder
        {
            get
            {
                return _AddOrder ??
                    (_AddOrder = new RelayCommand(async obj =>
                    {

                        if(OrdersItem.Count != 0)
                        {
                            foreach (var item in OrdersItem)
                            {
                                OrderInfo.OrdersItem.Add(item);
                            }
                            bool result = await orderService.AddOrderAsync(OrderInfo);
                            if (result)
                            {
                                MessageBox.Show("Заказ добавлен");
                            }
                            else
                            {
                                MessageBox.Show("Ошибка");
                            }
                        }
                        else
                        {
                            MessageBox.Show("Добавьте продукты для добавления");
                        }

                    }));
            }
        }
        private RelayCommand _AddOrderItem;
        public RelayCommand AddOrderItem
        {
            get
            {
                return _AddOrderItem ??
                    (_AddOrderItem = new RelayCommand(async obj =>
                    {

                        OrdersItem.Add(new Models.OrdersItem()
                        {
                            Products = ProductsSelect,
                           product_id = ProductsSelect.id_product,
                            ProductCount =  ProductsSelectCount
                        });

                    }));
            }
        }
        private RelayCommand _DeleteOrderItem;
        public RelayCommand DeleteOrderItem
        {
            get
            {
                return _DeleteOrderItem ??
                    (_DeleteOrderItem = new RelayCommand(obj =>
                    {

                        OrdersItem.Remove(obj as OrdersItem);

                    }));
            }
        }
    }
}
