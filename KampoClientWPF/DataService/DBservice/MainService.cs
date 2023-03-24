using KampoClientWPF.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KampoClientWPF.DataService.DBservice
{
    public class MainService
    {
        public readonly KampoDBEntities context;
        public MainService()
        {
            context = new KampoDBEntities();
        }
    }
}
