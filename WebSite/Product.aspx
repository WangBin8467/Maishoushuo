<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Website.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main_wrapper">
		<div class="main clearfix">
			<div class="main_left" id="listScreen">			
				<div class="main_left1">
					<div class="main_tab">
						<h2 class="tab">												
                                <asp:Button ID="Button1" runat="server" Text="商品分类"  CssClass="buttton" OnClick="All_OnClick"/>							
						</h2>						
					</div>
					<div class="main_tab">
						<h2 class="tab">							
                                <asp:Button ID="Button2" runat="server" Text="男仕" CssClass="buttton" OnClick="Man_OnClick"  />												
						</h2>										
					</div>
					<div class="main_tab">
						<h2 class="tab">							
                                <asp:Button ID="Button3" runat="server" Text="女士" CssClass="buttton" OnClick="Woman_OnClick"  />												
						</h2>						
					</div>
					<div class="main_tab">
						<h2 class="tab">							
                                <asp:Button ID="Button4" runat="server" Text="价格升序" CssClass="buttton" OnClick="PriceUp_OnClick"  />							
						</h2>						
					</div>
					<div class="main_tab"> 
					    <h2 class="tab">						
                            <asp:Button ID="Button5" runat="server" Text="价格降序" CssClass="buttton" OnClick="PriceDown_OnClick"  />						
					    </h2>										
				    </div>
			</div>
		</div>		
			<div class="main_right">
				
                <!--商品栏-->
				<div class="mr_img">					
					   <ul class="mr_ul" style="display: block;">                        
                          <!--数据绑定-->
                          <asp:listView ID="LVPro1" runat="server"  GroupItemCount="4" >                       
                            <GroupTemplate>
                             <asp:PlaceHolder ID="itemPlaceholder" runat="server" />       
                            </GroupTemplate>                  
	    		            <ItemTemplate>
                                <li>
                                <a href="<%#"ProductDetails.aspx?id="+Eval("Pro_id")%>" target="_blank"><asp:Image ID="Pro_img7" class="good_img" runat="server" ImageUrl='<%#Eval("Pro_img") %>'/></a>
                		        <div class="mr_detail">
                                  <h5><%#Eval("Pro_name")%></h5>
                                  <h6><%#Eval("Pro_main")%></h6>
                                  <p>￥<%#Eval("Pro_price")%></p>
                                </div>
                                </li>	
                            </ItemTemplate>
                          </asp:listView>                       											
					  </ul>			 
                <!-- 分页管理 -->   
                <div  class="DataPage">                 
                <div class="DataPage1" >
                      <asp:DataPager runat="server"  PagedControlID="LVPro1" PageSize="8" ID="DataPager1" OnPreRender="DataPager1_PreRender">
                                <Fields>
                                    <asp:NextPreviousPagerField ShowFirstPageButton="true" FirstPageText="首页" PreviousPageText="上一页" ShowNextPageButton="false" ButtonCssClass="btn btn-default btn-sm" />
                                    <asp:NumericPagerField ButtonCount="4" NumericButtonCssClass="btn btn-default btn-sm" />
                                    <asp:NextPreviousPagerField ShowPreviousPageButton="false" LastPageText="尾页" NextPageText="下一页" ShowNextPageButton="true" ShowLastPageButton="true"  ButtonCssClass="btn btn-default btn-sm"/>
                                </Fields>
                      </asp:DataPager>
                 </div>
                 </div>
		     </div> 
            </div>     
     </div>

    </div>
</asp:Content>
