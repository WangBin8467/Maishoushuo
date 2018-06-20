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
    public class SalesService
    {
        private static ISales uncomment = DataAccess.CreateSales();

        //添加新订单
        public DataTable Insert_Orders(string Users_id, DateTime Sales_time, decimal Sales_tprice, int Sales_id)
        {
            return uncomment.Insert_Orders(Users_id, Sales_time, Sales_tprice, Sales_id);

        }

        //查看订单
        public DataTable SelectAll()
        {
            return uncomment.SelectAll();
        }

    }
}
