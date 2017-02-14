<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="directories.aspx.cs" Inherits="directories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
        <div class="latest-franchises">
            <div class="container-header">
                <h1>Directories</h1>
            </div>

        
    <%
        dbConnection db = new dbConnection();
        string query = "select * from franchise";
        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(query, db.con);
        db.openConnection();
        db.dr = cmd.ExecuteReader();
        while (db.dr.Read())
        {
            string name = db.dr[1].ToString();
            string logo = db.dr[4].ToString();
            int id = int.Parse(db.dr[0].ToString());
          
    %>
        
        <ul>
            <li class="latest-franchises">
                <a href="franchisedetail.aspx?id=<%=id %>" style="text-align:center;color:black"><img class="categories-image" src="uploads/<%= logo %> " height="200" width="200"/><br/><%= name %></a>
            </li>
        </ul>
           
   <%} %>
            </div>
     </div>
</asp:Content>


