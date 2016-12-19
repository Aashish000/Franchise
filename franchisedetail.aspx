<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="franchisedetail.aspx.cs" Inherits="franchisedetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="categories">
                <%
                       dbConnection db = new dbConnection();
                      
                    if (Request.QueryString["id"] != null)
                    {
                        
                        string query = "select* from franchise where id =" +Request.QueryString["id"];
                            db.cmd = new System.Data.SqlClient.SqlCommand(query, db.con);
                            db.openConnection();
                            db.dr = db.cmd.ExecuteReader();
                                while (db.dr.Read())
                                            {
                                                string name = db.dr[1].ToString();
                                                string description = db.dr[2].ToString();
                                                string email = db.dr[3].ToString();
                                                string established_date = db.dr[5].ToString();
                                                string started_date = db.dr[6].ToString();
                                                string concept = db.dr[7].ToString();
                                                string investment_required = db.dr[8].ToString();
                                                string no_of_units = db.dr[9].ToString();                                                                          
                                                string logo = db.dr[4].ToString();
                                                int id = Convert.ToInt32(db.dr[0].ToString());
                                                
                %>
           <div class="logo">
               
                    <img class="categories-image" src="uploads/<%= logo %> " height="200" width="200"/><br/>
                
           </div>
         <div class="info" style="float:left">
          <table class="auto-style1">
               <tr>
                    <th class="auto-style5" colspan="2">
                        <h2><%= name %></h2>
                        
                    </th>
                </tr>
                <tr>
                    <th class="auto-style2"> Description</th>
                    <td class="auto-style2">
                       <%=description %>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style3">Email</th>
                    <td class="auto-style3">
                    <%= email %>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style6">Established Date</th>
                    <td class="auto-style6">
                        <%= established_date %>
                    </td>
                </tr>
                 <tr>
                    <th class="auto-style2">Started Date</th>
                    <td class="auto-style2">
                        <%= started_date %>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style9">Concept</th>
                    <td class="auto-style9">
                        <%= concept %>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style9">Investment Required</th>
                    <td class="auto-style9">
                        <%= investment_required %>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style9">No of Units</th>
                    <td class="auto-style9">
                       <%= no_of_units %>
                    </td>
                </tr>
             
            </table>



         </div>
         <div class="apply" style="float:right">
            
             <a href="applyfranchise.aspx?id=<%=id%>" style="color:white;background:blue">Apply</a>
         </div>
         <%
                                    }
                                    db.closeConnection();
                                    }
         %>
     </div>
</asp:Content>


<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 43px;
        }
        .auto-style3 {
            height: 58px;
        }
        .auto-style4 {
            height: 24px;
        }
        .auto-style5 {
            height: 25px;
        }
        .auto-style6 {
            height: 53px;
        }
        .auto-style9 {
            height: 41px;
        }
    </style>
</asp:Content>



