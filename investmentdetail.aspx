<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="investmentdetail.aspx.cs" Inherits="investmentdetail" %>


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
                    <th>Investment Required</th>
                    <th>Cash Required</th>
                    <th>Royalty</th>
                    <th>Training Assist</th>
                    <asp:Label ID="no" runat="server" Text="Label"></asp:Label>

                </tr>
                <%
                    
                    db.closeConnection();
                     if (Request.QueryString["id"] != null)
                    {
                          
                        string data = "select * from investment_details where fid='" + Request.QueryString["id"] + "'";
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
                            string investment_required = db.dr[1].ToString();
                            string cash_required = db.dr[2].ToString();
                            string royalty = db.dr[3].ToString();
                            string training_assist = db.dr[4].ToString();
                           
                          %>
                        
                        
              
                
                    <tr>
                       
                        <td><%= count %>
                   
                 <asp:Label ID="aid" runat="server" Text="Label"></asp:Label>
                         
                    </td>
                    <td><%=  investment_required %></td>
                    <td><%= cash_required %></td>
                    <td><%= royalty %></td>
                    <td><%= training_assist %></td>
                    
                    <td>
                        
                       </td>
                         
                   <td>
                        <button class="button"><a href="editinvestment.aspx?id=<%= appid %>" style="color:black">Update</a></button>
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

