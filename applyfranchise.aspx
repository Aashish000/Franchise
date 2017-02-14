<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="applyfranchise.aspx.cs" Inherits="applyfranchise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="application">
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
                                               int id = Convert.ToInt32(db.dr[0].ToString());
                                                userid.Text = db.dr["id"].ToString();
                                                name.Text = db.dr["name"].ToString();
                                                email.Text = db.dr["email"].ToString();
                                                country.Text = db.dr["country"].ToString();
                                                city.Text = db.dr["city"].ToString();
                                                address.Text = db.dr["address"].ToString();
                                                occupation.Text = db.dr["occupation"].ToString();
                                                education_qualification.Text = db.dr[6].ToString();  
                 %>
        <h2>Apply For Franchise</h2>
       
        <table class="auto-style1">
            <tr>
                <td class="auto-style3" colspan="2">
                    <asp:Label ID="msg" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Name</td>
                <td class="auto-style2">
                    <asp:TextBox ID="name" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Email</td>
                <td class="auto-style5">
                    <asp:TextBox ID="email" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Country</td>
                <td class="auto-style5">
                    <asp:TextBox ID="country" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">City</td>
                <td class="auto-style5">
                    <asp:TextBox ID="city" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Address</td>
                <td class="auto-style5">
                    <asp:TextBox ID="address" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Occupation</td>
                <td class="auto-style5">
                    <asp:TextBox ID="occupation" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">Education Qualification</td>
                <td class="auto-style7">
                    <asp:TextBox ID="education_qualification" runat="server"></asp:TextBox>
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
                    <asp:TextBox ID="userid" runat="server" Width="196px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
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



