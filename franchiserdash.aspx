<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="franchiserdash.aspx.cs" Inherits="franchiserdash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Franchiser Dashboard</h3>
    <% if (Session["username"] != null)
               { %>
    <ul>
        <li>
                        <h4><a href="franchiser.aspx" style="color:black">Profile</a></h4>
                    

        </li>
    </ul>
    <%
    } else { 
               %>
               
           <a href="login.aspx">Login</a>
            
               <%} %>

</asp:Content>


