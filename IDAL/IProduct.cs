using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Models;
using System.Data;

namespace IDAL
{
    public interface IProduct
    {
        //添加商品
        int Insert(Product us);

        //修改商品信息
        int Upadte(Product us);

        //删除商品
        int Delete(int Pro_id);

        //根据商品ID搜索
        DataTable SelectID(int id);

        //查询所有商品       
        DataTable SelectAll();

        //查询前二商品       
        DataTable SelectTop2();

     

        //查询首页男仕板块左侧商品栏
        DataTable SelectManLeft();

        //查询首页男仕板块中部商品栏
        DataTable SelectManCenter();

        //查询首页男仕板块右侧商品栏
        DataTable SelectManRight();

        //查询首页女士板块左侧商品栏
        DataTable SelectWoManLeft();

        //查询首页女士板块中部商品栏
        DataTable SelectWoManCenter();

        //查询首页女士板块右侧商品栏
        DataTable SelectWoManRight();

        //查询推荐模块左侧商品栏
        DataTable SelectSLeft();

        //查询推荐模块中部商品栏
        DataTable SelectSCenter();

        //查询推荐模块右侧商品栏
        DataTable SelectSRight();

        //绑定商品
        DataTable SelectProduct(string A);

        //搜索商品功能
        DataTable SelectKeys(string Keys);

        //判断某用户购物车是否有某商品的方法
        DataTable JudgeMallYorN(int Users_id, int Pro_id);


        //购物车有商品时做更新操作
        int UpdateShoppingCart(int Users_id, int Pro_id, int Qty, decimal Sales_tprice);

        //插入数据进购物车
        int InsertShoppingCart(ShopCart ShopCart);

        //查询用户购物车数量
        DataTable SelectUserMallCart(int Users_id);

        //显示订单栏每个订单
        DataTable SelectShoppingCart(int Users_id);

        //结算购物车所有商品
        DataTable SelectAllTotalAmount(int Users_id);


        //更新购物车
        int UpdateShoppingCartNum(int ShopCart_id, int Qty, float Sales_tprice);

        //删除订单
        int DeleteShoppingCart(int Users_id);

        //删除订单 DataTable
        //DataTable DeleteShopCart(int Users_id);

        //从购物车表插入订单表
        int InsertOrder(Sales us);
    }
}
