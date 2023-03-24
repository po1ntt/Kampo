using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace KampoAPI.Models
{
    public partial class ProductProperties
    {
        [Key]
        public int id_productproperties { get; set; }
        public Nullable<int> property_id { get; set; }
        public string ValueProperty { get; set; }
        public Nullable<int> product_id { get; set; }


    }
}
