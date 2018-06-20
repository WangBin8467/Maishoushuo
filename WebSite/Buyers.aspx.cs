using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Models;
using BLL;

namespace WebSite
{
    public partial class Buyers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProduct1();
            }
        }

        private void BindProduct1()
        {
            DataTable dt = BuyerService.SelectAll();
            if (dt != null && dt.Rows.Count != 0)
            {
                ListView1.DataSource = dt;
                ListView1.DataBind();
            }
        }
    }
}