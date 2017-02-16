<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewfranchise.aspx.cs" Inherits="viewfranchise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder1" Runat="Server">
    
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
               <div class="view-cat" style="margin-top:87px;width:1233px;margin-left:60px">
                <ul id="lightSlider">
                    
                   <%
                       dbConnection db2 = new dbConnection();
                      
                       string query = "select* from categories";
                       db2.cmd = new System.Data.SqlClient.SqlCommand(query, db2.con);
                       db2.openConnection();
                       db2.dr = db2.cmd.ExecuteReader();
                            while (db2.dr.Read())
                                    {
                                        string name = db2.dr[1].ToString();
                                       
                                        string image = db2.dr[2].ToString();
                                        int id = Convert.ToInt32(db2.dr[0].ToString());
                                       
                                       
                    %>
                  
                      
                          <li> <a href="viewfranchise.aspx?id=<%= id %>"><img class="categories-image" src="uploads/<%= image %> " height="80" width="80"/><br/><%= name %></a></li>               
                      
                            
                  
                   <%
                                    }
                                    db2.closeConnection();

                   %>
                            
                   </ul>
               </div>
           </div>


    <div class="categories">
        <div class="content-header">
            <h2>Franchises</h2>
        </div>
        
     <%
                       dbConnection db = new dbConnection();
                      
                    if (Request.QueryString["id"] != null)
                    {

                        string query1 = "select * from franchise where catid='" +Request.QueryString["id"]+ "'";
                        db.cmd = new System.Data.SqlClient.SqlCommand(query1, db.con);
                        db.openConnection();
                        db.dr = db.cmd.ExecuteReader();
                         if (db.dr == null || !db.dr.HasRows)
                        {
                            %>
                            <h1>NO record for this category</h1>
                        <%
                        }
                                while (db.dr.Read())
                                      {
                                      string name = db.dr[1].ToString();
                                      string logo = db.dr[4].ToString();
                                      int id = Convert.ToInt32(db.dr[0].ToString());
    
                            %>
         <ul style="overflow:visible">
            <li>
                <a href="franchisedetail.aspx?id=<%=id %>" style="text-align:center;color:black"><img class="categories-image" src="uploads/<%= logo %> " height="200" width="200"/><br/><%= name %></a>
            </li>
        </ul>
          <%
                                    }
                                    db.closeConnection();
                                    }
         %>
    </div>
</asp:Content>


