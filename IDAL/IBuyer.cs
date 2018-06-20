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
    public interface IBuyer
    {
        //注册买手信息
        int Insert(Buyers us);

        //买手登陆
        SqlDataReader Login(string Buyers_name,string Buyers_pwd);

        //修改更新买手资料
        int Update(Buyers us);

        //管理员删除买手信息
        int Delete(Buyers us);

        //查询所有买手信息      
        DataTable SelectAll();



    }
}
