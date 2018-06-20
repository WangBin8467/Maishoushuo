using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Models;
using System.Data.SqlClient;
using System.Data;

namespace IDAL
{
        //接口中成员是隐式公用的 默认pubic 与类中相反
        public interface IUsers
        {
            //注册用户信息
            int Insert(Users us);

            //用户登陆
            SqlDataReader Login(string Users_name, string Users_pwd);

            //修改更新用户资料
            int Update(Users us);

            //管理员删除用户信息
            int Delete(Users us);

            //搜索是否已经有相同用户名
            SqlDataReader SelectUsers_name(string Users_name);

        }
    }

