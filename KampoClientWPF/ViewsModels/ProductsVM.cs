using KampoClientWPF.DataService;
using KampoClientWPF.DataService.DBservice;
using KampoClientWPF.Models;
using KampoClientWPF.Views.Pages;
using KampoClientWPF.Views.Windows;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KampoClientWPF.ViewsModels
{
    public class ProductsVM : BaseVM
    {
        private Task InitAsyn { get; set; }
        private Products _SendProduct;

        public Products SendProduct
        {
            get { return _SendProduct; }
            set { _SendProduct = value;
                OnPropertyChanged();
            }
            
        }
        public ObservableCollection<Products> ProductsList { get; set; }
       
        private RelayCommand _AddNewProduct;
        public RelayCommand AddNewProduct
        {
            get
            {
                return _AddNewProduct ??
                    (_AddNewProduct = new RelayCommand(obj =>
                    {
                        DataService.NavigationFrame.NavFrame.Navigate(new NewProduct());
                    }));
            }
        }
        private RelayCommand _SelectProduct;
        public RelayCommand SelectProduct
        {
            get
            {
                return _SelectProduct ??
                    (_SelectProduct = new RelayCommand(obj =>
                    {
                       
                        
                    }));
            }
        }

        private RelayCommand _LoadData;
        public RelayCommand LoadData
        {
            get
            {
                return _LoadData ??
                    (_LoadData = new RelayCommand(async obj =>
                    {
                        await GetProducts();
                    }));
            }
        }
        public ProductsVM()
        {
            ProductsList = new ObservableCollection<Products>();
            InitAsyn = GetProducts();
        }
        public async Task GetProducts()
        {
            ProductService ProductService = new ProductService();
            List<Products> products = await ProductService.GetProductsAsync();
            foreach(var item in products)
            {
                ProductsList.Add(item);
            }
        }
    }
}
