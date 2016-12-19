<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewfranchise.aspx.cs" Inherits="viewfranchise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder1" Runat="Server">
    <div class="categories">
     <%
                       dbConnection db = new dbConnection();
                      
                    if (Request.QueryString["id"] != null)
                    {

                        string query = "select * from franchise where catid='" +Request.QueryString["id"]+ "'";
                        db.cmd = new System.Data.SqlClient.SqlCommand(query, db.con);
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


