using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Models
{
    public class Product
    {
        public int Pro_id { get; set; }
        public int Buyer_id { get; set; }
        public string Pro_img { get; set; }

        public decimal Pro_price { get; set; }
        public string Pro_name { get; set; }
        public int Pro_num { get; set; }
        public string Pro_main { get; set; }
    }
}
