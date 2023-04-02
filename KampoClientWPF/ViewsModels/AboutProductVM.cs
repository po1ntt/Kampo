using KampoClientWPF.DataService;
using KampoClientWPF.DataService.DBservice;
using KampoClientWPF.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace KampoClientWPF.ViewsModels
{
    public class AboutProductVM : BaseVM
    {
        private bool _ReadSetting;

        public bool ReadSetting
        {
            get { return _ReadSetting; }
            set { _ReadSetting = value;
                OnPropertyChanged();
            }
        }
        private string _ImageSourse;

        public string ImageSourse
        {
            get { return _ImageSourse; }
            set
            {
                _ImageSourse = value;
                OnPropertyChanged();
            }
        }
        private string _ProductImage;

        public string ProductImage
        {
            get { return _ProductImage; }
            set
            {
                _ProductImage = value;
                ImageSourse = _ProductImage;
                ProductItem.ImageUrl = _ProductImage;
                OnPropertyChanged();
            }
        }
        private Products _ProductItem { get; set; }
        public Products ProductItem
        {
            get { return _ProductItem; }
            set
            {
                _ProductItem = value;
                OnPropertyChanged();
            }
        }
        private ObservableCollection<ProductsCategory> _ListProductsCategory { get; set; }
        public ObservableCollection<ProductsCategory> ListProductsCategory
        {
            get { return _ListProductsCategory; }
            set
            {
                _ListProductsCategory = value;
                OnPropertyChanged();
            }
        }
        private ProductsCategory _SelectedtProductsCategory { get; set; }
        public  ProductsCategory SelectedProductsCategory
        {
            get { return _SelectedtProductsCategory; }
            set
            {
                _SelectedtProductsCategory = value;
                ProductItem.productscategory_id = _SelectedtProductsCategory.id_productcategory;
                OnPropertyChanged();
            }
        }
        public AboutProductVM(Products products)
        {
            ListProductsCategory = new ObservableCollection<ProductsCategory>();
            LoadCategories(ListProductsCategory);
            ProductItem = products;
            SelectedProductsCategory = ProductItem.ProductsCategory;
            ProductImage = products.ImageUrl;
        }
        private RelayCommand _UpdateProduct;
        public RelayCommand UpdateProduct
        {
            get
            {
                return _UpdateProduct ??
                    (_UpdateProduct = new RelayCommand(async obj =>
                    {

                        bool result = await productService.UpdateProduct(ProductItem);
                        if(result)
                        {
                            MessageBox.Show("Товар обновлен");
                            Logger.UpdateData(UsersService.UserInfo, "Продукт", ProductItem.ProductName);
                        }
                        else
                        {
                            MessageBox.Show("Ошибка");
                        }
                    }));
            }
        }
       
        
    }
}
