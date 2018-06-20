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

namespace Website

{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Users_name"] != null)
                {
                    PanelUserInfo1.Visible = true;
                    PanelUserInfo2.Visible = false;
                    PanelLogin.Visible = false;
                    lblUserInfo.Text = Session["Users_name"].ToString();
                }
                else if (Session["Buyers_name"] != null)
                {
                    PanelUserInfo1.Visible = false;
                    PanelUserInfo2.Visible = true;
                    PanelLogin.Visible = false;
                    LabelBuyerInfo.Text = Session["Buyers_name"].ToString();
                }
                else
                {
                    PanelLogin.Visible = true;
                    PanelUserInfo1.Visible = false;
                    PanelUserInfo2.Visible = false;


                }
                BindProduct1();
                BindProduct2();
                BindProduct3();
                BindProduct4();
                BindProduct5();
                BindProduct6();
                BindProduct7();
                BindProduct8();
                BindProduct9();
            }
        }

        //注销
        protected void lbtnLoginOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Index.aspx");
        }

        private void BindProduct1()
        {
            DataTable dt = ProductService.SelectManLeft();

            if (dt != null && dt.Rows.Count != 0)
            {
                ListView1.DataSource = dt;
                ListView1.DataBind();
            }
        }

        private void BindProduct2()
        {
            DataTable dt = ProductService.SelectManCenter();

            if (dt != null && dt.Rows.Count != 0)
            {
                ListView2.DataSource = dt;
                ListView2.DataBind();
            }
        }

        private void BindProduct3()
        {
            DataTable dt = ProductService.SelectManRight();

            if (dt != null && dt.Rows.Count != 0)
            {
                ListView3.DataSource = dt;
                ListView3.DataBind();
            }
        }

        private void BindProduct4()
        {
            DataTable dt = ProductService.SelectWoManLeft();

            if (dt != null && dt.Rows.Count != 0)
            {
                ListView4.DataSource = dt;
                ListView4.DataBind();
            }
        }

        private void BindProduct5()
        {
            DataTable dt = ProductService.SelectWoManCenter();

            if (dt != null && dt.Rows.Count != 0)
            {
                ListView5.DataSource = dt;
                ListView5.DataBind();
            }
        }

        private void BindProduct6()
        {
            DataTable dt = ProductService.SelectWoManRight();

            if (dt != null && dt.Rows.Count != 0)
            {
                ListView6.DataSource = dt;
                ListView6.DataBind();
            }
        }

        private void BindProduct7()
        {
            DataTable dt = ProductService.SelectSLeft();

            if (dt != null && dt.Rows.Count != 0)
            {
                ListView7.DataSource = dt;
                ListView7.DataBind();
            }
        }

        private void BindProduct8()
        {
            DataTable dt = ProductService.SelectSCenter();

            if (dt != null && dt.Rows.Count != 0)
            {
                ListView8.DataSource = dt;
                ListView8.DataBind();
            }
        }

        private void BindProduct9()
        {
            DataTable dt = ProductService.SelectSRight();

            if (dt != null && dt.Rows.Count != 0)
            {
                ListView9.DataSource = dt;
                ListView9.DataBind();
            }
        }

        //搜索商品功能
        protected void ProductSeacrch(object sender, EventArgs e)
        {
            string keys = SearchText.Text.Trim();
            Response.Redirect("Product.aspx?Keys=" + keys);
        }
    }
}