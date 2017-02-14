<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="application.aspx.cs" Inherits="application" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="user-container">
         <div class ="user-header">
            <h2 style="float:left"> Applications&nbsp&nbsp </h2><br/>
      </div>
             <div class="user-navigation">
                  <%
                      if (Session["role"] == "franchiser")
                      {
                          dbConnection db = new dbConnection();
                          string query = "select * from users";
                          System.Data.SqlClient.SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter(query, db.con);
                          db.openConnection();
                          System.Data.DataSet ds = new System.Data.DataSet();
                          da.Fill(ds, "users");
                          int id = Convert.ToInt16(Request.QueryString["id"]);   
                   
                      %>
                 <ul>
                   <li> <a href="franchiser.aspx">Dashboard</a></li>
                    <li> <a href="franchise.aspx">Activities</a></li>
                      
                 <li> <a href="logout.aspx">Logout</a></li>
                </ul>
                </div>
            
        
          
        <div class="user-content">
            <asp:label ID="msg" runat="server"></asp:label>
             <asp:TextBox ID="user_id" runat="server"></asp:TextBox>
             <asp:TextBox ID="uid" runat="server"></asp:TextBox>
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
                    <asp:Label ID="no" runat="server" Text="Label"></asp:Label>
                    <th>Status</th>

                </tr>
                <%
                    
                    db.closeConnection();
                     if (Request.QueryString["id"] != null)
                    {
                          
                        string data = "select * from application where fid='" + Request.QueryString["id"] + "'";
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
                    <td><%if(status == "not approved"){ %> 
                        <a href="?franid=<%=fid %>">
                        <asp:Label ID="lblnot" runat="server" Text="not approved" style="color: #fff;background:#f00"></asp:Label>
                    </a>
                        <%} %>
                        <%else if(status == "approved") { %>
                         <a href="?fid=<%=fid %>">
                        <asp:Label ID="lblapproved" runat="server" Text="approved" style="color: #fff;background:#009900"></asp:Label>
                          </a>
                       
                         <%} %>
                   
                   </td>  
                    <td>
                        
                         <asp:Button class="button" ID="Button1" runat="server" Text="Delete" OnClick="btnDelete_Click"  />
                    </td>
                </tr>
               

                
                <%                     
                                count++;
                        }
                        }
                        db.closeConnection();
                        } 
                        }
                        %>
            </table>



        </div>

</div>





</asp:Content>


