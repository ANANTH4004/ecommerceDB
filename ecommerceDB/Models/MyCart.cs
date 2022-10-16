using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ecommerceDB.Models
{
    public class MyCart
    {
        public int productid { get; set; }
        public string productname { get; set; }

        public double price { get; set; }
        public int qty { get; set; }
        public double bill { get; set; }
    }
}