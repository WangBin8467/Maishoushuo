using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Models;
using IDAL;
using System.Data.SqlClient;
using System.Data;



namespace DAL
{
   public class SqlServerSales_item:ISales_item
    {
      public  DataTable SelectOrder(string Users_id)
        {
            string sql = "select  * from Sales_item ";
            SqlParameter[] sp = new SqlParameter[]{
                new SqlParameter("@Users_id",Users_id)
            };
            return DBHelper.GetFillData(sql, sp);
        
        }
    }
}
