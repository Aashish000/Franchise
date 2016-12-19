<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
  
    <div class="franchiser-login">
      <h1>Franchisers Login</h1> 
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
                    <td class="auto-style2" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" style="text-align: center" Text="Login" Width="80px" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>

        </div>

  
      
</asp:Content>

