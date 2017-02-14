<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewapplication.aspx.cs" Inherits="viewapplication" %>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      
    <%
                       dbConnection db = new dbConnection();
                      
                     if (Session["username"] != null)
                    {              
                         if(Session["role"]== "investor")    
                         {      
                            string query = "select* from users where username ='" + Session["username"] + "'";
                            db.cmd = new System.Data.SqlClient.SqlCommand(query, db.con);
                            db.openConnection();
                            db.dr = db.cmd.ExecuteReader();
                                while (db.dr.Read())
                                            {
                                                string name = db.dr[1].ToString();
                                                string email = db.dr[2].ToString();
                                                string username = db.dr[3].ToString();
                                                string password = db.dr[4].ToString();
                                                string address = db.dr[6].ToString();
                                                string country = db.dr[7].ToString();
                                                string state = db.dr[8].ToString();
                                                string city = db.dr[9].ToString();                                                                          
                                                string contact = db.dr[10].ToString();
                                                string occupation = db.dr[11].ToString();
                                                int id = Convert.ToInt32(db.dr[0].ToString());
                                                
                %>
    <div class="user-container">
         <div class ="user-header">
            <h3 style="padding: 9px">Welcome <small><%= name %></small>&nbsp </h3>
         </div>
             <div class="user-navigation">
                  <ul>                 
                        <li> <a href="investor.aspx" style="color:#FFFFFF">Dashboard</a></li>
                      <li> <a href="viewapplication.aspx?id=<%=id %>" style="color:#FFFFFF">Application</a></li>
                        <li> <a href="logout.aspx" style="color:#FFFFFF">Logout</a></li>
                 </ul>
             </div>
           
       
        <%
        }
        db.closeConnection();
        } %>
          <div class="user-content">
            <table class="franchiseinfo">
                <tr>
                    <th>S.NO</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Country</th>
                    <th>City</th>
                    <th>Address</th>
                    <th>Occupation</th>
                    <th>Education Qualification</th>
                    <th>Status</th>

                </tr>
                <%
                    
                    db.closeConnection();
                     if (Request.QueryString["id"] != null)
                    {
                          
                        string data = "select * from application where uid='" + Request.QueryString["id"] + "'";
                        db.cmd = new System.Data.SqlClient.SqlCommand(data, db.con);
                        db.openConnection();
                        db.dr = db.cmd.ExecuteReader();
                        int count=1;
                         if (db.dr == null || !db.dr.HasRows)
                        {
                            %>
                            <tr><td>NO record for this category</td></tr>
                        <%
                        }
                        else 
                        {
                        while (db.dr.Read())
                        {
                            int appid = int.Parse(db.dr["id"].ToString());
                            aid.Text = appid.ToString();
                            string name = db.dr[1].ToString();
                            string email = db.dr[2].ToString();
                            string country = db.dr[3].ToString();
                            string city = db.dr[4].ToString();
                            string address = db.dr[5].ToString();
                            string occupation = db.dr[6].ToString();
                            string education_qualification = db.dr[7].ToString();                  
                            string status = db.dr["status"].ToString();
                            int fid = int.Parse(db.dr["fid"].ToString());


                            %>
                        
                        
              
                
                    <tr>
                       
                        <td><%= count %>
                   
                            <asp:Label ID="aid" runat="server" Text="Label"></asp:Label>
                            
                
                         
                    </td>
                    <td><%=  name %></td>
                    <td><%= email %></td>
                    <td><%= country %></td>
                    <td><%= city %></td>
                    <td><%= address %></td>
                    <td><%= occupation %></td>
                    <td><%= education_qualification %></td>
                    <td><%= status %></td>

         

       
         
         <%
                                    }
                                    db.closeConnection();
                                    }  
                                    }  
                                    }                     
         %>
                </table>
               </div>
        </div>
 
</asp:Content>

