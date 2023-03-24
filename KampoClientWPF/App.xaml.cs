using KampoClientWPF.DataService.DBservice;
using KampoClientWPF.Models;
using KampoClientWPF.Views.Windows;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

namespace KampoClientWPF
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static Window CurrentWindow { get; set; }
        private void Application_Startup(object sender, StartupEventArgs e)
        {
            if(KampoClientWPF.Properties.Settings.Default.Login != string.Empty)
            {
                KampoDBEntities context = new KampoDBEntities();
                UsersService.UserInfo = context.Users.FirstOrDefault(p => p.Login == KampoClientWPF.Properties.Settings.Default.Login);
                MainWindow mainwindow = new MainWindow();
                CurrentWindow = mainwindow;
                mainwindow.Show();
            }
            else
            {
                SignIn signIn = new SignIn();
                CurrentWindow = signIn;
                signIn.Show();
            }
            
        }
    }
}
