//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ecommerceDB.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order
    {
        public int Id { get; set; }
        public string LoginDetail_userId1 { get; set; }
        public Nullable<int> LoginDetail_id { get; set; }
        public double amount { get; set; }
    
        public virtual LoginDetail LoginDetail { get; set; }
    }
}
