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
    
    public partial class OrdersItem
    {
        public int id_orderitem { get; set; }
        public Nullable<int> product_id { get; set; }
        public Nullable<int> ProductCount { get; set; }
        public Nullable<int> order_id { get; set; }
    
        public virtual Orders Orders { get; set; }
        public virtual Products Products { get; set; }
    }
}