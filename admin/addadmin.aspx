<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="addadmin.aspx.cs" Inherits="admin_addadmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
        <div class="content-header">
            <h1>Add Admin</h1>
        </div>
        <div class="content">
              <asp:Label ID="msg" runat="server" Text="Label"></asp:Label>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style11">
                        <br />
                        Username:</td>
                    <td class="auto-style8">
                        <br />
                        <asp:TextBox ID="username" runat="server" Width="195px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <br />
                        <asp:RequiredFieldValidator ID="Requiredusername" runat="server" ControlToValidate="username" ErrorMessage="Categories Name required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td class="auto-style11">
                        <br />
                        Password:</td>
                    <td class="auto-style8">
                        <br />
                        <asp:TextBox ID="password" runat="server" Width="195px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <br />
                        <asp:RequiredFieldValidator ID="requiredpwd" runat="server" ControlToValidate="password" ErrorMessage="Password required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
               
               <%--  <tr>
                    <td class="auto-style7">Role</td>
                    <td class="auto-style8">
                         <asp:DropDownList class="TextBox" ID="role" runat="server">
                             <asp:ListItem  Value="franchiser">SuperAdmin</asp:ListItem>
                             <asp:ListItem  Value="subadmin">SubAdmin</asp:ListItem>
                          </asp:DropDownList>
                    </td>
                    <td class="auto-style9">
                        &nbsp;</td>
                </tr>--%>
               
                 <tr>
                    <td class="auto-style2" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
                        <input id="Reset1" type="reset" value="Reset" /></td>
                </tr>
            </table>
        </div>
   



</asp:Content>


