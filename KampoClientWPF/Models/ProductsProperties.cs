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
    
    public partial class ProductsProperties
    {
        public int id_productproperties { get; set; }
        public Nullable<int> property_id { get; set; }
        public string ValueProperty { get; set; }
        public Nullable<int> product_id { get; set; }
    
        public virtual Products Products { get; set; }
        public virtual Properties Properties { get; set; }
    }
}
