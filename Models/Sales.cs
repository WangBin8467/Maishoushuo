using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Models
{
    public  class Sales
    {
        public int Sales_id { get; set; }
        public DateTime Sales_time { get; set; }
        public decimal Total_price { get; set; }
        public string Users_addr { get; set; }
        public int Pro_id { get; set; }
        public int Users_id { get; set; }
    }
}
