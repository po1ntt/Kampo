using KampoClientWPF.DataService;
using KampoClientWPF.Models;
using KampoClientWPF.ViewsModels;
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

namespace KampoClientWPF.Views.Pages.Subpages
{
    /// <summary>
    /// Логика взаимодействия для AboutOrder.xaml
    /// </summary>
    public partial class AboutOrder : Page
    {
        public AboutOrder(Models.Orders orders)
        {
            InitializeComponent();
            DataContext = new AboutOrderVM(orders);

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationFrame.NavFrame.Navigate(new OrdersPage());
        }

        private void Word_1(object sender, RoutedEventArgs e)
        {
           
        }
    }
}
