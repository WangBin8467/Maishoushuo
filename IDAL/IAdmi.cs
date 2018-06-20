using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Models;
using System.Data;
using System.Data.SqlClient;


namespace IDAL
{
   public interface IAdmi
    {

        //管理员登陆
        SqlDataReader Login(string Admi_name, string Admi_pwd);

    }
}
