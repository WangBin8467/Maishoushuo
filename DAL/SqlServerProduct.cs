using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IDAL;
using Models;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class SqlServerProduct : IProduct
    {
        //添加商品
        public int Insert(Product us)
        {
            string sql = "insert into Product (Pro_name,Pro_img,Pro_main,Pro_price,Pro_num,Buyer_id) values(@Pro_name,@Pro_img,@Pro_main,@Pro_price,@Pro_num,@Buyer_id)";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@Pro_name",us.Pro_name),
                new SqlParameter("@Pro_img",us.Pro_img),
                new SqlParameter("@Pro_main",us.Pro_main),
                new SqlParameter("@Pro_price",us.Pro_price),
                new SqlParameter("@Pro_num",us.Pro_num),
                new SqlParameter("@Buyer_id",us.Buyer_id),
            };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }

        //修改商品信息
        public int Upadte(Product us)
        {
            string sql = "Update Product set Pro_name=@Pro_name,Pro_img=@Pro_img,Pro_price=@Pro_price,Pro_main=@Pro_main,Pro_num=@Pro_main where Pro_id=@Pro_id";
            SqlParameter[] sp = new SqlParameter[]
            {
             new SqlParameter("@Pro_name",us.Pro_name),
             new SqlParameter("@Pro_main",us.Pro_main),
             new SqlParameter("@Pro_img",us.Pro_img),
             new SqlParameter("@Pro_price",us.Pro_price),
             new SqlParameter("@Pro_main",us.Pro_main),
             };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }

        //删除商品
        public int Delete(int Pro_id)
        {
            string sql = "delete from Product where Pro_id='" + Pro_id + "'";
            return DBHelper.GetExcuteNonQuery(sql);
        }

        //查询所有商品       
        public DataTable SelectAll()
        {
            string sql = "select * from Product where Pro_id>5000 order by Pro_id asc";
            return DBHelper.GetFillData(sql);
        }

        //根据商品ID搜索
        public DataTable SelectID(int id)
        {
            string sql = "select * From Product,Buyers where Product.Pro_id>5000 and Product.Buyers_id=Buyers.Buyers_id and Product.Pro_id =" + id ;
            return DBHelper.GetFillData(sql);
        }

       


        //查询前六商品       
        public DataTable SelectTop2()
        {
            string sql = "select top 2 * from Product order by Pro_id asc";
            return DBHelper.GetFillData(sql);
        }

        //查询首页男仕板块左侧商品栏
        public DataTable SelectManLeft()
        {
            string sql = "select  * from Product  where Pro_id>2000 and Pro_id<2003 order by Pro_id asc";
            return DBHelper.GetFillData(sql);
        }

        //查询首页男仕板块中部商品栏
        public DataTable SelectManCenter()
        {
            string sql = "select  * from Product  where Pro_id=2003 ";
            return DBHelper.GetFillData(sql);
        }

        //查询首页男仕板块右侧商品栏
        public DataTable SelectManRight()
        {
            string sql = "select  * from Product  where Pro_id>2003 and Pro_id<2006 order by Pro_id asc";
            return DBHelper.GetFillData(sql);
        }

        //查询首页女士板块左侧商品栏
        public DataTable SelectWoManLeft()
        {
            string sql = "select  * from Product  where Pro_id>3000 and Pro_id<3003 order by Pro_id asc";
            return DBHelper.GetFillData(sql);
        }

        //查询首页女士板块中部商品栏
        public DataTable SelectWoManCenter()
        {
            string sql = "select  * from Product  where Pro_id=3003";
            return DBHelper.GetFillData(sql);
        }

        //查询首页女士板块右侧商品栏
        public DataTable SelectWoManRight()
        {
            string sql = "select  * from Product  where  Pro_id>3003 and Pro_id<3006 order by Pro_id asc";
            return DBHelper.GetFillData(sql);
        }


        //查询推荐模块左侧商品栏
        public DataTable SelectSLeft()
        {
            string sql = "select  * from Product  where Pro_id>4000 and Pro_id<4003 order by Pro_id asc";
            return DBHelper.GetFillData(sql);
        }

        //查询推荐模块中部商品栏
        public DataTable SelectSCenter()
        {
            string sql = "select  * from Product  where Pro_id=4003";
            return DBHelper.GetFillData(sql);
        }

        //查询推荐模块右侧商品栏
        public DataTable SelectSRight()
        {
            string sql = "select  * from Product  where Pro_id>4003 and Pro_id<4006 order by Pro_id asc";
            return DBHelper.GetFillData(sql);
        }

        //绑定商品
        public DataTable SelectProduct(string A) 
        {
            string sql = "Select *  From Product  " + A;
            return DBHelper.GetFillData(sql);
        }

        //搜索商品功能
        public DataTable SelectKeys(string Keys)
        {
            string sql = "Select *  From Product where Pro_id>5000 and Pro_name like '%" + Keys + "%'"+"or Pro_main like '%" + Keys + "%'";
            return DBHelper.GetFillData(sql);
        }

        //判断某用户购物车是否有某商品的方法
        public  DataTable JudgeMallYorN(int Users_id, int Pro_id)
        {
            string sql = "select * from ShopCart where Users_id ='" + Users_id + "'and Pro_id='" + Pro_id + "'";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@Users_id",Users_id),
                new SqlParameter("@Pro_id",Pro_id)
            };
            DataTable dt = DBHelper.GetFillData(sql, sp);
            return dt;
        }

        //购物车有商品时做更新操作
        public  int UpdateShoppingCart(int Users_id, int Pro_id, int Qty, decimal Sales_tprice)
        {
            string sql = "update ShopCart set Qty=Qty+'" + Qty + "',Sales_tprice=Sales_tprice+'" + Sales_tprice + "' where Users_id='" + Users_id + "' and Pro_id='" + Pro_id + "'";
            SqlParameter[] para =
            {
                new SqlParameter("@Qty",Qty),
                new SqlParameter("@Sales_tprice",Sales_tprice),
                new SqlParameter("@Users_id",Users_id),
                new SqlParameter("@Pro_id",Pro_id)
            };
            return DBHelper.GetExcuteNonQuery(sql, para);
        }

        //插入数据进购物车
        public  int InsertShoppingCart(ShopCart ShopCart)
        {
            string sql = "insert into ShopCart(Users_id,Pro_id,Pro_price,Qty,Sales_tprice)values(@Users_id,@Pro_id,@Pro_price,@Qty,@Sales_tprice)";
            SqlParameter[] para =
            {
                new SqlParameter ("@Users_id",ShopCart.Users_id),
                new SqlParameter ("@Pro_id",ShopCart.Pro_id),
                new SqlParameter ("@Pro_price",ShopCart.Pro_price),
                new SqlParameter ("@Qty",ShopCart.Qty),
                new SqlParameter ("@Sales_tprice",ShopCart.Sales_tprice)
            };
            return DBHelper.GetExcuteNonQuery(sql, para);
        }

        //查询用户购物车数量 根据用户ID
        public  DataTable SelectUserMallCart(int Users_id)
        {
            string sql = "select * from ShopCart where Users_id='" + Users_id + "'";
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@Users_id",Users_id)
            };
            DataTable dt = DBHelper.GetFillData(sql, sp);
            return dt;
        }

        //显示订单栏每个订单
        public DataTable SelectShoppingCart(int Users_id)
        {
            string sql = "select * from Buyers,Users,ShopCart,Product where Buyers.Buyers_id=Product.Buyers_id and ShopCart.Users_id=Users.Users_id and ShopCart.Pro_id=Product.Pro_id and Users.Users_id=" + Users_id;
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@Users_id",Users_id)
            };
            DataTable dt = DBHelper.GetFillData(sql, sp);
            return dt;
        }

        //结算购物车所有商品
        public  DataTable SelectAllTotalAmount(int Users_id)
        {
            string sql = "select SUM(Sales_tprice) FinalTotalAmount from Users,ShopCart,Product where ShopCart.Users_id=Users.Users_id and ShopCart.Pro_id=Product.Pro_id and Users.Users_id=" + Users_id;
            SqlParameter[] sp = new SqlParameter[]
            {
                new SqlParameter("@Users_id",Users_id)
            };
            DataTable dt = DBHelper.GetFillData(sql, sp);
            return dt;
        }


        //删除订单
        public int DeleteShoppingCart(int Users_id)
        {
            string sql = "delete from ShopCart where Users_id= " + Users_id;
            SqlParameter[] para =
            {
                new SqlParameter("@ShopCart_id",Users_id)
            };
            return DBHelper.GetExcuteNonQuery(sql, para);
        }

        //删除订单 DataTable
        //public  DataTable DeleteShopCart(int Users_id)
        //{
        //    string sql = "delete from ShopCart where Users_id= " + Users_id;
        //    SqlParameter[] para =
        //    {
        //        new SqlParameter("@ShopCart_id",Users_id)
        //    };
        //    return DBHelper.GetFillData(sql, para);
        //}


        //更新购物车
        public int UpdateShoppingCartNum(int ShopCart_id, int Qty, float Sales_tprice)
        {
            string sql = "update ShopCart set Qty = '" + Qty + "',Sales_tprice='" + Sales_tprice + "' where ShopCart_id = '" + ShopCart_id + "' ";
            SqlParameter[] para =
            {
                new SqlParameter("@Qty",Qty),
                new SqlParameter("@Sales_tprice",Sales_tprice),
                new SqlParameter("@ShopCart_id",ShopCart_id)
            };
            return DBHelper.GetExcuteNonQuery(sql, para);
        }

        //从购物车表插入订单表
        public  int InsertOrder(Sales us)
        {
            string sql = "insert into Sales(Users_id,Sales_time,Total_price)values(@Users_id,@Sales_time,@Total_price) ";
            SqlParameter[] sp = new SqlParameter[]{
                new SqlParameter("@Users_id",us.Users_id),
                new SqlParameter("@Sales_time",us.Sales_time),
                new SqlParameter("@Total_price",us.Total_price),
            };
            return DBHelper.GetExcuteNonQuery(sql, sp);
        }


    }
}
