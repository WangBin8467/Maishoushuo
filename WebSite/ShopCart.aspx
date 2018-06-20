<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShopCart.aspx.cs" Inherits="WebSite.ShopCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--网页主体内容-->
	    <div class="main_wrapper">
	    <div class="main">  
            <asp:Panel ID="Panel01" runat="server">  	
	    	<div class="buycar">
	    		<div class="buycar_h">
	    			<div class="bcr_01">
	    				<label class="gg" for="check_all">
	    					<label class="check_all" />
	    				</label>
	    			</div>
	    			<div class="bcr_02">商品信息</div>
	    			<div class="bcr_03">单价</div>
	    			<div class="bcr_04">数量</div>
	    			<div class="bcr_05">小计</div>
	    		</div>

                <%--订单栏--%>	    		
	    		<div class="buycar_m">
	    			<div class="pro_detail">
                        <asp:Repeater ID="rtShoppingCart" runat="server" OnItemCommand="rtShoppingCart_ItemCommand">
                        <ItemTemplate>
                        <%--商品信息--%>
	    				<div class="impor">
	    					<label  class="check_pro" />                           
		    				<div class="pro_img">
                           
                                <asp:Image ID="Image1" runat="server" CssClass="pi_img" ImageUrl='<%#Eval("Pro_img") %>'/>
                            </div>
		    				<div class="pd">
		    				  	<div class="pd_head">
		    				  		 <%#Eval("Pro_name")%>
		    				  		<br />
									<%#Eval("Pro_main")%>
		    				  	</div>		    				  	
	    				  	</div>
	    				</div>
	    				
	    				<%--单价--%>
	    				<div class="pd_price">￥<asp:Label ID="lblPrice" runat="server" Text='<%#Eval("Pro_price")%>' /></div>
	    				
    				  	<%--数量--%>
    				  	<div class="pd_count">
    				  		<div class="pd_count_sum">
    				  			<asp:TextBox ID="sqlMallNumber" runat="server" type="text" CssClass="shu" Text='<%# Eval("Qty")%>'></asp:TextBox>
                                  <asp:LinkButton ID="NumAdd" runat="server" class="pro_size_a" CommandName="ChageNum" ><img src="images/新东方-刷新图标.png" /></asp:LinkButton>                         
    				  		</div>
                            <asp:Label ID="LabelShoppingCartID" runat="server" Visible="false" Text='<%#Eval("ShopCart_id")%>' />
    				  	</div>
    				  	<%--小计--%>
    				  	<div class="subtotal">￥<%#Eval("Sales_tprice")%></div>
    				  	<%--加入收藏删除--%>
    				  	<div class="delete">
    				  	 	<div class="haolei">
    				  			<a  class="del"><asp:LinkButton ID="Mallclose" runat="server" CssClass="delBtn" Text="删除" CommandName="Delete" /></a>
    				  	 	</div>   				  		
    				  	</div>	    					    			                         
                        </ItemTemplate>
                        </asp:Repeater>
                    </div>
	    		</div>
                                
	    		<asp:Repeater ID="trShoppingCartBuy" runat="server" OnItemCommand="trShoppingCartBuy_ItemCommand">
                <ItemTemplate>
	    		<div class="last_car">
	    		  	<div class="last_h">		    				    			
		    			<div class="last_car_02">
			    			合计（不含运费、税费）：
			    			<span class="last_car_02_sum">￥<%--<i id="last_car_02_sum">--%><asp:Label ID="FinalTotalAmount" runat="server" Text='<%#Eval("FinalTotalAmount")%>'></asp:Label><%--</i>--%></span>
	                    </div>  
                    </div>                                                    
                    <div class="last_m">
	                    	<a href="Product.aspx" id="back">继续购物</a>
	                    	<a >
                                <asp:LinkButton ID="BuyBuyBuy" runat="server"  CssClass="now_sum" CommandName="BuyBuy"  Text="立即购买" ></asp:LinkButton>
	                    	</a>
                    </div>                        	    		    
                 </div>
	    		 </ItemTemplate>
                 </asp:Repeater>                                
            </div>         
            </asp:Panel>
            <asp:Panel ID="Panel02" runat="server">
             <%--购物车什么都没有！--%>
               <a style="text-align:center"><img src="images/Nobody.png" /></a> 
            </asp:Panel>
        </div>
        </div>
    
</asp:Content>
