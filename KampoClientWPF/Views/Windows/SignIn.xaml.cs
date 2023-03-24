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
using System.Windows.Shapes;

namespace KampoClientWPF.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для SignIn.xaml
    /// </summary>
    public partial class SignIn : Window
    {
        public SignIn()
        {
           
            InitializeComponent();
        }

        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ChangedButton == MouseButton.Left)
                this.DragMove();

        }

        private async void Authorize_Click(object sender, RoutedEventArgs e)
        {
            UsersService usersService = new UsersService();
            bool result = await usersService.AuthorizeUser(logintxb.Text, passtxb.Text, rememeberme.IsChecked.Value);
            if (result)
            {
                
                MainWindow mainWindow = new MainWindow();
                Application.Current.MainWindow = mainWindow;
                mainWindow.Show();
                App.CurrentWindow.Close();
                App.CurrentWindow = mainWindow;
            }
            else
            {
                MessageBox.Show("Пароль или логин не верен");
            }
        }
    }
}
