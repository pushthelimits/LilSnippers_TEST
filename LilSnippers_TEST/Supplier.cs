//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LilSnippers_TEST
{
    using System;
    using System.Collections.Generic;
    
    public partial class Supplier
    {
        public Supplier()
        {
            this.Products = new HashSet<Product>();
        }
    
        public int SupplierID { get; set; }
        public string BusinessName { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public Nullable<int> StateID { get; set; }
        public string Zip { get; set; }
        public Nullable<int> CountryID { get; set; }
        public string Website { get; set; }
        public string Phone { get; set; }
        public string Fax { get; set; }
        public string Email { get; set; }
    
        public virtual Country Country { get; set; }
        public virtual ICollection<Product> Products { get; set; }
        public virtual State State { get; set; }
    }
}