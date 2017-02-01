<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="editinvestor.aspx.cs" Inherits="editinvestor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
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
       
             <div class="user-navigation">
                      <ul>
                       <li> <a href="investor.aspx" style="color:#FFFFFF">Dashboard</a></li>
                        <li> <a href="logout.aspx" style="color:#FFFFFF">Logout</a></li>
                    </ul>
                </div>
           <div class ="user-header">
                <h2 style="float:left"> Edit Investor&nbsp&nbsp </h2><br/>
            </div>
        
         <div class="user-content">
             <asp:Label ID="msg" runat="server" Text="Label"></asp:Label>
             <asp:Literal ID="ltrmsg" runat="server"></asp:Literal>
            
             <table class="auto-style1">
               <tr>
                    <th class="auto-style5">Franchiser Name</th>
                    <td class="auto-style4">     
                        <asp:TextBox ID="name" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style3">Franchiser Email</th>
                    <td class="auto-style6">
                        <asp:TextBox ID="email" runat="server"></asp:TextBox>
                    </td>
                </tr>
           
                <tr>
                    <th class="auto-style7">Address</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="address" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style7">Country</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="country" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style7">State</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="state" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style7">City</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="city" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style7">Contact</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="contact" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style7">Occupation</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="occupation" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
                <hr/>
             
             

            
           
             <table>
                 
             
                <tr>
                    <th class="auto-style7">Username</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="username" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style7">Old Password</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="oldpassword" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style7">New Password</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="newpassword" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <th class="auto-style7">Confirm Password</th>
                    <td class="auto-style8">
                        <asp:TextBox ID="confirm_password" runat="server"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <th class="auto-style7">&nbsp;</th>
                    <td class="auto-style8">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Update" />
                    </td>
                </tr>
            </table>
        </div>
    
       
            <%
                                    }
                                    db.closeConnection();
                                    }      
                                    }                   
         %>
    </div>
    
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 365px;
            height: 42px;
        }
        .auto-style4 {
            height: 45px;
        }
        .auto-style5 {
            width: 365px;
            height: 45px;
        }
        .auto-style6 {
            height: 42px;
        }
        .auto-style7 {
            width: 365px;
            height: 40px;
        }
        .auto-style8 {
            height: 40px;
        }
    </style>
</asp:Content>

