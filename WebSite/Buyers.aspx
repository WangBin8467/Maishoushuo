<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Buyers.aspx.cs" Inherits="WebSite.Buyers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!--数据绑定-->
    <div class="BottomLeft">
     <asp:listView ID="ListView1" runat="server" >                       
         <LayoutTemplate>
                 <table>
                     <tr style="font-family:YouYuan ;font-size:18px;">
                         <td class="txtname">买手名</td>
                         <td class="txtsex">性别</td>
                         <td class="txtarea">所在地区</td>
                         <td class="txtdetails1">代购详情</td>
                     </tr>
                      <tr>
                          <td id="itemPlaceHolder" runat="server"></td>

                       </tr>
                     
                  </table> 
         </LayoutTemplate>
	     <ItemTemplate>
                  
                  <tr >
                    <td class="txtname" style="color:red; ">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Buyers_name")%>'></asp:Label>
                    </td>
                    <td class="txtsex">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Buyers_sex")%>'></asp:Label>
                    </td>
                    <td class="txtarea">
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Buyers_area")%>'></asp:Label>
                    </td>
                    <td class="txtdetails">
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Buyers_details")%>'></asp:Label>
                    </td>
                  </tr>      
         </ItemTemplate>
    </asp:listView>
    </div>
</asp:Content>
