using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace KampoAPI.Models
{
    public partial class Product
    {

     

        [Key]
        public int id_product { get; set; }
        public string ProductName { get; set; }
        public string ProductDescription { get; set; }
        public Nullable<int> CountProduct { get; set; }
        [ForeignKey("ProductCategory")]
        public int productscategory_id { get; set; }
        public ProductCategory ProductCategory { get; set; }
        public ICollection<ProductProperties> ProductProperties { get; set; }
    }
}
