using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using BLL;
using Models;

namespace Website
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["Pro_id"] = Convert.ToInt32(Request.QueryString["id"]);
                ViewState["ShoppingCartNumber"] = 1;
                BindProduct2();
            }
            BindUserMallCart();
            MallPhoto();
        }
      
        /*商品详情*/
        private void BindProduct2()
        {
            int id = Convert.ToInt32(ViewState["Pro_id"]);
            DataTable dt = ProductService.SelectID(id);          
            if (dt != null && dt.Rows.Count != 0)
            {
                LVPD2.DataSource = dt;
                LVPD2.DataBind();

                ViewState["Pro_price"]=dt.Rows[0]["Pro_price"].ToString();
            }
        }

        protected int BindUserMallCart()
        {
            int UserMallCartNum;
            if (Session["Users_id"] != null)
            {
                int Users_id = Convert.ToInt32(Session["Users_id"]);
                DataTable VSS = ProductService.SelectUserMallCart(Users_id);
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

        protected void MallPhoto()
        {
            int id = Convert.ToInt32(ViewState["Pro_id"]);
            DataTable dt = ProductService.SelectID(id);
            if (dt != null && dt.Rows.Count != 0)
            {
                LVPD2.DataSource = dt;
                LVPD2.DataBind();
                ViewState["Qty"] = dt.Rows[0]["Qty"].ToString();
            }
        }

        protected void ShoppingProduct(object sender, ListViewCommandEventArgs e)
        {
            string Eventname = e.CommandName; //三个按钮 OnClick名
            switch (Eventname)
            {
                case "Minus":
                    {
                        int i = Convert.ToInt32(ViewState["ShoppingCartNumber"]);
                        if (i > 0)
                        {
                            i--;
                            ViewState["ShoppingCartNumber"] = i;
                            MallPhoto();
                        }
                    }
                    break;
                case "Add":
                    {
                        int i = Convert.ToInt32(ViewState["ShoppingCartNumber"]);                     
                            i++;
                            ViewState["ShoppingCartNumber"] = i;
                        MallPhoto();
                    }
                    break;
                case "AddShoppingCart":
                    {
                            if (Session["Users_name"] != null)//判断用户是否登录
                            {
                                int Qty = Convert.ToInt32(ViewState["ShoppingCartNumber"]);
                                decimal Pro_price = Convert.ToDecimal(ViewState["Pro_price"]);
                                if (Qty > 0) //判断购买商品数量是否>0
                                {
                                    int Users_id = Convert.ToInt32(Session["Users_id"]);
                                    int Pro_id = Convert.ToInt32(ViewState["Pro_id"]);
                                    DataTable goods = ProductService.JudgeMallYorN(Users_id, Pro_id);
                                    if (goods != null && goods.Rows.Count != 0) //判断购物车是否被创建
                                    {
                                        //若购物车已经创建 里面有商品 则更新购物车
                                        decimal Sales_tprice = Pro_price * Qty;
                                        int Result = ProductService.UpdateShoppingCart(Users_id, Pro_id, Qty, Sales_tprice);
                                        if (Result >= 1)
                                        {
                                            Page.ClientScript.RegisterStartupScript(this.GetType(), "true", "<script>alert('加入购物车成功！');</script>");
                                            BindUserMallCart();
                                        }
                                    }
                                else //若没有 则新建购物车
                                {
                                    ShopCart mallitemcart = new ShopCart();
                                    mallitemcart.Users_id = Convert.ToInt32(Session["Users_id"]);
                                    mallitemcart.Pro_id = Convert.ToInt32(ViewState["Pro_id"]);
                                    mallitemcart.Pro_price = Convert.ToDecimal(ViewState["Pro_price"]);
                                    mallitemcart.Qty = Convert.ToInt32(ViewState["ShoppingCartNumber"]);
                                    mallitemcart.Sales_tprice = (Convert.ToDecimal(ViewState["Pro_price"])) * (Convert.ToInt32(ViewState["ShoppingCartNumber"]));
                                    int result = ProductService.InsertShoppingCart(mallitemcart);
                                    if (result >= 1)
                                    {
                                        Page.ClientScript.RegisterStartupScript(this.GetType(), "true", "<script>alert('加入购物车成功！');</script>");
                                        BindUserMallCart();
                                    }
                                }
                                }
                                else
                                {
                                    Page.ClientScript.RegisterStartupScript(this.GetType(), "true", "<script>alert('请确定购买数量');</script>");
                                }
                            }
                            else
                            {
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "true", "<script>alert('请先登录');</script>");
                            }
                        }                                         
                    break;
            }
        }

        protected void LVPD2_PreRender(object sender, EventArgs e)
        {
            LVPD2.DataBind();
        }
    }
}