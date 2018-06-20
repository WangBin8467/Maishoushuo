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
    public class SqlServerBuyer : IBuyer
    {
        //接口中成员是隐式公用的 默认pubic 与类中相反

        //注册买手信息
        public int Insert(Buyers us)
        {
            string sql = "insert into Users(Buyers_name,Buyers_sex,Buyers_phone,Buyers_pwd,Buyers_mail,Buyers_area)values(@Buyers_name,@Buyers_sex,@Buyers_phone,@Buyers_pwd,@Buyers_mail,@Buyers_area) ";
            SqlParameter[] sp = new SqlParameter[]{
                new SqlParameter("@Buyers_name",us.Buyers_name),
                new SqlParameter("@Buyers_sex",us.Buyers_sex),
                new SqlParameter("@Buyers_phone",us.Buyers_phone),
                new SqlParameter("@Buyers_pwd",us.Buyers_pwd),
                new SqlParameter("@Buyers_mail",us.Buyers_mail),
                new SqlParameter("@Buyers_area",us.Buyers_area)
            };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }


        //买手登陆
        public SqlDataReader Login(string name, string pwd)
        {
            string sql = "select * from Buyers where Buyers_name=@Buyers_name and Buyers_pwd=@Buyers_pwd";
            SqlParameter[] sp = new SqlParameter[]{
                new SqlParameter("@Buyers_name",name),
                new SqlParameter("@Buyers_pwd",pwd)
        };
            return DBHelper.GetDataReader(sql, sp);
        }

        //修改更新买手资料
        public int Update(Buyers us)
        {
            string sql = "update  Buyers set Buyers_name=@Buyers_name,Buyers_sex=@Buyers_sex,Buyers_phone=@Buyers_phone,Buyers_pwd=@Buyers_pwd,Buyers_mail=@Buyers_mail,Buyers_area=@Buyers_area";
            SqlParameter[] sp = new SqlParameter[]{
                new SqlParameter("@Buyers_name",us.Buyers_name),
                new SqlParameter("@Buyers_sex",us.Buyers_sex),
                new SqlParameter("@Buyers_phone",us.Buyers_phone),
                new SqlParameter("@Buyers_pwd",us.Buyers_pwd),
                new SqlParameter("@Buyers_mail",us.Buyers_mail),
                new SqlParameter("@Buyers_area",us.Buyers_area)
            };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }



        //管理员删除买手信息
        public int Delete(Buyers us)
        {
            string sql = "delete into Buyers values(@Buyers_id)";
            SqlParameter[] sp = new SqlParameter[]{
             new SqlParameter("@Buyers_id",us.Buyers_id)
            };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }

        //查询所有买手信息      
        public DataTable SelectAll()
        {
            string sql = "select * from Buyers  order by Buyers_id asc";
            return DBHelper.GetFillData(sql);
        }

    }
}
