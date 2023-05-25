using KampoClientWPF.DataService;
using KampoClientWPF.Models;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media.Imaging;
using System.IO;
using System.Windows.Forms;
using System.Runtime.InteropServices.Expando;

namespace KampoClientWPF.ViewsModels
{
    public class LoggerProductVM : BaseVM
    {
        private Visibility _visibilityDG;

        public Visibility visibilityDG
        {
            get { return _visibilityDG; }
            set { _visibilityDG = value;
                OnPropertyChanged();
            }
        }
        private Visibility _visibilityTB;

        public Visibility visibilityTB
        {
            get { return _visibilityTB; }
            set { _visibilityTB = value;
                OnPropertyChanged();
            }
        }


        public ObservableCollection<ChangeProductsList> loggerProducts { get; set; }
        public ObservableCollection<ProductsCategory> productsCategories { get; set; }
        private ProductsCategory _selectedCategory;

        public ProductsCategory selectedCategory
        {
            get { return _selectedCategory; }
            set { _selectedCategory = value;
                GetLoggerData(_selectedCategory.id_productcategory);
                OnPropertyChanged();
            }
        }

        private DateTime _SelectedDate;
        public DateTime SelectedDate
        {
            get { return _SelectedDate; }
            set { _SelectedDate = value;
                GetLoggerData(_selectedCategory.id_productcategory);
                OnPropertyChanged();
            }
        }
      
        public LoggerProductVM()
        {
            loggerProducts = new ObservableCollection<ChangeProductsList>();
            productsCategories = new ObservableCollection<ProductsCategory>();
            GetCategoriesInfo();
        }
       
       
        public  async void GetLoggerData(int category)
        {
            loggerProducts.Clear();
            var collectionLoggerDate = await  DataService.DBservice.LoggerProductService.loggerProductService.GetLoggerProductsAsync(SelectedDate.ToString("d"), category);
            foreach(var item in collectionLoggerDate)
            {
            
                foreach(var items in item.ChangeProductsList)
                {
                    loggerProducts.Add(items);
                }

            }
            if (collectionLoggerDate.Count == 0)
            {
                visibilityDG = Visibility.Collapsed;
                visibilityTB = Visibility.Visible;
            }
            else
            {
                visibilityDG = Visibility.Visible;
                visibilityTB = Visibility.Collapsed;
            }
        }
        public async void GetCategoriesInfo()
        {
            productsCategories.Clear();
            var categoriesList = await categoryService.GetCategoryAsync();
            productsCategories.Add(new ProductsCategory()
            {
                id_productcategory = 0,
                CategoryName = "Не выбрано"
            });
            selectedCategory = productsCategories[0];
            SelectedDate = DateTime.Today;
            foreach (var item in categoriesList)
            {
                productsCategories.Add(item);
            }
        }
        private void excell_Click(object sender, EventArgs e)
        {
          
        }

        public void SaveExel(string filepath, List<ChangeProductsList> changeProductsLists)
        {
           
        }
    }
}
