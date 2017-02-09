<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="changepassword.aspx.cs" Inherits="changepassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="user-container">
       
             <div class="user-navigation">
                      <ul>
                       <li> <a href="investor.aspx" style="color:#FFFFFF">Dashboard</a></li>
                        <li> <a href="logout.aspx" style="color:#FFFFFF">Logout</a></li>
                    </ul>
                </div>
           <div class ="user-header">
                <h2 style="float:left"> Edit Investor&nbsp&nbsp </h2><br/>
            </div>
        
         <div class="user-content">
             <asp:Label ID="msg" runat="server" Text="Label"></asp:Label>
             <asp:Literal ID="ltrmsg" runat="server"></asp:Literal>             
             
             <table>
                 
             
                <tr>
                    <th class="auto-style7">Username</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="username" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style7">Old Password</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="oldpassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style7">New Password</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="newpassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <th class="auto-style7">Confirm Password</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="confirm_password" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <th class="auto-style7">&nbsp;</th>
                    <td class="auto-style8">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Update" />
                    </td>
                </tr>
            </table>
             </div>
       </div>
    

</asp:Content>


