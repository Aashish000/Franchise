<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="home" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
               <div class="banner">
               <div class="heading"> 
                    <h1> Find a Franchise... </h1>
                </div>
                <div class="search">
                     <div class="bcolor">
                        <asp:TextBox ID="searchlabel" runat="server" placeholder="  search..." Height="41px" Width="348px"></asp:TextBox>
                        <asp:Button ID="searchbtn" runat="server" Text="search" />
                     </div>
                </div>
               <div class="categories">
                   <%
                       dbConnection db = new dbConnection();
                      
                       string query = "select* from categories";
                       db.cmd = new System.Data.SqlClient.SqlCommand(query, db.con);
                       db.openConnection();
                       db.dr = db.cmd.ExecuteReader();
                            while (db.dr.Read())
                                    {
                                        string name = db.dr[1].ToString();
                                       
                                        string image = db.dr[2].ToString();
                                        int id = Convert.ToInt32(db.dr[0].ToString());
                                       
                                       
                    %>
                   <ul>
                        <li> <a href="viewfranchise.aspx?id=<%= id %>"><img class="categories-image" src="uploads/<%= image %> " height="80" width="80"/><br/><%= name %></a></li>
                      
                            
                   </ul>
                   <%
                                    }
                                    db.closeConnection();

                   %>
               </div>
           </div>
    <div class="container">
        <h2>Latest Franchises</h2>
        <% 
         db.closeConnection();
         string query1 = "select top 5 * from franchise";
         db.cmd = new System.Data.SqlClient.SqlCommand(query1, db.con);
         db.openConnection();
         db.dr = db.cmd.ExecuteReader();
            while (db.dr.Read())
              {
              string name = db.dr[1].ToString();
              string logo = db.dr[4].ToString();
              int id = Convert.ToInt32(db.dr[0].ToString());
        %> 
        
        <ul>
            <li>
                <a href="franchisedetail.aspx?id=<%=id %>" style="text-align:center"><img class="categories-image" src="uploads/<%= logo %> " height="200" width="200"/><br/><%= name %></a>
            </li>
        </ul>
         <%
                                    }
                                    db.closeConnection();
                                    
         %>
   </div>
</asp:Content>

