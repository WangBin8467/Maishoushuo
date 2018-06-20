using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Models;
using System.Data;

namespace IDAL
{
   public interface ISales
    {
        //添加新订单
        DataTable Insert_Orders(string Users_id, DateTime Sales_time, decimal Sales_tprice, int Sales_id);

        //查看订单
        DataTable SelectAll();

    }
}
