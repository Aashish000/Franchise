<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="franchise.aspx.cs" Inherits="admin_Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="user-container">
       
             <div class="user-navigation">
                  <%
                          dbConnection db = new dbConnection();
                           if (Session["username"] != null)
                            { 
                           if(Session["role"]== "franchiser")    
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
                   
                 <ul>
                    <li> <a href="franchiser.aspx" style="color:#FFFFFF">Dashboard</a></li>
                    <li> <a href="franchise.aspx" style="color:#FFFFFF">Activities</a></li>
                    <li> <a href="logout.aspx" style="color:#FFFFFF">Logout</a></li>
                </ul>
                </div>
            <div class="user-header">   
             <h2 style="float:left"> Franchises&nbsp&nbsp </h2>
            <a href="addfranchise.aspx"><img src="images/add.png" height="20" width="20" style="background:#FFFFFF"> </a><br/>
        </div>
    
          
      <asp:label ID="msg" runat="server"></asp:label>
        <div class="user-content">
          <table class="franchiseinfo">
                <tr>
                    <th>S.NO</th>
                    <th>Franchise Name</th>
                    <th>Description</th>
                    <th>Email</th>
                    <th>Logo</th>
                    <th>Established Date</th>
                    <th>Started Date</th>
                    <th>Concept</th>
                    <th>Investment Required</th>
                    <th>No Of Units</th>
                    <th>User Id</th>
                    <th>Cat Id</th>
                    <asp:Label ID="no" runat="server" Text="Label"></asp:Label>
                </tr>
                <%
                
                     
                      
                        string data = "select * from franchise where uid='" + id + "'";
                        db.cmd = new System.Data.SqlClient.SqlCommand(data, db.con);
                        }
                        db.closeConnection();
                        
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
                            int franid = int.Parse(db.dr["id"].ToString());
                            fid.Text = franid.ToString();
                            int franchiseid = int.Parse(db.dr[0].ToString());
                            string franchise_name = db.dr[1].ToString();
                            string description = db.dr[2].ToString();
                            string email = db.dr[3].ToString();
                            string logo = db.dr[4].ToString();
                            string established_date = db.dr[5].ToString();
                            string started_date = db.dr[6].ToString();
                            string concept = db.dr[7].ToString();
                            string investment_required = db.dr[8].ToString();
                            string no_of_units = db.dr[9].ToString();
                            string uid = db.dr[10].ToString();
                            string catid = db.dr[11].ToString();
                                              
                        %>
                        
                        
              
                
                    <tr>
                       
                    <td><%= count %></td>
                        <asp:Label ID="fid" runat="server" Text="Label"></asp:Label>
                    <td><%=  franchise_name %>
                        <a href="addinvestment.aspx?id=<%= franchiseid %>" style="color:blue">Add Investment Details</a>
                    </td>
                    <td>
                        <%=  description %>
                    </td>
                    <td><%= email %></td>
                    <td><img class="categories-image" src="uploads/<%= logo %> " height="50" width="50"/></td>
                    <td><%= established_date %></td>
                    <td><%= started_date %></td>
                    <td><%= concept %></td>
                    <td><%= investment_required %></td>
                    <td><%= no_of_units %></td>
                    <td><%= uid %></td>
                    <td><%= catid %></td>

                    <td>
                             
                              
                        <button class="button"><a href="editfranchise.aspx?id=<%= franchiseid %>" style="color:black">Update</a></button>
                        <button class="button"><a href="investmentdetail.aspx?id=<%= franchiseid %>" style="color:black">Investment Detail</a></button>
                        <button class="button"><a href="franchise.aspx?id=<%= franchiseid %>" style="color:black">Delete</a></button>
                         
                        <%--<asp:Button class="button" ID="Button1" runat="server" Text="Delete" OnClick="btnDelete_Click"  />--%>
                        
                         <button class="button"><a href="application.aspx?id=<%= franchiseid %>" style="color:black">Application</a></button>
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

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
    
    .auto-style1 {
        width: 100%;
    }
</style>
</asp:Content>


