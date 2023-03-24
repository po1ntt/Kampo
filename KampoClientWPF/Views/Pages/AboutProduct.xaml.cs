using KampoClientWPF.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace KampoClientWPF.Views.Pages
{
    /// <summary>
    /// Логика взаимодействия для AboutProduct.xaml
    /// </summary>
    public partial class AboutProduct : Page
    {
        public Products ProductItem { get; set; }
        public bool ReadSetting { get; set; }
        public AboutProduct(Products products)
        {
            InitializeComponent();
            ProductItem = products;
            DataContext = this;
         
        }

        private void backbutton_Click(object sender, RoutedEventArgs e)
        {
            DataService.NavigationFrame.NavFrame.GoBack();
        }

      

        private void ToogleButtonClick(object sender, RoutedEventArgs e)
        {
            if (ReadChangesButton.IsChecked == true)
            {
               
            }
            else
            {

            }
        }
    }
}
