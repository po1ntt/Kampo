using KampoClientWPF.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KampoClientWPF.DataService.FiltersModels
{
    public class ProductFilter
    {
        public string NameProduct { get; set; }
        public ProductsCategory ProductCategory { get; set; }


    }
}
