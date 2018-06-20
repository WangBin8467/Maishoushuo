using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Models;
using IDAL;
using DALFactory;

namespace BLL
{
    public class Sales_itemService
    {
        private static ISales_item isales_item= DataAccess.CreateSales_item();

        //查询订单
        public static DataTable SelectOrder(string Users_id)
        {
            return isales_item.SelectOrder(Users_id);
        }
    }
}
