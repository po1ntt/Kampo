using KampoClientWPF.DataService.DBservice;
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
    /// Логика взаимодействия для HeaderMainWindow.xaml
    /// </summary>
    public partial class HeaderMainWindow : UserControl
    {
        public HeaderMainWindow()
        {
            InitializeComponent();

            if(UsersService.UserInfo != null)
            {
                UserNameTxb.Text = UsersService.UserInfo.Login;

            }
        }
        private void SvernutApp(object sender, MouseButtonEventArgs e)
        {
            App.CurrentWindow.WindowState = WindowState.Minimized;
        }

        private void CloseApp(object sender, MouseButtonEventArgs e)
        {
            Application.Current.Shutdown();
        }
        private void MaximizeOrStandart(object sender, MouseButtonEventArgs e)
        {
            if(App.CurrentWindow.WindowState == WindowState.Maximized)
            {
                App.CurrentWindow.WindowState = WindowState.Normal;

            }
            else
            {
                App.CurrentWindow.WindowState = WindowState.Maximized;

            }

        }
    }
}
