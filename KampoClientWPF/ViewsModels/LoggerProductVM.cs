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
using Microsoft.Office.Interop.Excel;

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

        private RelayCommand _ExcelClick;
        public RelayCommand ExcelClick
        {
            get
            {
                return _ExcelClick ??
                    (_ExcelClick = new RelayCommand(async obj =>
                    {
                        Excel_OutPut();

                    }));
            }
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
        public void Excel_OutPut()
        {
            Stream myStream;
            System.Windows.Forms.SaveFileDialog saveFileDialog1 = new System.Windows.Forms.SaveFileDialog();

            saveFileDialog1.Filter = "EXCEL Files 2003 (*.xls)|*.xls|All files (*.*)|*.*";

            saveFileDialog1.RestoreDirectory = true;
            Microsoft.Office.Interop.Excel.Worksheet worksheet;
            if (saveFileDialog1.ShowDialog() == DialogResult.OK)
            {
               
                    object misValue = System.Reflection.Missing.Value;

                    var path = saveFileDialog1.FileName;
                    Microsoft.Office.Interop.Excel.Application app = new Microsoft.Office.Interop.Excel.Application();
                    Workbook workbook = app.Workbooks.Add(misValue);
                    worksheet = (Microsoft.Office.Interop.Excel.Worksheet)app.Worksheets.get_Item(1);
                    worksheet.Cells[1, 1] = SelectedDate.ToString("d");
                    worksheet.Columns.ColumnWidth = 24;
                    worksheet.Cells[1, 1].Font.Bold = true;
                    worksheet.Cells[2, 1] = "Название";
                    worksheet.Cells[2, 2] = "Категория";
                    worksheet.Cells[2, 3] = "Кол-во";

                    int i = 3;
                    foreach (var item in loggerProducts.ToList())
                    {
                        worksheet.Cells[i, 1] = item.Products.ProductName;
                        worksheet.Cells[i, 2] = item.Products.ProductsCategory.CategoryName;
                        worksheet.Cells[i, 3] = item.count_product;
                        i++;

                    }
                    workbook.SaveAs(path, misValue, misValue, misValue, misValue, misValue, XlSaveAsAccessMode.xlShared, misValue, misValue, misValue, misValue, misValue);
                    System.Windows.MessageBox.Show("excel файл создан");
                    /* myStream.Close();
                     dgInfoLogger.SelectAllCells();
                     dgInfoLogger.ClipboardCopyMode = DataGridClipboardCopyMode.IncludeHeader;
                     ApplicationCommands.Copy.Execute(null, dgInfoLogger);
                     String resultat = (string)System.Windows.Clipboard.GetData(System.Windows.DataFormats.CommaSeparatedValue);
                     String result = (string)System.Windows.Clipboard.GetData(System.Windows.DataFormats.Text);
                     dgInfoLogger.UnselectAllCells();
                     System.IO.StreamWriter file1 = new System.IO.StreamWriter(path, true, System.Text.Encoding.GetEncoding(1251));
                     file1.WriteLine(result.Replace(',', ' '));
                     file1.Close();*/

                
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
      
    }
}
