<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="Website.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      
    <div class="main_wrapper">
	    <div class="main">
	    	<!--商品详情-->
            <asp:listView ID="LVPD2" runat="server"   OnItemCommand="ShoppingProduct" OnPreRender="LVPD2_PreRender">                      
                <GroupTemplate>
                   <asp:PlaceHolder ID="itemPlaceholder" runat="server" />       
                </GroupTemplate>                  
	            <ItemTemplate> 
	    	       <div class="product">
                        <!--商品详情左侧-->
	    		        <div class="pro_left clearfix">	    				    			
	    			        <div class="pro_left_box">
	    				        <ul id="pro_middle_img">
	    					        <li class="li_hide"><asp:Image ID="Pro_img" class="lazy" width="384" height="460" runat="server" ImageUrl='<%# Eval("Pro_img")%>' /></li>                              					
	    				        </ul>	    				
	    			        </div>
	    	            </div>
	    		        <!--商品详情右侧-->
	    		        <div class="pro_right float_l">                                                                                    		        
                            <h2 style="color:red;font-weight:bolder"><%#Eval("Pro_name")%></h2>
                            <p id="content"><%#Eval("Pro_main")%></p>
                            <div class="pro_rightr_pice">￥<%#Eval("Pro_price")%></div>
                            <div class="pro_right_color">
                                <span>买手&nbsp;&nbsp;&nbsp;&nbsp;   <a href="# target="blank" style="color:red;font-weight:bolder"> <%#Eval("Buyers_name")%> </a></span>
	    			        </div>
                       
	    			        <div class="pro_right_size">
	    				    <div class="pro_size">
	    					    <span>数量</span>
                                <asp:LinkButton ID="NumMinus" runat="server"  class="pro_size_a" CommandName="Minus">-</asp:LinkButton>
                                <asp:TextBox ID="TextNum" runat="server" class="pro_size_a" Text='<%#ViewState["ShoppingCartNumber"]%>'></asp:TextBox>
                                <asp:LinkButton ID="NumAdd" runat="server" class="pro_size_a" CommandName="Add">+</asp:LinkButton>
	    				    </div>
	    			        </div>	                                                  
	    			       <div class="pro_right_gg clearfix">
                              <asp:LinkButton ID="add_buycar" runat="server" CommandName="AddShoppingCart" CssClass="add_buycar">加入购物袋</asp:LinkButton>
	    			       </div>
	    			       <div class="pro_other">
	    				   <p>
	    					 <span>到货时间</span>
	    					 <i>该商品到货时间预计3-5个工作日</i>
	    				   </p>
	    				   <p>
	    				    <span>退货说明</span>
	    					<i>若该商品无质量问题不支持退换货</i>
	    				   </p>
	    			       </div>
                      </div> 
	    		      </div>
                 
	    </div>   
    </div>	        

	        <!--btn商品详情-->
        	<div class="btn_detail">
        		<a  class="bac_color" id="btn_pro_detail">商品详情</a>       		
        	</div>

	        <!--tab切换-->
	        <div class="tab_over">
	       	 	<div class="btn_detail_1" style="display: block;">
			 <!--商品信息-->
			        <div class="product_information">
			        	<h3>
			        		<div class="recommend_h">
			        			<p>Product Information</p>
			        			<p style="color: #666;font-size: 12px;">商品信息</p>
			        		</div>
			        	</h3>
			        	<div class="product_information_info">
			        		<div class="information_info">
			        			<p style="font-size:12px; font-weight:bolder">
                                    <%#Eval("Pro_details")%>
			        			</p>
			        		</div>
			        	</div>
			        </div>			                           			        
	        
    </ItemTemplate>
            </asp:listView>  
         </div>
     </div>	 
</asp:Content>
