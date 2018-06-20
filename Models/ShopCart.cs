using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Models
{
    public class ShopCart
    {
        public int ShopCart_id { get; set; }
        public int Users_id { get; set; }
        public int Pro_id { get; set; }

        public int Qty { get; set; }
        public decimal Pro_price { get; set; }

        public int Flag { get; set; }
        public decimal Sales_tprice { get; set; }
    }
}

