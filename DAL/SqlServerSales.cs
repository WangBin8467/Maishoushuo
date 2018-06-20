using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IDAL;
using System.Data.SqlClient;
using System.Data;


namespace DAL
{
   public class SqlServerSales: ISales
    {
        //添加新订单
        public DataTable Insert_Orders(string Users_id, DateTime Sales_time, decimal Sales_tprice, int Sales_id)
        {
            SqlParameter[] sql = {
                new SqlParameter("@Users_id", Users_id),
                new SqlParameter("@Sales_time", Sales_time),
                new SqlParameter("@Sales_tprice", Sales_tprice),
                new SqlParameter ("@Sales_id",Sales_id)
            };
            return DBHelper.GetFillData("Insert_Orders", System.Data.CommandType.StoredProcedure, sql);
        }

        //查看订单
        public DataTable SelectAll()
        {
            string sql = "select  * from Sales";
            return DBHelper.GetFillData(sql);
        }
    }
}
