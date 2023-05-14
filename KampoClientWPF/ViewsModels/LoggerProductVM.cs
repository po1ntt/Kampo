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

namespace KampoClientWPF.ViewsModels
{
    public class LoggerProductVM : BaseVM
    {
        public class LoggerModel : BaseVM
        { 
            public LoggerProducts loggerProducts { get; set; }
            public ObservableCollection<ChangeProductsList> changeProducts { get; set; } = new ObservableCollection<ChangeProductsList>();
            private Rotation _rotation;
            public Rotation Rotation
            {
                get { return _rotation; }
                set { _rotation = value;
                   
                    OnPropertyChanged();
                }
            }
            private Visibility _IsExpand;
            public Visibility IsExpand
            {
                get { return _IsExpand; }
                set { _IsExpand = value;
                    OnPropertyChanged();
                }
            }
            public RelayCommand relayCommand { get; set; }

        }
        public ObservableCollection<LoggerModel> loggerProducts { get; set; }
        private DateTime _SelectedDate;
        public DateTime SelectedDate
        {
            get { return _SelectedDate; }
            set { _SelectedDate = value;
                GetLoggerData();
                OnPropertyChanged();
            }
        }
        private RelayCommand _OpenCloseChildsCommand;
        public RelayCommand OpenCloseChildsCommand
        {
            get
            {
                return _OpenCloseChildsCommand ??
                    (_OpenCloseChildsCommand = new RelayCommand(obj =>
                    {
                        var loggerModel = obj as LoggerModel;
                        RotateAndExpand(loggerModel);

                    }));
            }
        }
        public LoggerProductVM()
        {
            loggerProducts = new ObservableCollection<LoggerModel>();

            SelectedDate = DateTime.Today;
            GetLoggerData();
        }
        public  void RotateAndExpand(LoggerModel loggerModel)
        {
            if (loggerModel.IsExpand == Visibility.Visible)
            {
                loggerModel.Rotation = Rotation.Rotate0;
                loggerModel.IsExpand = Visibility.Collapsed;
            }
            else
            {
                loggerModel.Rotation = Rotation.Rotate90;
                loggerModel.IsExpand = Visibility.Visible;
            }
           
        }
        public void InitGetLoggerDate()
        {
            GetLoggerData();
        }
        public  void GetLoggerData()
        {
            loggerProducts.Clear();
            var collectionLoggerDate = DataService.DBservice.LoggerProductService.loggerProductService.GetLoggerProductsAsync(SelectedDate.ToString("d"));
            foreach(var item in collectionLoggerDate)
            {
                LoggerModel loggerModel = new LoggerModel();
                loggerModel.IsExpand = Visibility.Collapsed;
                loggerModel.Rotation = Rotation.Rotate0;
                loggerModel.loggerProducts = item;
                loggerModel.relayCommand = OpenCloseChildsCommand;
                foreach(var param in item.ChangeProductsList.ToList())
                {
                    loggerModel.changeProducts.Add(param);
                }
                loggerProducts.Add(loggerModel);

            }
        }
        private void excell_Click(object sender, EventArgs e)
        {
          
        }

        public void SaveExel(string filepath, List<ChangeProductsList> changeProductsLists)
        {
           
        }
    }
}
