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
    public class UsersService
    {
        private static IUsers iusers = DataAccess.CreateUsers();

        //注册用户信息
        public static int Insert(Users us)
        {
            return iusers.Insert(us);
        }

        //用户登录
        public static SqlDataReader Login(string name, string pwd)
        {
            return iusers.Login(name, pwd);
        }

        //更新用户信息
        public static int Update(Users us)
        {
            return iusers.Update(us);
        }

        //删除用户信息
        public static int Delete(Users us)
        {
            return iusers.Delete(us);
        }

        //搜索是否已经有相同用户名
        public static SqlDataReader SelectUsers_name(string Users_name)
        {
            return iusers.SelectUsers_name(Users_name);
        }


    }
    
}
