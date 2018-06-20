using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Models;
using System.Data;

namespace IDAL
{
   public interface ISales_item
    {
        //查看订单详情
        DataTable SelectOrder(string Users_id);
    }
}
