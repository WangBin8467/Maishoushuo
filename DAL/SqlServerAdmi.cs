using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IDAL;
using Models;
using System.Data.SqlClient;
using System.Data;


namespace DAL
{
  public class SqlServerAdmi : IAdmi
    {
        //管理员登陆
     public  SqlDataReader Login(string Admi_name, string Admi_pwd)
        {
            string sql = "select * from Admi where Admi_name=@Admi_name and Admi_pwd=@Admi_pwd";
            SqlParameter[] sp = new SqlParameter[]{
                new SqlParameter("@Admi_name",Admi_name),
                new SqlParameter("@Admi_pwd", Admi_pwd),
        };
            return DBHelper.GetDataReader(sql, sp);
        }
    }
}
