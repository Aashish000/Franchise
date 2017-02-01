<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="home" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
               <div class="banner">
               <div class="heading"> 
                    <h1> Find a Franchise... </h1>
                </div>
                <div class="search">
                     <div class="bcolor">
                        <asp:TextBox ID="searchlabel" runat="server" placeholder="  search for franchise..." Height="41px" Width="348px"></asp:TextBox>
                        <asp:Button ID="searchbtn" runat="server" Text="search" OnClick="search_Click"  />
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
        
        <div class="latest-franchise">
            <div class="container-header">
                <h1>Latest Franchises</h1>
            </div>
        <% 
         db.closeConnection();
         string query1 = "select top 4 * from franchise";
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
            <li class="latest-franchises">
                
                <a href="franchisedetail.aspx?id=<%=id %>" style="text-align:center">
                    <div class="view">
                    <h4 class="view-text">View Details </h4>
                    </div>
                    <img class="categories-image" src="uploads/<%= logo %> " height="200" width="230"/><br/><%= name %></a>
            </li>
        </ul>
         <%
                                    }
                                    db.closeConnection();
                                    
         %>
          
     </div> 
        
     <div class="franchise">
         <div class="container-header">
            <h1>Franchises</h1>
        </div>
        <% 
         db.closeConnection();
         string query2 = "select top 20 * from franchise";
         db.cmd = new System.Data.SqlClient.SqlCommand(query2, db.con);
         db.openConnection();
         db.dr = db.cmd.ExecuteReader();
            while (db.dr.Read())
              {
              string name = db.dr[1].ToString();
              string logo = db.dr[4].ToString();
              int id = Convert.ToInt32(db.dr[0].ToString());
        %> 
        
        <ul>
            <li class="latest-franchises">
                
                <a href="franchisedetail.aspx?id=<%=id %>" style="text-align:center">
                    <div class="view">
                        <h4 class="view-text">View Details </h4>
                    </div>
                    <img class="categories-image" src="uploads/<%= logo %> " height="200" width="230"/><br/><%= name %>
                </a>
            </li>
        </ul>
         <%
                                    }
                                    db.closeConnection();
                                    
         %>
        </div>
            
   </div>
</asp:Content>

