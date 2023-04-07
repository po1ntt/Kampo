using KampoClientWPF.DataService;
using KampoClientWPF.Models;
using KampoClientWPF.Views.Pages.Subpages;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KampoClientWPF.ViewsModels
{
    public class OrderVM : BaseVM
    {
        public ObservableCollection<Orders> OrdersList { get; set; }
       
        public OrderVM()
        {
            OrdersList = new ObservableCollection<Orders>();
            
        }

        private RelayCommand _AddNewOrder;
        public RelayCommand AddNewOrder
        {
            get
            {
                return _AddNewOrder ??
                    (_AddNewOrder = new RelayCommand(obj =>
                    {
                        DataService.NavigationFrame.NavFrame.Navigate(new NewOrder());
                    }));
            }
        }
        private RelayCommand _Loaded;
        public RelayCommand Loaded
        {
            get
            {
                return _Loaded ??
                    (_Loaded = new RelayCommand(obj =>
                    {
                        LoadOrdersList();
                    }));
            }
        }
        public async void LoadOrdersList()
        {
            OrdersList.Clear();
            var listorders = await orderService.GetOrdersAsync();
            foreach(var item in listorders)
            {
                OrdersList.Add(item);
            }
        }

    }
}
