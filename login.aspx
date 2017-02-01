<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!DOCTYPE html>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: left;
        }
        .auto-style3 {
            width: 136px;
        }
        .auto-style4 {
            width: 142px;
        }
    </style>
 
    <div class="login-box">
        <div class="logo">
            <a href="index.aspx"> <h2 style="text-align:center"> Login </h2> </a>
        </div>
        <div class="login-body">
            
            <table class="auto-style1">
                <asp:Label ID="msg" runat="server" Text="Label"></asp:Label>
                <asp:Literal ID="ltrmsg" runat="server"></asp:Literal>
                <tr>

                    <td class="auto-style2">
                       
                        <br />
                        Username:
                        <br />
                        <br />
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="username" runat="server" Height="17px"></asp:TextBox>
                        <br />
                    </td>
                    <td class="auto-style4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username" ErrorMessage="Username required" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <br />
                        Password:<br />
                        <br />
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="password" runat="server" Height="22px" TextMode="Password"></asp:TextBox>
                        <br />
                    </td>
                    <td class="auto-style4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" ErrorMessage="Password required" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        Login As</td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="role" class="TextBox" runat="server">
                            <asp:ListItem Value="franchiser">Franchiser</asp:ListItem>
                            <asp:ListItem Value="investor">Investor</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                    </td>
                    <td class="auto-style4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" style="text-align: center" Text="Login" Width="80px" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>

        </div>
    </div>



  
      
</asp:Content>

