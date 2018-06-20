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
    public class AdmiService
    {
        private static IAdmi iadmi = DataAccess.CreateAdmi();

        //管理员登陆
        public SqlDataReader Login(string Admi_name, string Admi_pwd)
        {
            return iadmi.Login(Admi_name, Admi_pwd);
        }
    }
}
