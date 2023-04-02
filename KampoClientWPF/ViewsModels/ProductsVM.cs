using KampoClientWPF.DataService;
using KampoClientWPF.DataService.DBservice;
using KampoClientWPF.DataService.FiltersModels;
using KampoClientWPF.Models;
using KampoClientWPF.Views.Pages;
using KampoClientWPF.Views.Windows;
using MaterialDesignThemes.Wpf;
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

        private RelayCommand _NameFilterCollection;
        public RelayCommand NameFilterCollectio
        {
            get
            {
                return _NameFilterCollection ??
                    (_NameFilterCollection = new RelayCommand(async obj =>
                    {
                        string name = obj as string;

                    }));
            }
        }
        private string _ProductNameFilter;

        public string ProductNameFilter
        {
            get { return _ProductNameFilter; }
            set { _ProductNameFilter = value;
                FilterProduct();
                OnPropertyChanged();
            }
        }
        private ProductsCategory _ProductsCategoryFilter;

        public ProductsCategory ProductsCategoryFilter
        {
            get { return _ProductsCategoryFilter; }
            set { _ProductsCategoryFilter = value;
                FilterProduct();
               
                OnPropertyChanged();
            }
        }
        private ObservableCollection<ProductsCategory> _ProductsCategoryList;

        public ObservableCollection<ProductsCategory> ProductsCategoryList
        {
            get { return _ProductsCategoryList; }
            set
            {
                _ProductsCategoryList = value;
               
                OnPropertyChanged();
            }
        }


        public  async void FilterProduct()
        {
            ProductsList.Clear();
            List<Products> products = await productService.GetProductsAsync();

            if (ProductNameFilter != null)
            {
                products = products.Where(p=>p.ProductName.ToLower().Contains(ProductNameFilter.ToLower())).ToList();
            }
            if(ProductsCategoryFilter.CategoryName != "Не выбрано") 
            {
                products = products.Where(p => p.ProductsCategory.CategoryName == ProductsCategoryFilter.CategoryName).ToList();

            }
            if (ProductNameFilter == null && ProductsCategoryFilter.CategoryName == "Не выбрано")
            {
               LoadProducts(ProductsList);
            }
            if(products.Count != 0 && ProductNameFilter != null || ProductsCategoryFilter.CategoryName != "Не выбрано")
            {
                foreach(var item in products)
                {
                    ProductsList.Add(item);
                }
            }
        }

        public ProductsVM()
        {
            ProductsList = new ObservableCollection<Products>();
            LoadProducts(ProductsList);
            ProductsCategoryList = new ObservableCollection<ProductsCategory>();
            LoadCategories(ProductsCategoryList);
            ProductsCategoryList.Insert(0, new ProductsCategory()
            {
                CategoryName = "Не выбрано"
            });
        }
      
    }
}
