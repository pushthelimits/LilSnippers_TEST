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
    
    public partial class HearAbout
    {
        public HearAbout()
        {
            this.HomeAddresses = new HashSet<HomeAddress>();
        }
    
        public int HearAboutID { get; set; }
        public string HearAbout1 { get; set; }
    
        public virtual ICollection<HomeAddress> HomeAddresses { get; set; }
    }
}
