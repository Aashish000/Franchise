<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="editfranchiser.aspx.cs" Inherits="editfranchiser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="user-container">
         <div class ="user-header">
             <ul class="user-navigation">
                  <%
                          dbConnection db = new dbConnection();
                          string query = "select * from users";
                          System.Data.SqlClient.SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter(query, db.con);
                          db.openConnection();
                          System.Data.DataSet ds = new System.Data.DataSet();
                          da.Fill(ds, "users");
                          int id = Convert.ToInt16(Request.QueryString["id"]);   
                   
                      %>
                   <li> <a href="franchiser.aspx?id=<%=id %>" style="color:black">Dashboard</a></li>
                    <li> <a href="#" style="color:black">Activities</a></li>
                    <li> <a href="logout.aspx" style="color:black">Logout</a></li>

                </ul>
            <h2>Welcome Franchiser</h2><br/>
         </div>
         <div class="user-content">
            <h3>Personal Details</h3>
             <asp:Label ID="msg" runat="server" Text="Label"></asp:Label>
             <asp:Literal ID="ltrmsg" runat="server"></asp:Literal>
             <table class="auto-style1">
               <tr>
                    <th class="auto-style5">Franchiser Name</th>
                    <td class="auto-style4">
                        <asp:TextBox ID="name" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style3">Franchiser Email</th>
                    <td class="auto-style6">
                        <asp:TextBox ID="email" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style7">Username</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="username" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style7">Password</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="password" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <th class="auto-style7">Confirm Password</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="confirm_password" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style7">Address</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="address" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style7">Country</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="country" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style7">State</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="state" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style7">City</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="city" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style7">Contact</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="contact" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style7">Occupation</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="occupation" runat="server"></asp:TextBox>
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

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 365px;
            height: 42px;
        }
        .auto-style4 {
            height: 45px;
        }
        .auto-style5 {
            width: 365px;
            height: 45px;
        }
        .auto-style6 {
            height: 42px;
        }
        .auto-style7 {
            width: 365px;
            height: 40px;
        }
        .auto-style8 {
            height: 40px;
        }
    </style>
</asp:Content>