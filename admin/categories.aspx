<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="categories.aspx.cs" Inherits="admin_categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-header">
         <h1> Categories&nbsp<a href="addcategories.aspx" style="color:black"> <img src="../images/add.png" height="20" width="20"/> </a></h1>
    </div>
    <div class="content">
        <asp:Literal ID="msg" runat="server"></asp:Literal>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    </div>

</asp:Content>
