﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin_admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="content-header">
    <h1> Admin&nbsp
             <%if( Session["roles"].ToString() == "superadmin")
                {
            %>
         <a href="addadmin.aspx" style="color:black">  
            
            <img src="../images/add.png" height="20" width="20"/> </a></h1>
         <%}%>
    </div>
    <div class="content">
        <asp:Label ID="msg" runat="server" Text="Label"></asp:Label>
        <asp:Literal ID="roles" runat="server"></asp:Literal>
        <table class ="infotable">
            <tr>
                
                
          
                <th>Username</th>
                <%if( Session["roles"].ToString() == "superadmin")
                {
                     %>
                <th>Password</th>
                <th>Action</th>
               <%-- <th>Action</th>--%>
                 <%} %>
                <th>Role</th>
                
               <%-- <th>Status</th> --%>

            </tr>
             <%
            
            dbConnection db = new dbConnection();
            string query = "select * from admin";
            db.cmd = new System.Data.SqlClient.SqlCommand(query, db.con);
            db.openConnection();
            db.dr = db.cmd.ExecuteReader();
            while (db.dr.Read())
            { 
                int id = int.Parse(db.dr[0].ToString());
                string username = db.dr["username"].ToString();
                string password = db.dr["password"].ToString();
                string role = db.dr["role"].ToString();
                string status = db.dr["status"].ToString();
                
             %>
         
            <tr>
             
                <td><%= username %></td>
                
                 <%if( Session["roles"].ToString() == "superadmin")
                {
                     %>
                <td><%=password %></td>
                <td>
                <a href="?id=<%=id %>" style="color:blue">Delete</a>
                </td>
                <%} %>
                <td><%= role %></td>
                <%--<td><%= status %></td>--%>
          
               <%-- <td>
                  
                    <% if(status == "active"){ %>
                    <a onclick="return alert('account deactivated')" href="?id=<%= id %>" >
                        <asp:Label ID="lbldeactive" runat="server" Text="deactive"   style="color: #fff;background:#f00"></asp:Label>
                    </a>
                    <%
                    } %>
                    <%
                    else
                    { %>
                    <a onclick="return alert('account activated')" href="?uid=<%= id %>">
                        <asp:Label ID="Label1" runat="server" Text="active" style="color: #fff;background:#009900"></asp:Label>
                    </a>
                    <%} %>
                </td>--%>
                      <%--<td>
                <a href="?id=<%=id %>" style="color:blue">Delete</a>
                </td>--%>
            </tr>
            <%
            }
                db.closeConnection(); 
                %>
        </table>
    </div>
</asp:Content>


