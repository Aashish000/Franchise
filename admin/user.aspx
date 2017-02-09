<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="admin_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="content-header">
        <h1>Users</h1>
    </div>
    <div class="content">
       
        <table class ="infotable">
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Username</th>
                <th>Address</th>
                <th>Country</th>
                <th>State</th>
                <th>City</th>
                <th>Contact</th>
                <th>Occupation</th>
                <th>Role</th>
            </tr>
             <%
            dbConnection db = new dbConnection();
            string query = "select * from users";
            db.cmd = new System.Data.SqlClient.SqlCommand(query, db.con);
            db.openConnection();
            db.dr = db.cmd.ExecuteReader();
            while (db.dr.Read())
            { 
                string name = db.dr[1].ToString();
                string email = db.dr[2].ToString();
                string username = db.dr[3].ToString();
                string address = db.dr[5].ToString();
                string country = db.dr[6].ToString();
                string state = db.dr[7].ToString();
                string city = db.dr[8].ToString();
                string contact = db.dr[9].ToString();
                string occupation = db.dr[10].ToString();
                string role = db.dr[11].ToString();           
             %>
            <tr>
                <td><%= name %></td>
                <td><%= email %></td>
                <td><%= username %></td>
                <td><%= address %></td>
                <td><%= country %></td>
                <td><%= state %></td>
                <td><%= city %></td>
                <td><%= contact %></td>
                <td><%= occupation %></td>
                <td><%= role %></td>
            </tr>
            <%
            }
                db.closeConnection(); 
                %>
        </table>
    </div>

</asp:Content>


