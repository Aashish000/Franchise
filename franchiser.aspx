﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="franchiser.aspx.cs" Inherits="franchiser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <%
                       dbConnection db = new dbConnection();
                      
                     if (Session["username"] != null)
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
             <ul class="user-navigation">
                  
                   <li> <a href="franchiser.aspx" style="color:black">Dashboard</a></li>
                    <li> <a href="franchise.aspx?id=<%=id %>" style="color:black">Activities</a></li>
                      
                 <li> <a href="logout.aspx" style="color:black">Logout</a></li>

                </ul>
           
        </div>
        <div class="apply">
           <a href="editfranchiser.aspx?id=<%=id%>" style="color:white;background:blue">
               <img src="images/editicon.png" alt="Edit" height="40" width="40" /></a>
        </div>
          <div class="user-content">
          <table class="auto-style1">
               <tr>
                    <th class="auto-style5" colspan="2">
                        <h2><%= name %></h2>
                        
                    </th>
                </tr>
                <tr>
                    <th class="auto-style2"> Description</th>
                    <td class="auto-style2">
                       <%=email %>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style3">Email</th>
                    <td class="auto-style3">
                    <%= username %>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style6">Established Date</th>
                    <td class="auto-style6">
                        <%= password %>
                    </td>
                </tr>
                 <tr>
                    <th class="auto-style2">Started Date</th>
                    <td class="auto-style2">
                        <%= address %>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style9">Concept</th>
                    <td class="auto-style9">
                        <%= country %>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style9">Investment Required</th>
                    <td class="auto-style9">
                        <%= state %>
                    </td>
                </tr>
                <tr>
                    <th class="auto-style9">No of Units</th>
                    <td class="auto-style9">
                       <%= city %>
                    </td>
                </tr>
              <tr>
                    <th class="auto-style9">No of Units</th>
                    <td class="auto-style9">
                       <%= contact %>
                    </td>
                </tr>
             <tr>
                    <th class="auto-style9">No of Units</th>
                    <td class="auto-style9">
                       <%= occupation %>
                    </td>
                </tr>
            </table>

               </div>
</div>

       
         
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


