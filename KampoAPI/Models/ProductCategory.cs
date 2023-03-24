using System.ComponentModel.DataAnnotations;

namespace KampoAPI.Models
{
    public partial class ProductCategory
    {


        
        [Key]
        public int id_productcategory { get; set; }
        public string CategoryName { get; set; }


    }
}
