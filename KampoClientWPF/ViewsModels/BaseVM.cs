using KampoClientWPF.DataService;
using KampoClientWPF.DataService.DBservice;
using KampoClientWPF.DataService.Logger;
using KampoClientWPF.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace KampoClientWPF.ViewsModels
{
    public class BaseVM : INotifyPropertyChanged
    {
        public ProductService productService { get; set; } = new ProductService();
        public CategoryService categoryService { get; set; } = new CategoryService();
        public OrderService orderService { get; set; } = new OrderService();
        public UsersService usersService { get; set; } = new UsersService();
        public Logger Logger { get; set; } = new Logger();
        public PropertyService propertyService { get; set; } = new PropertyService();



        private bool _IsBusy;

        public bool IsBusy
        {
            get { return _IsBusy; }
            set { _IsBusy = value;
                OnPropertyChanged();
            }
        }
        private RelayCommand _GoBackCommand;
        public RelayCommand GoBackCommand
        {
            get
            {
                return _GoBackCommand ??
                    (_GoBackCommand = new RelayCommand(obj =>
                    {
                        DataService.NavigationFrame.NavFrame.GoBack();
                    }));
            }
        }
        public async void LoadCategories(ObservableCollection<ProductsCategory> productsCategories)
        {
            productsCategories.Clear();
            List<ProductsCategory> categories = await categoryService.GetCategoryAsync();
            foreach(var item in categories)
            {
                productsCategories.Add(item);
            }
        }
        public  void LoadProducts(ObservableCollection<Products> products)
        {
            products.Clear();
            List<Products> productslist =  productService.GetProductsAsync();
            foreach (var item in productslist)
            {
                products.Add(item);
            }
        }
        public BaseVM()
        {

        }
      
        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}
