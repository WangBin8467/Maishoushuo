<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Website.Login" EnableEventValidation="false" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link rel="stylesheet" type="text/css" href="Content/reset.css"/>
		<link rel="stylesheet" type="text/css" href="Content/common_foot.css"/>
		<link rel="stylesheet" type="text/css" href="Content/login.css"/>
		<script type="text/javascript" src="Scripts/jquery-1.12.3.js"></script>
		<script type="text/javascript" src="Scripts/jquery-ljz.js"></script>
		<script type="text/javascript" src="Scripts/login.js"></script>
		<title>登录</title>
</head>
<body>
    <form id="form1" runat="server">
    <!--网页头部-->
		<div class="header_wrapper">
		<div class="header">
			<div class="logo">
				<h1><a href="index.aspx" title="买手说"><img src="images/logo.png" id="logo" /></a></h1>
			</div>
			<h2>
				<span>需要帮助？</span>
				<i class="headico_phone"></i>
				<b>4000-250-630</b>
				<div style="clear: both;"></div>
			</h2>			
		</div>	
		</div>
		
		
		<!--网页主体内容-->
		<div class="main_wrapper">
		<div class="main">
		    <div class="register_form">
		    	<form>
		    		<h3>登录</h3>
		    		<div class="txt clearfix">
		    			<i class="regico"></i>		    		
                        <asp:TextBox ID="txt" runat="server" class="float_l" placeholder="请输入用户名"></asp:TextBox>
		    		</div>	    		
		    		<div class="password clearfix">
		    			<i class="regico"></i>
                        <asp:TextBox ID="pwd" runat="server"  class="float_l" placeholder="请输入密码" TextMode="Password"></asp:TextBox>
		    		</div>	
                    <asp:Button ID="btn" runat="server" Text="登录" OnClick="btn_Click" />		    		
		    	</form>
		    </div>				
		</div>
		</div>
				
		 <!--网页底部-->
	    <div class="foot_wrapper">
	    <div class="foot">

	    	<div class="foot_start">
	    	<div class="foot_start_content">
	    		<div class="help_print">
	    			<ul>
	    				<li class="margin_bt"><a  class="foot_c">购物指南</a></li>
	    				<li><a href="ShoppingStep.aspx">购物流程</a></li>
	    				<li><a href="PeiSong.aspx">配送方式</a></li>	    				
	    			</ul>
	    			<ul>
	    				<li class="margin_bt"><a  class="foot_c">支付方式</a></li>
	    				<li><a href="PayWay.aspx">如何付款</a></li>
	    			</ul>	    			
	    			<ul>
	    				<li class="margin_bt"><a  class="foot_c">客服中心</a></li>
	    				<li><a href="SaleReturn.aspx">七天退换</a></li>
	    				<li><a href="Problems.aspx">常见问题</a></li>
	    			</ul>
	    		</div>
	    	
	    	    <div class="service_phone">
	    	    	<span class="foot_c">客服电话</span>
	    	    	<h5>4000-250-630</h5>
	    	    	<p>工作日 08:30-21:30</p>
	    	    	<p>节假日 10:00-18:00</p>
	    	    </div>
	    	
	    	    <div class="foot_subscription">
                    <p class="subscription_dy">订阅买手说杂志</p>
                    <input class="subscription_email"  type="text"  placeholder="E-mail">
                    <div class="now_dy">即刻订阅</div>
                </div>
	    	   
	    	    <div class="down_main">
	    	    	<div class="down_main_app">
	    	    		<span class="foot_c">买手说APP</span>
	    	    		<div class="down_app">
	    	    			<img data-original="images/down_app.png" class="lazy" width="67" height="67" />
	    	    		</div>
	    	    	</div>
	    	    	<div class="down_main_wx">
	    	    		<span class="foot_c">官方微信</span>
	    	    		<div class="down_wx">
	    	    			<img data-original="images/down_wx.png" class="lazy" width="67" height="67" />
	    	    		</div>
	    	    	</div>
	    	        
	    	        <div style="clear: both;"></div>
	    	        <p>手机扫码即可下载买手说APP或关注官方微信 </p>
	    	    </div>
	    	</div>
	    	</div>
	    
	
	    	<div class="foot_end">
	    		<div class="foot_end_top">
	    			<ul>
	    				<li>
	    					<div class="foot_ico"></div>
	    					<span>100%正品保证</span>
	    				</li>
	    				<li class="foot_gaoshi">
	    					<div class="foot_ico2"></div>
	    					<span>7天无忧退货</span>
	    				</li>
	    				<li>
	    					<div class="foot_ico3"></div>
	    					<span>诚挚专注，品质保障</span>
	    				</li>
	    			</ul>
	    		</div>
	    		
	    		<div class="foot_cut"></div>
	    		
	    		<div class="foot_end_over clearfix">
	    			
	    			<div class="foot_mt">
	    				<div style="clear: both;"></div>
	    				<div class="foot_bf">
	    					<p> 江西师范大学软件学院工作室©2017</p>
	    				</div>
	    				<div class="foot_bf">
	    					<span>指导老师：曽雅琳</span>
                        </div>
	    			</div>
	    		
	    		    <div class="foot_over_cut"></div>
	    		    
	    		    <div class="foot_over_right">
	    		    	<div class="p"><span>合作支持</span></div>
	    		    	<ul class="clearfix">
	    		    		<li class="partner02" style="padding-top: 6px;">
	    		    			<a href="http://cn.unionpay.com/" class="clearfix">
	    		    				<span style="margin-right: 4px;"></span>
	    		    				<i class="float_l">银联特约商户</i>
	    		    			</a>
	    		    		</li>
	    		    		<li class="partner03" style="padding-top: 5px;">
	    		    			<a href="http://fashion.qq.com/"></a>
	    		    		</li>
	    		    		<li class="partner04">
	    		    			<a href="http://www.sina.com.cn/"></a>
	    		    		</li>
	    		    		<li class="partner05" style="padding-top: 4px;">
	    		    			<a href="http://women.sohu.com/"></a>
	    		    		</li>
	    		    		<li class="partner06" style="padding-top: 4px;padding-right: 0;">
	    		    			<a href="http://www.haibao.com/"></a>
	    		    		</li>
	    		    	</ul>
	    		    </div>
	    		</div>
	    	</div>
	    </div>
	    </div>
    </form>
</body>
</html>
