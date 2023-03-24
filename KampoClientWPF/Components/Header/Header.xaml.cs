using KampoClientWPF.DataService.DBservice;
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

namespace KampoClientWPF.Components.Header
{
    /// <summary>
    /// Логика взаимодействия для Header.xaml
    /// </summary>
    public partial class Header : UserControl
    {
        public Users ThatUser { get; set; }

        public Header()
        {
            InitializeComponent();
            ThatUser = UsersService.UserInfo;
            DataContext = this;
           
        }

        private void SvernutApp(object sender, MouseButtonEventArgs e)
        {
            App.CurrentWindow.WindowState = WindowState.Minimized;
        }

        private void CloseApp(object sender, MouseButtonEventArgs e)
        {
            Application.Current.Shutdown();
        }
    }
}
