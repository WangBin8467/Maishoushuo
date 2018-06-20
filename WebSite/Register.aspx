<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Website.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="stylesheet" type="text/css" href="Content/reset.css"/>
		<link rel="stylesheet" type="text/css" href="Content/common_foot.css"/>
		<link rel="stylesheet" type="text/css" href="Content/register.css" />
		<script type="text/javascript" src="Scripts/jquery-1.12.3.js"></script>
		<script type="text/javascript" src="Scripts/jquery-ljz.js"></script>
		<script type="text/javascript" src="Scripts/jquery.cookie.js"></script>
		<script type="text/javascript" src="Scripts/gVerify.js"></script><!--验证码-->
		<%--<script type="text/javascript" src="Scripts/register.js"></script>--%>
        <script>
         $(function () {
            $('[data-toggle="tooltip"]').tooltip();
          });
        </script>
    <title>注册</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
		    	
		    		<h3>注册账户</h3>
                    <%--用户名模块--%>
		    		<div class="txt clearfix">
		    			<i class="regico"></i>
		    			<%--<input type="text" id="txt" class="float_l" placeholder="请输入用户名" />--%>

                      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                      <ContentTemplate>
                        <asp:TextBox ID="txtName" runat="server" class="float_l" name="Users_name" placeholder="请输入用户名" data-toggle="tooltip" data-placement="right" data-original-title="限16个字符，支持中英文、数字、减号或下划线" OnTextChanged="txtName_TextChanged" AutoPostBack="true"></asp:TextBox>                    
                        <asp:Label ID="lblCheck" runat="server" Text="" Font-Size="12px" Font-Bold="True" ForeColor="Red"></asp:Label>
                      </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="txtName" EventName="TextChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
		    		</div>	
                     <%--用户名格式验证--%>
                    <asp:RegularExpressionValidator ID="revUserName" runat="server" ErrorMessage="限16个字符，支持中英文、数字、减号或下划线" ValidationExpression="^[\\u4e00-\u9fa5_a-zA-Z0-9-\\w]{1,16}$" ControlToValidate="txtName" Display="Dynamic" Font-Size="12px" Font-Bold="True" ForeColor="Red"></asp:RegularExpressionValidator>
               
                     <%--用户名不为空验证--%>
                    <asp:RequiredFieldValidator ID="RFV01" runat="server" ControlToValidate="txtName" Display="Dynamic" Font-Size="12px" Font-Bold="True" ForeColor="Red" Text="用户名不能为空"></asp:RequiredFieldValidator>

                    
                    <%--手机号码模块--%>
                    <div class="txt clearfix">			   	
			    			<i class="regico"></i>
                             <asp:TextBox ID="txtphone" runat="server" class="float_l" placeholder="手机号码" data-toggle="tooltip" data-placement="right" data-original-title="请输入正确手机号码"></asp:TextBox>			    		
		    		</div>	
                    <%--手机号码不为空验证--%> 
                    <asp:RequiredFieldValidator ID="RFV04" runat="server" ControlToValidate="txtphone" Display="Dynamic" Font-Size="12px" Font-Bold="True" ForeColor="Red" Text="手机号码不能为空"></asp:RequiredFieldValidator>                   
                    <%--手机号码格式--%>
                    <asp:RegularExpressionValidator ID="REV02" runat="server" ControlToValidate="txtphone" Display="Dynamic" ValidationExpression="^1[3|4|5|7|8][0-9]\d{8}$" Font-Size="12px" Font-Bold="True" ForeColor="Red" Text="请输入有效的手机号码"></asp:RegularExpressionValidator>
                    
                     <%--密码模块--%>	
		    		<div class="password clearfix">
		    			<i class="regico"></i>
		    			<%--<input type="password" id="pwd" class="float_l" placeholder="请输入密码" />--%>
                        <asp:TextBox ID="txtPassword" runat="server" class="float_l" placeholder="请输入密码" TextMode="Password" data-toggle="tooltip" data-placement="right" data-original-title="6-20 位的任意字母、数字、字符组合" CausesValidation="true"></asp:TextBox>
		    		</div>
                    <%--密码格式--%>
                   <asp:RegularExpressionValidator ID="revPassword" runat="server" ErrorMessage="6-20 位的任意字母、数字、字符组合" ValidationExpression="^([A-Z]|[a-z]|[0-9]|[`~!@#$%^&*()+=|{}':;',\\\\[\\\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]){6,20}$" ControlToValidate="txtPassword" Text="密码必须为6-20 位的任意字母、数字、字符组合" Font-Size="12px" Font-Bold="True" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>              
                    <%--密码不为空--%>
                   <asp:RequiredFieldValidator ID="RFV02" runat="server" ControlToValidate="txtPassword" Display="Dynamic" Font-Size="12px" Font-Bold="True" ForeColor="Red" Text="密码不能为空"></asp:RequiredFieldValidator>
		    		
                   <%--再次输入密码模块 --%>
                   <div class="password_again clearfix">
		    			<i class="regico"></i>
		    			<%--<input type="password" class="float_l" id="pwd_again" placeholder="再次输入密码" />--%>
                       <asp:TextBox ID="txtRpassword" runat="server" class="float_l" placeholder="再次输入密码" TextMode="Password" data-toggle="tooltip" data-placement="right" data-original-title="请再次输入密码"></asp:TextBox>
		    		</div>

                   <%-- 密码前后需一致--%>
                  <asp:CompareValidator ID="CVD01" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtRpassword" Display="Dynamic" Font-Size="12px" Font-Bold="True" ForeColor="Red" Text="密码不一致"></asp:CompareValidator>


		    		<div class="hint" id="hint"></div>
		    		<%--<input type="button" name="" id="btn" value="注册" />--%>
                    <asp:Button ID="Button1" runat="server" class="btn01" Text="注册" OnClick="btn01_Click"/>
                    <div class="form_over">已注册？<a href="Login.aspx">登录</a></div>
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
	    				<li class="margin_bt"><a href="#" class="foot_c">购物指南</a></li>
	    				<li><a href="#">购物流程</a></li>
	    				<li><a href="#">配送方式</a></li>	    				
	    			</ul>
	    			<ul>
	    				<li class="margin_bt"><a href="#" class="foot_c">支付方式</a></li>
	    				<li><a href="#">如何付款</a></li>
	    			</ul>	    			
	    			<ul>
	    				<li class="margin_bt"><a href="#" class="foot_c">客服中心</a></li>
	    				<li><a href="#">七天退换</a></li>
	    				<li><a href="#">常见问题</a></li>
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
