<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="addinvestment.aspx.cs" Inherits="addinvestment" %>
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
    <%
         
                          db.closeConnection();
                                if (Request.QueryString["id"] != null)
                                {
                          
                                string data = "select * from investment_details where fid='" + Request.QueryString["id"] + "'";
                                db.cmd = new System.Data.SqlClient.SqlCommand(data, db.con);
                                db.openConnection();
                                db.dr = db.cmd.ExecuteReader();
                                if (db.dr == null || !db.dr.HasRows)
                                {
                            
                        
                               
    %>
    <div class="application">
        <h2>Add Investment Detail</h2>
        <table class="auto-style1">
            <tr>
                <td class="auto-style3" colspan="2">
                    <asp:Label ID="msg" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Investment Required</td>
                <td class="auto-style2">
                    <asp:TextBox ID="investment_required" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Cash Required</td>
                <td class="auto-style5">
                    <asp:TextBox ID="cash_required" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Royalty</td>
                <td class="auto-style5">
                    <asp:TextBox ID="royalty" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Training Assist</td>
                <td class="auto-style5">
                    <asp:TextBox ID="training_assist" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="franchise_id" runat="server" Text="Label">Franchise Id</asp:Label></td>
                <td class="auto-style5">
                    <asp:TextBox ID="franchiseid" runat="server" value=""></asp:TextBox>
                </td>
            </tr>
            <tr>
                
                <td class="auto-style3">
                    <asp:TextBox ID="uid" runat="server" Width="196px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
             <tr>
                
                <td class="auto-style3">
                    <asp:TextBox ID="user_id" runat="server" Width="196px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
                </td>
            </tr>
            </table>
       
        
    </div>
            </div>
          </div>
        
    <%}
      else
      {
       %>
    <h2>Investment detail already added for this franchise.</h2>
    <%                  
      }
      }
      } 
      %>
</asp:Content>


<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
            width: 405px;
        }
        .auto-style3 {
            height: 23px;
            }
        .auto-style4 {
            width: 160px;
        }
        .auto-style5 {
            width: 405px;
        }
        .auto-style6 {
            width: 160px;
            height: 26px;
        }
        .auto-style7 {
            width: 405px;
            height: 26px;
        }
    </style>
</asp:Content>




