<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="editinvestment.aspx.cs" Inherits="editinvestment" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="user-container">
        
             <div class="user-navigation">
                  <%
                   if(Session["role"]== "franchiser")    
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
       <div class="user-header">   
             <h2 style="float:left"> Edit Investment&nbsp&nbsp </h2>
       </div>
    <div class="user-content">
        <asp:Label ID="msg" runat="server" Text="Label"></asp:Label>
        <asp:Literal ID="ltrmsg" runat="server"></asp:Literal>
        <table class="auto-style1">
            <tr>
                <asp:TextBox ID="user_id" runat="server"></asp:TextBox>
                <asp:TextBox ID="uid" runat="server"></asp:TextBox>
                <td class="auto-style11">
                    <br />
                    Investment Required:</td>
                <td class="auto-style8">
                    <br />
                    <asp:TextBox ID="investment_required" runat="server" Width="195px"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="investment_required" ErrorMessage="Franchise Name required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
           
            <tr>
                <td class="auto-style4">Cash Required</td>
                <td class="auto-style5">
                    <asp:TextBox ID="cash_required" runat="server" Width="195px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="cash_required" ErrorMessage="Email Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                   
                </td>
            </tr>
           
            <tr>
                <td class="auto-style13">Royalty</td>
                <td class="auto-style3">
                    <asp:TextBox ID="royalty" runat="server" Width="195px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="royalty" ErrorMessage="Established date required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
             
                </td>
            </tr>
          
            <tr>
                <td class="auto-style4">Training Assist </td>
                <td class="auto-style5">
                    <asp:TextBox ID="training_assist" runat="server" Width="195px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="training_assist" ErrorMessage="Concept required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
     
            <tr>
                <td class="auto-style2" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
                    <input id="Reset1" type="reset" value="Reset" /></td>
            </tr>
        </table>

    </div>
         <asp:HiddenField ID="imagepath" runat="server" />

        </div>
    <%} %>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
        }
        .auto-style3 {
            width: 240px;
        }
        #TextArea1 {
            width: 195px;
        }
        .auto-style4 {
            width: 255px;
            height: 26px;
        }
        .auto-style5 {
            width: 240px;
            height: 26px;
        }
        .auto-style6 {
            height: 26px;
        }
        #description {
            width: 195px;
        }
        #Reset1 {
            width: 56px;
        }
    .auto-style7 {
        height: 45px;
    }
    .auto-style8 {
        width: 240px;
        height: 45px;
    }
    .auto-style9 {
        height: 16px;
    }
    .auto-style10 {
        width: 240px;
        height: 16px;
    }
    .auto-style11 {
        height: 45px;
        width: 255px;
    }
    .auto-style12 {
        height: 16px;
        width: 255px;
    }
    .auto-style13 {
        width: 255px;
    }
    </style>
</asp:Content>

