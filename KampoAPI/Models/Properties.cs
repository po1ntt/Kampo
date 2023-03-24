using System.ComponentModel.DataAnnotations;

namespace KampoAPI.Models
{
    public partial class Properties
    {

     
        [Key]
        public int id_propertries { get; set; }
        public string NameProperty { get; set; }

        public virtual ICollection<ProductProperties> ProductsProperties { get; set; }
    }
}
