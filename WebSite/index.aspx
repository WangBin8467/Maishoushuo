<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Website.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>买手说</title>
		<link rel="stylesheet" type="text/css" href="Content/reset.css"/>
		<link rel="stylesheet" type="text/css" href="Content/common.css"/>
		<link rel="stylesheet" type="text/css" href="Content/index.css"/>
		<script type="text/javascript" src="Scripts/jquery-1.12.3.js"></script>
		<script type="text/javascript" src="Scripts/jquery-ljz.js"></script>
		<script type="text/javascript" src="Scripts/jquery.cookie.js"></script>
		<script type="text/javascript" src="Scripts/common.js"></script>
		<script type="text/javascript" src="Scripts/index.js"></script>
	</head>
	<body>
        <form id="form" runat="server">
		<!--网页头部-->
		<div class="header_wrapper">
		<div class="header">			
			<!--顶部菜单-->
			<div class="topmenu_wrapper">
		    <div class="topmenu">
		    	<!--顶部菜单左侧-->
		    	<div class="topmenu_left">
		    		<!--联系电话-->
		    		<div class="phone">
		    			<i class="headico_phone"></i>
		    			<span>4000-250-630</span>
		    		</div>
		    		<!--下载手机app-->
		    		<div class="qr">
		    			<i class="headico_qr"></i>
		    			<a href="#">下载买手说app</a>
		    			
		    			<div class="head_app">
	    					<i class="headico_up"></i>
	    					<a href="#" title="下载买手说APP">
	    					   <img src="images/qr.png" class="img_qr"/>
	    					   <br />
	    					       扫码下载
    					    </a>
    				    </div>
		    		</div>		    			    		
		    	</div>		    	
		    	<!--顶部菜单右侧-->
		    	<div class="topmenu_right">
		    		<!--注册登录-->
		    		<div class="topmenu_right_login">		    			
                    <asp:Panel ID="PanelUserInfo1" runat="server">               
                         欢迎您，<a href="#" <%--个人中心页面链接--%>><asp:Label ID="lblUserInfo" runat="server" Text=""></asp:Label></a>丨
                         <asp:LinkButton ID="lbtnLoginOut" runat="server" OnClick="lbtnLoginOut_Click">注销</asp:LinkButton>                      
                    </asp:Panel>
                    <asp:Panel ID="PanelUserInfo2" runat="server">               
                         欢迎您，买手&nbsp;&nbsp;<a href="#" <%--个人中心页面链接--%>><asp:Label ID="LabelBuyerInfo" runat="server" Text=""></asp:Label></a>丨
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lbtnLoginOut_Click">注销</asp:LinkButton>                      
                    </asp:Panel>
                    <asp:Panel ID="PanelLogin" runat="server">
                      <div class="login">                          
                            <a href="Login.aspx">登录</a>丨
                           <a href="Register.aspx">注册</a>
                      </div>  
                    </asp:Panel>
		    		</div>		
                    <!--购物袋-->
		    		<div class="buycar" id="buycar">
		    			<i class="headico_buycar"></i>
		    			<a href="ShopCart.aspx">购物袋</a>
    		        </div>
		    	</div>
		    </div>
		    </div>
		  
		    <!--头部 logo及搜索-->
		    <div class="head">
		    	<!--logo-->
		    	<div class="logo">
		    		<a href="index.aspx" title="买手说"><img src="images/logo.png" id="logo" /></a>
		    	</div>
		    	<!--搜索框-->
		    	<div class="head_search">
                    <asp:TextBox ID="SearchText" runat="server"  class="input_search" placeholder="商品关键字搜索"></asp:TextBox>
                    <asp:LinkButton ID="SearchBtn" runat="server" OnClick="ProductSeacrch" class="head_search_btn">
                        <i class="headico_fdj"></i>
                    </asp:LinkButton>
		    	</div>
		    </div>
		    
		    <!--头部导航-->
		    <div class="head_nav_wrapper">		    	
		    <div class="head_nav">
		    	<ul id="head_nav">
		    		<li>
                        <a href="index.aspx" title="首页">首页</a>
		    		</li>
		    		<li>
                        <a href="Product.aspx" title="所有商品">所有商品</a>
		    		</li>		    		
		    		<li>
		    			<a href="Product.aspx?Keys=女" title="女士">女士</a>
		    		</li>
		    		<li>
		    			<a href="Product.aspx?Keys=男" title="男仕">男仕</a>
		    		</li>
		    		<li>
		    			<a href="Buyers.aspx" title="星级买手">星级买手</a>
		    		</li>
		    		<li>
                        <a href="JoinUs.aspx" title="加入我们">加入我们</a>
		    		</li>
		    	</ul>
		    </div>
			</div>	   
		</div>		      		    
		</div>
	
	    
	    <!--焦点轮播图-->
	    <div class="banner_wrapper">
	    <div class="banner">
	    	<div class="slider">
	    		<ul id="slider">
	    			<li><a href="Product.aspx"><img src="images/banner1.jpg"</a></li>
	    			<li><a href="Product.aspx"><img src="images/banner2.jpg" /></a></li>
	    			<li><a href="Product.aspx"><img src="images/banner3.jpg" /></a></li>
	    			<li><a href="Product.aspx"><img src="images/banner1.jpg" /></a></li>
	    		</ul>
	    		
	    		<div id="left"><</div>
	    		<div id="right">></div>
	    		
	    	</div>
	    </div>	
	    </div>
	
	    
	    <!--网页主体内容-->
	    <div class="main_wrapper">
	    <div class="main">
	    	
	    	<div class="special_offer">
	    		<h2>
	    			<div class="mid_line"></div>
	    			<p><span>特别推荐</span><br />Special Offer</p>
	    		</h2>
	    		<div class="special_content">
                    <%--推荐模块左侧--%>
                    <div class="left">
                    <asp:listView ID="ListView7" runat="server" >                       
                        <LayoutTemplate>
                            <table>
                                 <tr>
                                     <td id="itemPlaceHolder" runat="server"></td>
                                 </tr>
                             </table>
                        </LayoutTemplate>
	    		        <ItemTemplate>
                            <tr>
                            <td>
                               <a href="Product.aspx"> <asp:Image ID="Pro_img7" runat="server" ImageUrl='<%# Eval("Pro_img")%>' /></a>
                            </td>
                            </tr>
                        </ItemTemplate>
                    </asp:listView>
                    </div>

                    <%--推荐模块中部--%>
                    <div class="center">
	    				<asp:listView ID="ListView8" runat="server" >                       
                        <LayoutTemplate>
                            <table>
                                 <tr>
                                     <td id="itemPlaceHolder" runat="server"></td>
                                 </tr>
                             </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                            <td>
                               <a href="Product.aspx"> <asp:Image ID="Pro_img8" runat="server" ImageUrl='<%# Eval("Pro_img")%>' /></a>
                            </td>
                            </tr>
                        </ItemTemplate>
                        </asp:listView>
	    			</div>

                    <%--推荐模块右侧--%>
                    <div class="right">
                        <asp:listView ID="ListView9" runat="server" >                       
                        <LayoutTemplate>
                            <table>
                                 <tr>
                                     <td id="itemPlaceHolder" runat="server"></td>
                                 </tr>
                             </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                            <td>
                              <a href="Product.aspx"> <asp:Image ID="Pro_img9" runat="server" ImageUrl='<%# Eval("Pro_img")%>' /></a>
                            </td>
                            </tr>
                        </ItemTemplate>
                        </asp:listView>
	    			</div>
	    		</div>
	    	</div>
	    	
	    	<div class="special_offer">
	    		<h2>
	    			<div class="mid_line"></div>
	    			<p><span>男仕精选</span><br />For Him</p>
	    		</h2>
	    		<div class="special_content">
                  <%--男仕模块左侧--%>
	    		  <div class="left">
	    				<asp:listView ID="ListView1" runat="server" >                       
                        <LayoutTemplate>
                            <table>
                                 <tr>
                                     <td id="itemPlaceHolder" runat="server"></td>
                                 </tr>
                             </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                            <td>
                               <a href="Product.aspx?Keys=男"> <asp:Image ID="Pro_img1" runat="server" ImageUrl='<%# Eval("Pro_img")%>' /> </a>
                            </td>
                            </tr>
                        </ItemTemplate>
                        </asp:listView>
	    			</div>

                    <%--男仕模块中部--%>
	    			<div class="center">
	    				<asp:listView ID="ListView2" runat="server" >                       
                        <LayoutTemplate>
                            <table>
                                 <tr>
                                     <td id="itemPlaceHolder" runat="server"></td>
                                 </tr>
                             </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                            <td>
                              <a href="Product.aspx?Keys=男">  <asp:Image ID="Pro_img2" runat="server" ImageUrl='<%# Eval("Pro_img")%>' /></a>
                            </td>
                            </tr>
                        </ItemTemplate>
                        </asp:listView>
	    			</div>
                    <%--男仕模块右侧--%>
	    			<div class="right">
                        <asp:listView ID="ListView3" runat="server" >                       
                        <LayoutTemplate>
                            <table>
                                 <tr>
                                     <td id="itemPlaceHolder" runat="server"></td>
                                 </tr>
                             </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                            <td>
                            <a href="Product.aspx?Keys=男">    <asp:Image ID="Pro_img3" runat="server" ImageUrl='<%# Eval("Pro_img")%>' /></a>
                            </td>
                            </tr>
                        </ItemTemplate>
                        </asp:listView>
	    		</div>
	    	</div>
	    	<div class="special_offer">
	    		<h2>
	    			<div class="mid_line"></div>
	    			<p><span>女士精选</span><br />For Her</p>
	    		</h2>
	    		<div class="special_content">
                    <%--女仕模块左侧--%>
	    			<div class="left">
	    				<asp:listView ID="ListView4" runat="server">                       
                        <LayoutTemplate>
                            <table>
                                 <tr>
                                     <td id="itemPlaceHolder" runat="server"></td>
                                 </tr>
                             </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                            <td>
                               <a href="Product.aspx?Keys=女"> <asp:Image ID="Pro_img4" runat="server" ImageUrl='<%# Eval("Pro_img")%>' /></a>
                            </td>
                            </tr>
                        </ItemTemplate>
                        </asp:listView>
	    			</div>

                    <%--女仕模块中部--%>
	    			<div class="center">
	    				<asp:listView ID="ListView5" runat="server" >                       
                        <LayoutTemplate>
                            <table>
                                 <tr>
                                     <td id="itemPlaceHolder" runat="server"></td>
                                 </tr>
                             </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                            <td>
                             <a href="Product.aspx?Keys=女">   <asp:Image ID="Pro_img5" runat="server" ImageUrl='<%# Eval("Pro_img")%>' /></a>
                            </td>
                            </tr>
                        </ItemTemplate>
                        </asp:listView>
	    			</div>

                    <%--女仕模块右侧--%>
	    			<div class="right">
	    				<asp:listView ID="ListView6" runat="server" >                       
                        <LayoutTemplate>
                            <table>
                                 <tr>
                                     <td id="itemPlaceHolder" runat="server"></td>
                                 </tr>
                             </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                            <td>
                               <a href="Product.aspx?Keys=女"> <asp:Image ID="Pro_img6" runat="server" ImageUrl='<%# Eval("Pro_img")%>' /></a>
                            </td>
                            </tr>
                        </ItemTemplate>
                        </asp:listView>
	    			</div>
	    		</div>
	    	</div>

	         <%--热门好货模块--%>
	        <div class="scroll_lunbo">
	    		<h2>
	    			<div class="mid_line"></div>
	    			<p><span>热门好货</span><br />HOT SOLD</p>
	    		</h2>
	    		<div class="scroll_pro">
	    			<ul id="scroll_pro">
	    				<li>
	    					 <a href="ProductDetails.aspx?id=5053" target="_blank">
	    						<img src="images/mc31.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				<li>
	    					<a href="ProductDetails.aspx?id=5003" target="_blank">
	    						<img src="images/mc32.png"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				<li>
	    					<a href="ProductDetails.aspx?id=5054" target="_blank">
	    						<img src="images/mc33.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				<li>
	    					<a href="ProductDetails.aspx?id=5004" target="_blank">
	    						<img src="images/mc34.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				<li>
	    					<a href="ProductDetails.aspx?id=5005" target="_blank">
	    						<img src="images/mc35.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				<li>
	    					<a href="ProductDetails.aspx?id=5055" target="_blank">
	    						<img src="images/mc36.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				<li>
	    					<a href="ProductDetails.aspx?id=5056" target="_blank">
	    						<img src="images/mc37.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				
	    				<li>
	    					<a href="ProductDetails.aspx?id=5057" target="_blank">
	    						<img src="images/mc38.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li><li>
	    					<<a href="ProductDetails.aspx?id=5009" target="_blank">
	    						<img src="images/mc39.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				
	    				<li>
	    					<a href="ProductDetails.aspx?id=5010" target="_blank">
	    						<img src="images/mc40.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				<li>
	    					<a href="ProductDetails.aspx?id=5011" target="_blank">
	    						<img src="images/mc41.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
                        <li>
	    					<a href="ProductDetails.aspx?id=5012" target="_blank">
	    						<img src="images/mc42.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				<li>
	    					<a href="ProductDetails.aspx?id=5013" target="_blank">
	    						<img src="images/mc43.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				<li>
	    					<a href="ProductDetails.aspx?id=5014" target="_blank">
	    						<img src="images/mc44.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				<li>
	    					<a href="ProductDetails.aspx?id=" target="_blank">
	    						<img src="images/mc45.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				<li>
	    					<a href="ProductDetails.aspx?id=" target="_blank">
	    						<img src="images/mc46.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				<li>
	    					<a href="ProductDetails.aspx?id=" target="_blank">
	    						<img src="images/mc47.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				
	    				<li>
	    					<a href="ProductDetails.aspx?id=" target="_blank">
	    						<img src="images/mc48.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				<li>
	    					<a href="ProductDetails.aspx?id=" target="_blank">
	    						<img src="images/mc49.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				<li>
	    					<a href="ProductDetails.aspx?id=" target="_blank">
	    						<img src="images/mc50.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				<li>
	    					<a href="ProductDetails.aspx?id=" target="_blank">
	    						<img src="images/mc51.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				<li>
	    					<a href="ProductDetails.aspx?id=" target="_blank">
	    						<img src="images/mc52.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				<li>
	    					<a href="ProductDetails.aspx?id=" target="_blank">
	    						<img src="images/mc53.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				<li>
	    					<a href="ProductDetails.aspx?id=" target="_blank">
	    						<img src="images/mc54.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				<li>
	    					<a href="ProductDetails.aspx?id=" target="_blank">
	    						<img src="images/mc55.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    					<div class="gray">已被购买</div>
	    				</li>
	    				<li>
	    					<a href="ProductDetails.aspx?id=" target="_blank">
	    						<img src="images/mc56.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				<li>
	    					<a href="ProductDetails.aspx?id=" target ="_blank">
	    						<img src="images/mc57.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    				
	    				<li>
	    					<a href="ProductDetails.aspx?id=" target="_blank">
	    						<img src="images/mc58.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>	 
	    				<li>
	    					<a href="ProductDetails.aspx?id=" target="_blank">
	    						<img src="images/mc31.jpg"  />
	    						<p>Mazzzk<br />魅刻</p>
	    					</a>
	    				</li>
	    			</ul>
	    		
	    		    <div id="pre"><div class="pre"></div></div>
	    		    <div id="next"><div class="next"></div></div>
	    		</div>
	    	</div>
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
	    				<li class="margin_bt"><a class="foot_c">客服中心</a></li>
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
                            <a href="Buyers-Login.aspx" style="color:white;">买手入口</a>
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