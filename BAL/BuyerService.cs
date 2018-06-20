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
    public class BuyerService
    {
        private static IBuyer ibuyer = DataAccess.CreateBuyer();

        //注册买手信息
        public static int Insert(Buyers us)
        {
            return ibuyer.Insert(us);
        }

        //买手登陆
        public static SqlDataReader Login(string name, string pwd)
        {
            return ibuyer.Login(name, pwd);
        }

        //修改更新买手资料
        public static int Update(Buyers us)
        {
            return ibuyer.Update(us);
        }

        //管理员删除买手信息
        public static int Delete(Buyers us)
        {
            return ibuyer.Delete(us);
        }


        //查询所有买手信息      
        public static DataTable SelectAll()
        {
             return ibuyer.SelectAll();
        }
    }
}
