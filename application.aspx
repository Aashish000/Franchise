<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="application.aspx.cs" Inherits="application" %>

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
                    <li> <a href="franchise.aspx?id=<%=id %>" style="color:black">Activities</a></li>
                      
                 <li> <a href="logout.aspx" style="color:black">Logout</a></li>

                </ul>
            <h2 style="float:left"> Applications&nbsp&nbsp </h2><br/>
        </div>
        <div class="user-content">
           
       <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        <asp:Literal ID="ltrmsg" runat="server"></asp:Literal>
           
    </div>
</div>





</asp:Content>


