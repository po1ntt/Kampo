using KampoClientWPF.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Markup;

namespace KampoClientWPF.DataService.StaticServices
{
    public class ServicesStatic
    {
        public const string TYPEACTION_ORDER = "Заказ";
        public const string TYPEACTION_HAND = "Изменено вручную";

        private static readonly Regex _regex = new Regex("[^0-9]+"); //regex that matches disallowed text
        public static bool IsTextAllowed(string text)
        {
            return !_regex.IsMatch(text);
        }
       
       
    }
}

