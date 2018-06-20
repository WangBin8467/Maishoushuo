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


namespace WebSite
{
    public partial class ShopCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)//判断是否为登录状态
            {
                BindAllTotal();
                BindShoppingCart();
                
            }
            //判断购物车是否有商品 若有 则Panl01 ；否 则 Panl02
            int ID = Convert.ToInt32(Session["Users_id"]);
            DataTable ys = ProductService.SelectUserMallCart(ID);
            if (ys != null && ys.Rows.Count != 0)
            {
                Panel01.Visible = true;
                Panel02.Visible = false;
            }
            else
            {
                Panel01.Visible = false;
                Panel02.Visible = true;
            }
            BindUserMallCart();
            //BindDelete();
        }
       

        //显示右上角购物车模块
        protected int BindUserMallCart()
        {
            int UserMallCartNum;
            if (Session["Users_id"] != null)
            {
                int userID = Convert.ToInt32(Session["Users_id"]);
                DataTable VSS = ProductService.SelectUserMallCart(userID);
                if (VSS != null && VSS.Rows.Count > 0)
                {
                    return UserMallCartNum = VSS.Rows.Count;
                }
                else
                {
                    return UserMallCartNum = 0;
                }
            }
            else
            {
                return UserMallCartNum = 0;
            }
        }

        //结算购物车所有商品
        protected void BindAllTotal()
        {
            int UserID = Convert.ToInt32(Session["Users_id"]);
            DataTable dt = ProductService.SelectAllTotalAmount(UserID);
            if (dt != null && dt.Rows.Count != 0)
            {
                trShoppingCartBuy.DataSource = dt;
                trShoppingCartBuy.DataBind();
            }
            string a = dt.Rows[0][0].ToString();
        }

       // 删除购物车内已经购买的商品
        //protected void BindDelete()
        //{
        //    int UserID = Convert.ToInt32(Session["Users_id"]);
        //    DataTable dt = ProductService.DeleteShopCart(UserID);
        //    if (dt != null && dt.Rows.Count != 0)
        //    {
        //        trShoppingCartBuy.DataSource = dt;
        //        trShoppingCartBuy.DataBind();
        //    }
        //}

        //显示订单栏每个订单
        protected void BindShoppingCart()
        {
            int UserID = Convert.ToInt32(Session["Users_id"]);
            DataTable dt = ProductService.SelectShoppingCart(UserID);
            if (dt != null && dt.Rows.Count != 0)
            {
                rtShoppingCart.DataSource = dt;
                rtShoppingCart.DataBind();
            }
        }


        //商品数量操作
        protected void rtShoppingCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Label lbl = (Label)e.Item.FindControl("LabelShoppingCartID");//""里放入控件ID
            Label lblprice = (Label)e.Item.FindControl("lblPrice");
            TextBox textbox = (TextBox)e.Item.FindControl("sqlMallNumber");
            string Eventname = e.CommandName;
            switch (Eventname)
            {
                case "Delete":
                    {
                        int ID = Convert.ToInt32(lbl.Text);
                        int result = ProductService.DeleteShoppingCart(ID);
                        if (result >= 1)
                        {
                            int ID02 = Convert.ToInt32(Session["Users_id"]);
                            DataTable ys = ProductService.SelectUserMallCart(ID02);
                            if (ys != null && ys.Rows.Count != 0)
                            {
                                Panel01.Visible = true;
                                Panel02.Visible = false;
                            }
                            else
                            {
                                Panel01.Visible = false;
                                Panel02.Visible = true;
                            }
                            int ID03 = Convert.ToInt32(Session["Users_id"]);
                            DataTable dt = ProductService.SelectAllTotalAmount(ID03);
                            if (dt != null && dt.Rows.Count != 0)
                            {
                                trShoppingCartBuy.DataSource = dt;
                                trShoppingCartBuy.DataBind();
                            }                          
                            int UserID = Convert.ToInt32(Session["Users_id"]);
                            DataTable dt02 = ProductService.SelectShoppingCart(UserID);

                            if (dt02 != null && dt02.Rows.Count != 0)
                            {
                                rtShoppingCart.DataSource = dt02;
                                rtShoppingCart.DataBind();
                            }
                        }
                    }
                    break;
                case "ChageNum":
                    {
                        try
                        {
                            int a = Convert.ToInt32(textbox.Text); //文本框里输入的数量                          
                            if (a <= 0) { a = 1; } //文本框里数量要>0
                            int ID = Convert.ToInt32(lbl.Text);
                            float MallPrice = float.Parse(lblprice.Text);
                            int Qty = a;
                            float total = MallPrice * Qty;
                            int result = ProductService.UpdateShoppingCartNum(ID, Qty, total);
                            if (result >= 1)
                            {
                                int ID04 = Convert.ToInt32(Session["Users_id"]);
                                DataTable dt = ProductService.SelectAllTotalAmount(ID04);
                                if (dt != null && dt.Rows.Count != 0)
                                {
                                    trShoppingCartBuy.DataSource = dt;
                                    trShoppingCartBuy.DataBind();
                                }
                                int UserID = Convert.ToInt32(Session["Users_id"]);
                                DataTable dt02 = ProductService.SelectShoppingCart(UserID);
                                if (dt02 != null && dt02.Rows.Count != 0)
                                {
                                    rtShoppingCart.DataSource = dt02;
                                    rtShoppingCart.DataBind();
                                }
                            }
                        }
                        catch
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "true", "<script>alert('只能输入正整数');</script>");
                        }
                    }
                    break;
            }
        }
        protected void trShoppingCartBuy_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
           
            string Eventname = e.CommandName;
            switch (Eventname)
            {
                case "BuyBuy":
                    {
                        try
                        {
                            Label FinalTotalAmount = (Label)e.Item.FindControl("FinalTotalAmount");
                            int ID = Convert.ToInt32(Session["Users_id"]);
                            Sales sales = new Sales();
                            sales.Users_id = ID;
                            sales.Total_price = Convert.ToDecimal((FinalTotalAmount.Text.Trim()));
                            sales.Sales_time = DateTime.Now.ToLocalTime();
                            int result = ProductService.InsertOrder(sales);
                            //BindDelete();
                            if (result >= 1)
                            {
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "true", "<script>alert('下单成功');location='Product.aspx';</script>");

                                BindAllTotal();
                                BindShoppingCart();
                                DataTable ys = ProductService.SelectUserMallCart(ID);
                                if (ys != null && ys.Rows.Count != 0)
                                {
                                    Panel01.Visible = true;
                                    Panel02.Visible = false;
                                }
                                else
                                {
                                    Panel01.Visible = false;
                                    Panel02.Visible = true;
                                }
                             }
                          }
                          catch(Exception ex)
                          {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "true", "<script>alert('购物车里什么也没有');</script>");
                          }
                    }
                    break;
            }
        }
    }
}