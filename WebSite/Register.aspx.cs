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
using DAL;

namespace Website
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btn01_Click(object sender, EventArgs e)
        {
            if (lblCheck.Text == "该用户名已被注册！")
            {
                ClientScript.RegisterStartupScript(typeof(Object), "alert", "<script>alert('用户名已被注册！');</script>");
                txtName.Focus();
            }
            else
            {
                string sql = "select * from Users where Users_name=@Users_name";
                SqlParameter[] para = new SqlParameter[]
                {
                new SqlParameter("@Users_name",txtName.Text.Trim())
                };
                SqlDataReader dr = DBHelper.GetDataReader(sql, para);
                if (dr.Read())
                {
                    ClientScript.RegisterStartupScript(typeof(Object), "alert", "<script>alert('用户名已被注册！');</script>");
                }
                else
                {
                    if (IsValid)
                    {
                        try
                        {
                            //if (txtCheckCode.Text.Trim() == ViewState["CheckCode"].ToString())
                            //{
                                Users us = new Users();
                                us.Users_name = txtName.Text.Trim();
                                us.Users_pwd = txtPassword.Text.Trim();
                                us.Users_phone = txtphone.Text.Trim();
                                int i = UsersService.Insert(us);
                            if (i >= 1)
                                {
                                    Page.ClientScript.RegisterStartupScript(this.GetType(), "true", "<script>alert('注册成功！');location='Login.aspx'</script>");
                            }
                           

                        }
                        catch (Exception ex)
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "true", "<script>alert('注册失败！失败原因如下：" + ex.Message + "');</script>");
                        }
                    }
                }
            }
        }


        //搜索是否已经有相同用户名
        protected void txtName_TextChanged(object sender, EventArgs e)
        {
            SqlDataReader sdr = UsersService.SelectUsers_name(txtName.Text.Trim());
            if (sdr.HasRows)
            {
                lblCheck.ForeColor = System.Drawing.Color.Red;
                lblCheck.Text = "该用户名已被注册！";
            }
            else
            {
                lblCheck.ForeColor = System.Drawing.Color.Green;
                lblCheck.Text = "恭喜，该用户名可以注册！";
            }
        }      

      
    }
}