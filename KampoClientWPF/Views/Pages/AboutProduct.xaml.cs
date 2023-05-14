﻿using KampoClientWPF.Models;
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

namespace KampoClientWPF.Views.Pages
{
    /// <summary>
    /// Логика взаимодействия для AboutProduct.xaml
    /// </summary>
    public partial class AboutProduct : Page
    {
        public AboutProduct(Products products)
        {
            InitializeComponent();
            DataContext = new AboutProductVM(products);
            cmbCategory.SelectedIndex = products.productscategory_id - 1;
        }

        private void backbutton_Click(object sender, RoutedEventArgs e)
        {
            DataService.NavigationFrame.NavFrame.GoBack();
        }

        private void TextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            e.Handled = !DataService.StaticServices.ServicesStatic.IsTextAllowed(e.Text);
        }
    }
}
