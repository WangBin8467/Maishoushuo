using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Models;
using IDAL;
using DALFactory;

namespace BLL
{
    public class ProductService
    {
        private static IProduct iproduct = DataAccess.CreateProduct();
        //添加商品
        public static int Insert(Product us)
        {
            return iproduct.Insert(us);
        }

        //修改商品信息
        public static int Upadte(Product us)
        {
            return iproduct.Upadte(us);
        }

        //删除商品
        public static int Delete(int Pro_id)
        {
            return iproduct.Delete(Pro_id);
        }

        //根据商品ID搜索
        public static DataTable SelectID(int id)
        {
            return iproduct.SelectID(id);
        }

        //查询所有商品   
        public static DataTable SelectAll()
        {
             return iproduct.SelectAll();
        }
        
        //查询前六商品     
        public static DataTable SelectTop2()
        {
            return iproduct.SelectTop2();
        }
        //查询首页男仕板块商品栏
        public static DataTable SelectManLeft()
        {
            return iproduct.SelectManLeft();
        }

        //查询首页男仕板块中部商品栏
        public static DataTable SelectManCenter()
        {
            return iproduct.SelectManCenter();
        }

        //查询首页男仕板块右侧商品栏
        public static DataTable SelectManRight()
        {
            return iproduct.SelectManRight();
        }


        //查询首页女士板块左侧商品栏
        public static DataTable SelectWoManLeft()
        {
            return iproduct.SelectWoManLeft();
        }

        //查询首页女士板块中部商品栏
        public static DataTable SelectWoManCenter()
        {
            return iproduct.SelectWoManCenter();
        }

        //查询首页女士板块右侧商品栏
        public static DataTable SelectWoManRight()
        {
            return iproduct.SelectWoManRight();
        }


        //查询推荐模块左侧商品栏
        public static DataTable SelectSLeft()
        {
            return iproduct.SelectSLeft();
        }

        //查询推荐模块中部商品栏
        public static DataTable SelectSCenter()
        {
            return iproduct.SelectSCenter();
        }

        //查询推荐模块右侧商品栏
        public static DataTable SelectSRight()
        {
            return iproduct.SelectSRight();
        }


        //绑定商品
        public static DataTable SelectProduct(string A) 
        {
            return iproduct.SelectProduct(A);
        }

        //搜索商品功能
        public static DataTable SelectKeys(string Keys)
        {
            return iproduct.SelectKeys( Keys);
        }

        //判断某用户购物车是否有某商品的方法
        public static DataTable JudgeMallYorN(int Users_id, int Pro_id) 
        {
            return iproduct.JudgeMallYorN(Users_id, Pro_id);
        }

        //购物车有商品时做更新操作
        public static int UpdateShoppingCart(int Users_id, int Pro_id, int Qty, decimal Sales_tprice) 
        {
            return iproduct.UpdateShoppingCart(Users_id, Pro_id, Qty, Sales_tprice);
        }


        //插入数据进购物车
        public static int InsertShoppingCart(ShopCart ShopCart)
        {
            return iproduct.InsertShoppingCart(ShopCart);
        }

        //查询用户购物车数量
        public static DataTable SelectUserMallCart(int Users_id) 
        {
            return iproduct.SelectUserMallCart(Users_id);
        }

        //显示订单栏每个订单
        public static DataTable SelectShoppingCart(int Users_id)
        {
            return iproduct.SelectShoppingCart(Users_id);
        }

        //结算购物车所有商品
        public static DataTable SelectAllTotalAmount(int Users_id)
        {
            return iproduct.SelectAllTotalAmount(Users_id);
        }

        //删除订单
        public static int DeleteShoppingCart(int Users_id)
        {
            return iproduct.DeleteShoppingCart(Users_id);
        }

        //删除订单 DataTable
        //public static DataTable DeleteShopCart(int Users_id)
        //{
        //    return iproduct.DeleteShopCart(Users_id);
        //}


        //更新购物车
        public static int UpdateShoppingCartNum(int ShopCart_id, int Qty, float Sales_tprice)
        {
            return iproduct.UpdateShoppingCartNum(ShopCart_id, Qty, Sales_tprice);
        }

        //从购物车表插入订单表
        public static int InsertOrder(Sales us) 
        {
            return iproduct.InsertOrder(us);
        }

        

    }
}
