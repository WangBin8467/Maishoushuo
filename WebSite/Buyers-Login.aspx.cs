﻿using System;
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
    public partial class Buyers_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string name = txt.Text.Trim();
            string paw = pwd.Text.Trim();
            try
            {
                SqlDataReader dr = BuyerService.Login(name, paw);
                if (dr.Read())
                {
                    Session["Buyers_name"] = txt.Text;
                    Session["Buyers_id"] = dr["Buyers_id"].ToString();
                    Response.Redirect("index.aspx");
                }
                else
                {
                    //MessageBox.Show("用户名或者密码错误 ");
                    pwd.Text = "";
                    pwd.Focus();
                }
            }

            catch (Exception ex)
            {
                Response.Write("错误原因：" + ex);
            }
        }
    }
}