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
     public class PropsAndCategoryVM : BaseVM
    {
        private Task LoadData { get; set; }
		private string _PropsValue;

		public string PropsValue
        {
			get { return _PropsValue; }
			set { _PropsValue = value;
				OnPropertyChanged();
			}
		}
        private string _CategoryValue;

        public string CategoryValue
        {
            get { return _CategoryValue; }
            set
            {
                _CategoryValue = value;
                OnPropertyChanged();
            }
        }
        public ObservableCollection<Models.Properties> PropsList { get; set; }
        public ObservableCollection<ProductsCategory> CategoryList { get; set; }
        public async Task InitAsync()
        {
            await LoadProductCategory();
            await LoadPropertiesList();
        }
        private RelayCommand _RemoveCategory;
        public RelayCommand RemoveCategory
        {
            get
            {
                return _RemoveCategory ??
                    (_RemoveCategory = new RelayCommand(async obj =>
                    {

                        bool result = await categoryService.DeleteCategory(obj as ProductsCategory);
                        if (result)
                        {
                            CategoryList.Remove(obj as ProductsCategory);
                        }
                        else
                        {
                            MessageBox.Show("Ошибка");
                        }
                    }));
            }
        }
        private RelayCommand _RemoveProperty;
        public RelayCommand RemoveProperty
        {
            get
            {
                return _RemoveProperty ??
                    (_RemoveProperty = new RelayCommand(async obj =>
                    {

                        bool result = await propertyService.DeleteProperty(obj as Models.Properties);
                        if (result)
                        {
                            PropsList.Remove(obj as Models.Properties);
                        }
                        else
                        {
                            MessageBox.Show("Ошибка");
                        }
                    }));
            }
        }
        private RelayCommand _AddProps;
        public RelayCommand AddProps
        {
            get
            {
                return _AddProps ??
                    (_AddProps = new RelayCommand(async obj =>
                    {
                        Models.Properties properties = new Models.Properties();
                        PropertyService propertyService = new PropertyService();
                        if (!string.IsNullOrWhiteSpace(PropsValue))
                        {
                            string result = await propertyService.NewProperty(PropsValue);
                            if (result != "Cвойство уже существует")
                            {
                                properties = await propertyService.FindPropertyByNameAsync(PropsValue);
                                PropsList.Add(properties);
                                Logger.AddData(UsersService.UserInfo, "Cвойство", PropsValue);
                                PropsValue = string.Empty;

                            }
                            else
                            {
                                MessageBox.Show(result);
                            }
                        }
                        else
                        {
                            MessageBox.Show("Введите название свойства");
                        }

                    },
                    (obj) => PropsValue != string.Empty));
            }
        }
        private RelayCommand _AddCategory;
        public RelayCommand AddCategory
        {
            get
            {
                return _AddCategory ??
                    (_AddCategory = new RelayCommand(async obj =>
                    {
                        ProductsCategory category = new ProductsCategory();
                        CategoryService categoryService = new CategoryService();
                        if (!string.IsNullOrWhiteSpace(CategoryValue))
                        {
                            string result = await categoryService.NewCategory(CategoryValue);
                            if (result != "Категория уже существует")
                            {
                                category = await categoryService.FindCategoryByNameAsync(CategoryValue);
                                CategoryList.Add(category);
                                Logger.AddData(UsersService.UserInfo, "Категория", CategoryValue);
                                CategoryValue = string.Empty;

                            }
                            else
                            {
                                MessageBox.Show(result);
                            }
                        }
                        else
                        {
                            MessageBox.Show("Введите название категории");
                        }


                    },
                    (obj) => CategoryValue != string.Empty));
            }
        }
        public async Task LoadProductCategory()
        {
            CategoryService categoryService = new CategoryService();
            List<ProductsCategory> products = await categoryService.GetCategoryAsync();
            foreach (var item in products)
            {
                CategoryList.Add(item);
            }
        }
        public async Task LoadPropertiesList()
        {
            PropertyService PropertyService = new PropertyService();
            List<Models.Properties> products = await PropertyService.GetPropertiesAsync();
            foreach (var item in products)
            {
                PropsList.Add(item);
            }
        }
        public PropsAndCategoryVM()
        {
            CategoryList = new ObservableCollection<ProductsCategory>();
            PropsList = new ObservableCollection<Models.Properties>();
            LoadData = InitAsync();
        }

    }
}
