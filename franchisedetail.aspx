<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="franchisedetail.aspx.cs" Inherits="franchisedetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
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
           <div class="content-logo">
               
                    <img class="categories-image" src="uploads/<%= logo %> " height="200" width="200"/><br/>
                
           </div>
         <div class="info">
          <table class="auto-style1" style="padding:10px; height: 493px;">
               <tr>
                    <th class="auto-style5" colspan="2">
                        <h2 style="border-bottom: 6px solid #5f6373"><%= name %></h2>
                        
                    </th>
                </tr>
               <tr>
                <td class="auto-style19" style="text-align: left">
                    <%=description %>
                </td>
               </tr>
                <tr>
                     <br/>
                    <th class="auto-style15" style="background:#e62005; color:white" colspan="2">
                        <h2 style="height: 23px; text-align:center">Business Details</h2>
                    </th>
                </tr>
                <tr>
                    <th class="auto-style20">Email</th>
                    <td class="auto-style12">
                    <%= email %>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style21">Established Date</th>
                    <td class="auto-style22">
                        <%= established_date %>
                    </td>
                </tr>
                 <tr>
                    <th class="auto-style20">Franchise Started Date</th>
                    <td class="auto-style2">
                        <%= started_date %>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style20">Concept</th>
                    <td class="auto-style2">
                        <%= concept %>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style23">Investment Required</th>
                    <td class="auto-style24">
                        <%= investment_required %>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style20">No of Units</th>
                    <td class="auto-style2">
                       <%= no_of_units %>
                    </td>
                </tr>
               <%
                  }
                  db.closeConnection();
                  string query1 = "select* from investment_details where fid =" +Request.QueryString["id"];
                  db.cmd = new System.Data.SqlClient.SqlCommand(query1, db.con);
                  db.openConnection();
                  db.dr = db.cmd.ExecuteReader();
                  while (db.dr.Read())
                  {
                      string investment_required = db.dr[1].ToString();
                      string cash_required = db.dr[2].ToString();
                      string royalty = db.dr[3].ToString();
                      string training_assist = db.dr[4].ToString();
                      int fid = int.Parse(db.dr[5].ToString());
                     
                                    
         %>
              <th class="auto-style15" style="background:#372e50; color:white" colspan="2">
                        <h2 style="height: 23px;text-align:center">Investment Details</h2>
              </th>
              <tr>
                    <th class="auto-style20">Investment Required</th>
                    <td class="auto-style2">
                       <%= investment_required %>
                    </td>
                </tr>
              <tr>
                    <th class="auto-style20">Cash Required</th>
                    <td class="auto-style2">
                       <%= cash_required %>
                    </td>
                </tr>
              <tr>
                    <th class="auto-style20">Royalty</th>
                    <td class="auto-style2">
                       <%= royalty %>
                    </td>
                </tr>
               <tr>
                    <th class="auto-style20">Training Assist</th>
                    <td class="auto-style2">
                       <%= training_assist %>
                    </td>
                </tr>
              
            </table>

           
         </div>
         <%
             if(Session["role"]== "investor")    
                            {
         %>
         <div class="apply" style="float:right">
            
            <button class="button" id="btn"> <a href="applyfranchise.aspx?id=<%=fid%>">Apply For this Franchise</a></button>
         </div>
         <%
         } %>
           <%
             }
             db.closeConnection();
             } 
             %>

        
 
</asp:Content>


<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 28px;
        }
        .auto-style5 {
            height: 80px;
            text-align: left;
        }
        .auto-style9 {
            height: 41px;
        }
        .auto-style12 {
            height: 28px;
            text-align: left;
        }
        .auto-style15 {
            height: 46px;
            text-align: left;
            }
        .auto-style18 {
            height: 41px;
            text-align: center;
            font-weight: normal;
            width: 413px;
        }
        .auto-style19 {
            width: 413px;
            height: 35px;
        }
        .auto-style20 {
            height: 28px;
            text-align: center;
            font-weight: normal;
            width: 413px;
        }
        .auto-style21 {
            height: 25px;
            text-align: center;
            font-weight: normal;
            width: 413px;
        }
        .auto-style22 {
            height: 25px;
            text-align: left;
        }
        .auto-style23 {
            height: 27px;
            text-align: center;
            font-weight: normal;
            width: 413px;
        }
        .auto-style24 {
            height: 27px;
        }
        </style>
</asp:Content>



