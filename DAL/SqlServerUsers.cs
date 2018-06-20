using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IDAL;
using Models;
using DALFactory;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class SqlServerUsers : IUsers
    {
        //注册用户信息
        public int Insert(Users us)
        {
            string sql = "insert into Users(Users_name,Users_phone,Users_pwd)values(@Users_name,@Users_phone,@Users_pwd) ";
            SqlParameter[] sp = new SqlParameter[]{
                new SqlParameter("@Users_name",us.Users_name),
                new SqlParameter("@Users_phone",us.Users_phone),
                new SqlParameter("@Users_pwd",us.Users_pwd),
            };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }

        //用户登录
        public SqlDataReader Login(string name, string pwd)
        {
            string sql = "select * from Users where Users_name=@Users_name and Users_pwd=@Users_pwd";
            SqlParameter[] sp = new SqlParameter[]{
                new SqlParameter("@Users_name",name),
                new SqlParameter("@Users_pwd",pwd)
        };
            return DBHelper.GetDataReader(sql, sp);
        }
        //更新用户信息
        public int Update(Users us)
        {
            string sql = "update  Users set Users_name=@Users_name,Users_sex=@Users_sex,Users_phone=@Users_phone,Users_pwd=@Users_pwd,Users_mail=@Users_mail,Users_addr=@Users_addr";
            SqlParameter[] sp = new SqlParameter[]{
                new SqlParameter("@Users_name",us.Users_name),
                new SqlParameter("@Users_sex",us.Users_sex),
                new SqlParameter("@Users_phone",us.Users_phone),
                new SqlParameter("@Users_pwd",us.Users_pwd),
                new SqlParameter("@Users_mail",us.Users_mail),
                new SqlParameter("@Users_addr",us.Users_addr)
            };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }

        //删除用户信息
        public int Delete(Users us)
        {
            string sql = "delete into Users values(@users_id)";
            SqlParameter[] sp = new SqlParameter[]{
             new SqlParameter("@users_id",us.Users_id)
            };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }
    

        //搜索是否已经有相同用户名
        public SqlDataReader SelectUsers_name(string Users_name)
    {
        string sql = "select * from Users where Users_name=@Users_name";  
        SqlParameter[] para = 
                {
                new SqlParameter("@Users_name", Users_name)
                };
        return DBHelper.GetDataReader(sql, para);
    }

     }
}



