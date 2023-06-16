using KampoClientWPF.Models;
using Microsoft.Office.Interop.Word;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using word = Microsoft.Office.Interop.Word;

namespace KampoClientWPF.DataService
{
    public class WordService
    {
        private FileInfo _fileInfo;
        public WordService(string filename)
        {
            var file = System.IO.Path.GetDirectoryName(AppDomain.CurrentDomain.BaseDirectory);
            int i = 0;
            while (i != 2){
                file = System.IO.Directory.GetParent(file).FullName;
                i++;
            }
            file = file + "/DataService/";
            try
            {
                if (File.Exists(file + "\\TemplateDoc.Doc"))
                {

                    _fileInfo = new FileInfo(file + "\\TemplateDoc.Doc");
                }
                else
                {
                    MessageBox.Show("Путь найден не верно :L");
                }
               

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
               
    

        }
        public bool Process(List<OrdersItem> ordersItems)
        {
            word.Application app = null;
            if (_fileInfo == null)
                return false;
            try
            {
               
                app = new word.Application();
                Object file = _fileInfo.FullName;
                Object missing = Type.Missing;
                app.Documents.Open(file);
                var oneOfOrder = ordersItems[0];
                var items = new Dictionary<string, string>()
                {
                    {"[DateOrder]", DateTime.Now.ToString("d")},
                    {"[NumberOrder]", oneOfOrder.Orders.NumberOrder }

                };
                foreach (var item in items)
                {
                    word.Find find = app.Selection.Find;
                    find.Text = item.Key;
                    find.Replacement.Text = item.Value;
                    Object wrap = word.WdFindWrap.wdFindContinue;
                    Object replace = word.WdReplace.wdReplaceAll;
                    find.Execute(FindText: Type.Missing,
                        MatchCase: false,
                        MatchWholeWord: false,
                        MatchWildcards: false,
                        MatchSoundsLike: missing,
                        MatchAllWordForms: false,
                        Forward: true,
                        Wrap: wrap,
                        Format: false
                        , ReplaceWith: missing, Replace: replace);
                }
                word.Table table = app.ActiveDocument.Tables[1];
                int index = 2;
                foreach(var item in ordersItems)
                {
                    table.Rows.Add(missing);
                    table.Cell(index, 1).Range.Text = item.id_orderitem.ToString();
                    table.Cell(index, 2).Range.Text = item.Products.ProductName;
                    table.Cell(index, 3).Range.Text = item.ProductCount.ToString();
                   
                    index++;
                }
                
                System.Windows.Forms.SaveFileDialog saveFileDialog1 = new System.Windows.Forms.SaveFileDialog();

                saveFileDialog1.Filter = "Word document|*.doc";

                saveFileDialog1.RestoreDirectory = true;

                if (saveFileDialog1.ShowDialog() == DialogResult.OK)
                {
                    Object newFileName = saveFileDialog1.FileName;
                    app.ActiveDocument.SaveAs2(newFileName);
                    app.ActiveDocument.Close();
                    return true;
                }

            }

            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                if (app != null)
                {
                    app.Quit();
                }
            }
            return false;

        }
    }
}
