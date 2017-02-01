<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="search">
         <%
                    
              if (Request.QueryString["search"]!= null)
            {
                dbConnection db = new dbConnection();
                //string search = Session["search"].ToString();
                string search = Request.QueryString["search"].ToString();
                string query = "select * from franchise where franchise_name like '%" + search + "%'";
                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(query, db.con);
                db.openConnection();
                System.Data.SqlClient.SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();

                string name = search;
                if (dr[1] == null)
                {
                    %>
                    <h2>NO record for this category</h2>
        
                   
                <%       
                    
                } 
                %>
                  <h2>Search Result For "<%= name %>"</h2>
        <%
                db.closeConnection();
                string query1 = "select * from franchise where franchise_name like '%" + search + "%'";
                db.cmd = new System.Data.SqlClient.SqlCommand(query1, db.con);
                db.openConnection();
                db.dr = db.cmd.ExecuteReader();
                while (db.dr.Read())
                {

                                      string franchise_name = db.dr[1].ToString();
                                      string logo = db.dr[4].ToString();
                                      int id = Convert.ToInt32(db.dr[0].ToString());
    
                         %>
          <ul style="overflow:visible">
            <li>
                
                <a href="franchisedetail.aspx?id=<%=id %>" style="text-align:center;color:black"><img class="categories-image" src="uploads/<%= logo %> " height="200" width="200"/><br/><%= franchise_name %></a>
            </li>
        </ul>
          <%
                                    }
                                    db.closeConnection();
                                    }
                                    else
                                    {
                                    %>
        <h3>Search Results not found</h3>
        <%
              }
         %>

    </div>





</asp:Content>

