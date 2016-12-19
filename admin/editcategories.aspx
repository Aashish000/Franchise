<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="editcategories.aspx.cs" Inherits="admin_editcategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="content-header">
            <h1>Edit Categories</h1>
        </div>
        <div class="content">
              <asp:Label ID="msg" runat="server" Text="Label"></asp:Label>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style11">
                        <br />
                        Category Name:</td>
                    <td class="auto-style8">
                        <br />
                        <asp:TextBox ID="name" runat="server" Width="195px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name" ErrorMessage="Categories Name required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">
                        <br />
                        Image:</td>
                    <td class="auto-style8">
                        <asp:FileUpload ID="image" runat="server" />
                        <asp:Label ID="lblimage" runat="server" Text="Label"></asp:Label>
                        <br />
                    </td>
                    <td class="auto-style7">
                        <br />
                    </td>
                </tr>
                 <tr>
                    <td class="auto-style2" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
                        <input id="Reset1" type="reset" value="Reset" /></td>
                </tr>
            </table>
        </div>
</asp:Content>


