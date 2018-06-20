<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingStep.aspx.cs" Inherits="WebApplication2.ShoppingStep" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="BottomLeft">
         <h2 class="font1">&nbsp;购物流程</h2> <br />
   <h3 class="font2">&nbsp 注册登陆</h3><br />
<ul>
    <li>&nbsp&nbsp（1）新顾客注册：请点击首页顶部“注册”进入注册页面后输入邮箱地址、用户名、密码及验证码，按照提示完成注册。</li>
    <li>&nbsp&nbsp（2）老顾客登陆：请在"请登录 "页面输入登陆账号、注册密码进行登陆。</li>
</ul><br />
   <h3 class="font2">&nbsp 查找商品</h3><br />
<ul>
    <li>&nbsp&nbsp（1）您可以通过在首页输入关键字的方法来搜索您想要购买的商品。</li>
    <li>&nbsp&nbsp（2）您还可以通过买手说的分类导航栏来找到您想要购买的商品分类，根据分类找到您的商品。</li>
</ul><br />
   <h3 class="font2">&nbsp 加入购物车</h3><br />
<ul>
    <li>&nbsp&nbsp（1）挑选商品后，在商品详细页面点击“购买”按钮，将商品放入购物车中。</li>
    <li>&nbsp&nbsp（2）在购物车中，系统默认每件商品的订购数量为1件，如果您想购买多件商品，可修改购买数量。</li>
    <li>&nbsp&nbsp（3）在购物车中，您可以将商品加入收藏夹，或是选择删除。</li>
    <li>&nbsp&nbsp（4）在购物车中，您可以直接查看到商品的价格和名称、促销主题。</li>
    <li>&nbsp&nbsp（5）购物车页面下方的商品，是买手说根据您本次挑选的商品为您提供的推荐商品，以及可以参加选购的特惠活动商品，若有您喜爱的商品，点击"放入购物车"即可。</li>
</ul><br />
   <h3 class="font2" style="color:red;"> &nbsp;温馨提示：</h3><br />
<ul>
    <li>&nbsp&nbsp 1.商品价格会不定期调整，最终价格以您提交订单后订单中的价格为准。</li>
    <li>&nbsp&nbsp 2.优惠政策、配送时间、运费收取标准等都有可能进行调整，最终成交信息以您提交订单时网站公布的最新信息为准。</li>
</ul><br />
   <h3 class="font2">&nbsp 填写收货人信息</h3><br />
<ul>
    <li>&nbsp&nbsp（1）请填写正确完整的收货人姓名、收货人联系方式、详细的收货地址和邮编，否则将会影响您订单的处理或配送。</li>
    <li>&nbsp&nbsp（2）您可以进入"我的1号店—个人信息管理—地址簿管理"添加新地址信息，保存成功后，再订购时，可以直接选择使用。</li>
</ul><br />
   <h3 class="font2">&nbsp 选择收货方式</h3><br />
   <h4 class="font2">&nbsp&nbsp 买手说提供多种收货方式：</h4>
<ul>
    <li>&nbsp&nbsp（1）普通快递送货上门。</li>
    <li>&nbsp&nbsp（2）准时达/定日达送货上门：订单在每日20：00前提交成功（在线支付需付款完成），顾客可选择选择当日起7天内的任意时间段/任意一天进行配送。具体请以订单提交页信息为准。
详情请点击查看配送范围、时间及运费.入驻商家收货方式以商家实际合作快递为准，可联系入驻商家确认。</li>
</ul><br />
   <h3 class="font2">&nbsp 选择支付方式</h3><br />
   <h4 class="font2">&nbsp&nbsp 买手说提供多种支付方式，订购过程中您可以选择</h4>
<ul>
    <li>&nbsp&nbsp（1）货到付款</li>
    <li>&nbsp&nbsp（2）货到刷卡</li>
    <li>&nbsp&nbsp（3）网上支付</li>
    <li>&nbsp&nbsp（4）银行转帐</li>
    <li>&nbsp&nbsp 支付方式具体请以订单提交页信息为准，入驻商家商品仅支持网上支付、银行转账。</li>
</ul><br />
   <h3 class="font2">&nbsp 下单索要发票</h3><br />
<p>&nbsp&nbsp 请填写正确的发票抬头、选择正确的发票内容，选择成功后点击“保存发票信息”将于订单货物一起送达</p><br />
   <h3 class="font2">&nbsp 提交订单</h3><br />
<ul>
    <li>&nbsp&nbsp（1）以上信息核实无误后，请点击"提交订单"，系统生成一个订单号，就说明您已经成功提交订单。</li>
    <li>&nbsp&nbsp（2）订单提交成功后，您可以登陆"买手说"查看订单信息或为订单进行网上支付。</li>
</ul>
    </div>
</asp:Content>
