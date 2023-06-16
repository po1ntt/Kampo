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
using System.Windows.Forms;

namespace KampoClientWPF.ViewsModels
{
    public class ProductAddVM : BaseVM
    {
        private Task LoadData { get; set; }
        private Products _Product;

        public Products Product
        {
            get { return _Product; }
            set
            {
                _Product = value;
                OnPropertyChanged();
            }

        }
        private string _ProductImage;

        public string ProductImage
        {
            get { return _ProductImage; }
            set { _ProductImage = value;
                ImageSourse = _ProductImage;
                if(!string.IsNullOrWhiteSpace(_ProductImage))
                {
                    Product.ImageUrl = _ProductImage;

                }
                OnPropertyChanged();
            }
        }

        private ObservableCollection<ProductsProperties> _productProperties;
        public ObservableCollection<ProductsProperties> productsProperties
        {
            get { return _productProperties; }
            set
            {
                _productProperties = value;
                OnPropertyChanged();
            }

        }

        private string _ImageSourse;

        public string ImageSourse
        {
            get { return _ImageSourse; }
            set { _ImageSourse = value;
                OnPropertyChanged();
            }
        }

        public ObservableCollection<ProductsCategory> ProductCategorie { get; set; } 
       

        public ObservableCollection<Models.Properties> PropertiesList { get; set; }


        private RelayCommand _PropertyAddToProduct;
        public RelayCommand PropertyAddToProduct
        {
            get
            {
                return _PropertyAddToProduct ??
                    (_PropertyAddToProduct = new RelayCommand(obj =>
                    {
                        productsProperties.Add(new ProductsProperties
                        {
                            Properties = Propertie,
                            ValueProperty = ValueProperty
                        });
                    }));
            }
        }
        private RelayCommand _AddProduct;
        public RelayCommand AddProduct
        {
            get
            {
                return _AddProduct ??
                    (_AddProduct = new RelayCommand( async obj =>
                    {
                        ProductService productService = new ProductService();
                        if(productsProperties.Count > 0)
                        {
                            Product.ProductsProperties = productsProperties;
                        }
                        if (Product.ProductName != string.Empty && Product.ProductDescription != string.Empty && Product.CountProduct.ToString() != string.Empty && Product.ProductsCategory != null)
                        {
                            await productService.AddProductAsync(Product);
                        }
                        else
                        {
                            MessageBox.Show("Поля заполнены не корректно");
                        }
                        if (productsProperties.Count > 0)
                        {
                            PropertyService propertyService = new PropertyService();
                            await propertyService.AddToProductProperties(productsProperties, Product.ProductName);
                        }
   
                        productsProperties.Clear();
                        Logger.AddData(UsersService.UserInfo, "Продукт", Product.ProductName);
                        Propertie = null;
                        ValueProperty = string.Empty;
                        ProductImage = null;
                        ImageSourse = "\\Resource\\ImagesProducts\\imagenotfound.png";
                        Product = new Products();


                    }));
            }
        }

        private Models.Properties _Properties;

        public Models.Properties Propertie
        {
            get { return _Properties; }
            set
            {
                _Properties = value;
                OnPropertyChanged();
            }

        }
        private string _ValueProperty;

        public string ValueProperty
        {
            get { return _ValueProperty; }
            set
            {
                _ValueProperty = value;
                OnPropertyChanged();
            }
        }
        public ProductAddVM()
        {
            Product = new Products();
            productsProperties = new ObservableCollection<ProductsProperties>();
            ProductCategorie = new ObservableCollection<ProductsCategory>();
            PropertiesList = new ObservableCollection<Models.Properties>();
            ImageSourse = "\\Resource\\ImagesProducts\\imagenotfound.png";
            LoadData = InitAsync();
           

        }

        public async Task InitAsync()
        {
           await LoadProductCategory();
           await LoadPropertiesList();
        }

        public async Task LoadProductCategory()
        {
            CategoryService categoryService = new CategoryService();
            List<ProductsCategory> products = await categoryService.GetCategoryAsync();
            foreach (var item in products)
            {
                ProductCategorie.Add(item);
            }
        }
        public async Task LoadPropertiesList()
        {
            PropertyService PropertyService = new PropertyService();
            List<Models.Properties> products = await PropertyService.GetPropertiesAsync();
            foreach (var item in products)
            {
                PropertiesList.Add(item);
            }
        }
    }
  

}
