﻿using KampoClientWPF.ViewsModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace KampoClientWPF.Views.Pages
{
    /// <summary>
    /// Логика взаимодействия для LoggerProductPage.xaml
    /// </summary>
    public partial class LoggerProductPage : Page
    {
        public LoggerProductPage()
        {
            InitializeComponent();
            DataContext = new LoggerProductVM();
            cmbCategory.SelectedIndex = 0;
           
        }

     
    }
}
