//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace KampoClientWPF.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Products
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Products()
        {
            this.ProductsProperties = new HashSet<ProductsProperties>();
        }
    
        public int id_product { get; set; }
        public string ProductName { get; set; }
        public int productscategory_id { get; set; }
        public string ProductDescription { get; set; }
        public Nullable<int> CountProduct { get; set; }
    
        public virtual ProductsCategory ProductsCategory { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductsProperties> ProductsProperties { get; set; }
    }
}
