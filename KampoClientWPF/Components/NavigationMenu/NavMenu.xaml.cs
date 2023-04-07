using KampoClientWPF.DataService.DBservice;
using KampoClientWPF.Models;
using KampoClientWPF.Views.Pages;
using KampoClientWPF.Views.Windows;
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

namespace KampoClientWPF.Components.NavigationMenu
{
    /// <summary>
    /// Логика взаимодействия для NavMenu.xaml
    /// </summary>
    public partial class NavMenu : UserControl
    {
        
        public bool isbusy { get; set; }
        public NavMenu()
        {
            InitializeComponent();
            
        }
        private void ButtonOpenMenu_Click(object sender, RoutedEventArgs e)
        {
            if (isbusy == true)
                return;
            isbusy = true;
            ButtonOpenMenu.Visibility = Visibility.Collapsed;
            ButtonCloseMenu.Visibility = Visibility.Visible;
            isbusy= false;
        }

        private void ButtonCloseMenu_Click(object sender, RoutedEventArgs e)
        {
            if (isbusy == true)
                return;
            isbusy = true;
            ButtonOpenMenu.Visibility = Visibility.Visible;
            ButtonCloseMenu.Visibility = Visibility.Collapsed;
            isbusy = false;
        }

      
      
        private void OutAppClick_Click(object sender, MouseButtonEventArgs e)
        {
            Application.Current.MainWindow.Close();
        }
        private void Logout_Click(object sender, MouseButtonEventArgs e)
        {
            KampoClientWPF.Properties.Settings.Default.Reset();
            UsersService.UserInfo = null;
            SignIn signIn = new SignIn();
            Application.Current.MainWindow = signIn;
            signIn.Show();
            App.CurrentWindow.Close();
            App.CurrentWindow = signIn;

        }
       
        private void Logs_Click(object sender, MouseButtonEventArgs e)
        {

            DataService.NavigationFrame.NavFrame.Navigate(new Logs());

        }
        private void Product_Click(object sender, MouseButtonEventArgs e)
        {
            DataService.NavigationFrame.NavFrame.Navigate(new ProductPage());
        }
        private void Orders_Click(object sender, MouseButtonEventArgs e)
        {
            DataService.NavigationFrame.NavFrame.Navigate(new OrdersPage());
        }
        private void Property_Click(object sender, MouseButtonEventArgs e)
        {
            DataService.NavigationFrame.NavFrame.Navigate(new Views.Pages.Properties());
        }

        private void NewProduct_click(object sender, MouseButtonEventArgs e)
        {
            DataService.NavigationFrame.NavFrame.Navigate(new NewProduct());
        }
    }
}

