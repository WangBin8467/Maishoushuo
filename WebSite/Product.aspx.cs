using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
//using System.Windows.Forms;
using System.Data;
using Models;
using BLL;

namespace Website
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //考虑到模板页107行重定向问题 应先判断Keys是否为空再判断页面是否首次加载
            ViewState["Keys"] = Convert.ToString(Request.QueryString["Keys"]);
            if(ViewState["Keys"] != null)
            {
                ProductSeacrch();
            }
            else if (!IsPostBack)
            {                           
                    BindProduct1();                                             
            }
            else
            {
                BindProduct();
            }
               
            
            

        }

        //按条件分组商品
        private void BindProduct()
        {
            string A = Convert.ToString(ViewState["A"]);
            DataTable dt = ProductService.SelectProduct(A);
            if (dt != null && dt.Rows.Count != 0)
            {
                LVPro1.DataSource = dt;
                LVPro1.DataBind();
            }
        }

        //展示所有商品
        private void BindProduct1()
         {
             DataTable dt = ProductService.SelectAll();
            if (dt != null && dt.Rows.Count != 0)
            {
                LVPro1.DataSource = dt;
                LVPro1.DataBind();
            }
        }

        //搜索商品功能
        private void ProductSeacrch()
        {
            string keys = Convert.ToString(ViewState["Keys"]);
            DataTable dt = ProductService.SelectKeys(keys);
            if (dt != null && dt.Rows.Count != 0)
            {
                LVPro1.DataSource = dt;
                LVPro1.DataBind();
            }
            else
            {
                //MessageBox.Show("未找到符合要求商品！ ");
            }
        }

        


        protected void DataPager1_PreRender(object sender, EventArgs e)
        {
            LVPro1.DataBind();
        }

        protected void Man_OnClick(object sender, EventArgs e)
        {
            ViewState["A"] = "where  Pro_name like '%男%' and Pro_id>5000";
            BindProduct();
        }

        protected void Woman_OnClick(object sender, EventArgs e)
        {
            ViewState["A"] = "where  Pro_name like '%女%' and Pro_id>5000";
            BindProduct();
        }

        protected void PriceUp_OnClick(object sender, EventArgs e)
        {
            ViewState["A"] = "where Pro_id>5000 order by Pro_price asc";
            BindProduct();
        }

        protected void PriceDown_OnClick(object sender, EventArgs e)
        {
            ViewState["A"] = "where Pro_id>5000 order by Pro_price desc";
            BindProduct();
        }

        protected void All_OnClick(object sender, EventArgs e)
        {
            ViewState["A"] = "where Pro_id>5000  ";
            BindProduct();
        }

       

    }
}