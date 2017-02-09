<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="registration" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="user-container">
    <table class="user-content">
        <asp:Label ID="msg" runat="server" Text="Label"></asp:Label>
    <tr>
        <td class="auto-style1" colspan="3">Registration Form</td>
    </tr>
    <tr>
        <td class="auto-style4">Name</td>
        <td class="auto-style5">
            <asp:TextBox ID="name" runat="server" Width="180px"></asp:TextBox>
        </td>
        <td>
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name" ErrorMessage="First Name required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="name" Display="Dynamic" ErrorMessage="First name can be only alphabets" ForeColor="Red" ValidationExpression="^[a-zA-Z'.\s]{1,40}$"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style4">Email</td>
        <td class="auto-style5">
            <asp:TextBox ID="email" runat="server" Width="180px"></asp:TextBox>
        </td>
        <td>
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="email" ErrorMessage="Email required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="enter a valid  email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
        </td>
    </tr>
        <tr>
        <td class="auto-style4">Username</td>
        <td class="auto-style5">
            <asp:TextBox ID="username" runat="server" Width="180px"></asp:TextBox>
        </td>
        <td>
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="username" ErrorMessage="Username required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="username" Display="Dynamic" ErrorMessage="No whitespace allowed" ForeColor="#FF3300" ValidationExpression="^\S+$"></asp:RegularExpressionValidator>
        </td>
        </tr>
    <tr>
        <td class="auto-style10">Password</td>
        <td class="auto-style11">
            <asp:TextBox ID="password" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
        </td>
        <td class="auto-style12">
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="password" ErrorMessage="Password required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="password" Display="Dynamic" ErrorMessage="password must have more than 6 characters" ForeColor="Red" ValidationExpression="^.*(?=.{6,}).*$"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style4">Confirm Password</td>
        <td class="auto-style5">
            <asp:TextBox ID="txtconfirmpwd" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
        </td>
        <td>
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtconfirmpwd" ErrorMessage="Confirm password required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="txtconfirmpwd" ErrorMessage="Both password must match" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
            <br />
            </td>
    </tr>
    <tr>
        <td class="auto-style4">Address</td>
        <td class="auto-style5">
            <asp:TextBox ID="address" runat="server" Width="180px"></asp:TextBox>
        </td>
        <td>
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="address" Display="Dynamic" ErrorMessage="Address Required " ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
    </tr>
    <tr>
        <td class="auto-style7">Country</td>
        <td class="auto-style8">
            <asp:DropDownList ID="country" runat="server" Height="16px" Width="185px">
                <asp:ListItem>SELECT COUNTRY</asp:ListItem>
                <asp:ListItem>NEPAL</asp:ListItem>
                <asp:ListItem>CHINA</asp:ListItem>
                <asp:ListItem>USA</asp:ListItem>
                <asp:ListItem>UK</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="auto-style9">
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="country" ErrorMessage="Country required" ForeColor="Red" InitialValue="SELECT COUNTRY"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style7">State </td>
        <td class="auto-style8">
            <asp:TextBox ID="state" runat="server" Width="180px"></asp:TextBox>
        </td>
        <td class="auto-style9">
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="state" Display="Dynamic" ErrorMessage="State Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style7">City</td>
        <td class="auto-style8">
            <asp:TextBox ID="city" runat="server" Width="180px"></asp:TextBox>
        </td>
        <td class="auto-style9">
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="city" Display="Dynamic" ErrorMessage="City Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style7">Mobile No</td>
        <td class="auto-style8">
            <asp:TextBox ID="contact" runat="server" Width="180px"></asp:TextBox>
        </td>
        <td class="auto-style9">
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="contact" Display="Dynamic" ErrorMessage="Contact required" ForeColor="Red"></asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="contact" Display="Dynamic" ErrorMessage="Contact should be only numbers" ForeColor="Red" ValidationExpression="\d+$"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style7">Occupation</td>
        <td class="auto-style8">
            <asp:TextBox ID="occupation" runat="server" Width="180px"></asp:TextBox>
        </td>
        <td class="auto-style9">
            *<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="occupation" ErrorMessage="Occupation Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
     
    
   <%-- <tr>
        <td class="auto-style7">Photo</td>
        <td class="auto-style8">
           <asp:FileUpload ID="photo" runat="server" />
        </td>
        <td class="auto-style9">
           
            &nbsp;</td>
    </tr>--%>
    <tr>
        <td class="auto-style7">Role</td>
        <td class="auto-style8">
             <asp:DropDownList class="TextBox" ID="role" runat="server">
                 <asp:ListItem  Value="franchiser">Franchiser</asp:ListItem>
                 <asp:ListItem  Value="investor">Investor</asp:ListItem>
              </asp:DropDownList>
        </td>
        <td class="auto-style9">
            &nbsp;</td>
    </tr>
     
    
    <tr>
        <td class="auto-style7">&nbsp;</td>
        <td class="auto-style8">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" Width="99px" />
            <input id="Reset1" type="reset" value="Reset" /></td>
        <td class="auto-style9">&nbsp;</td>
    </tr>
</table>
          </div>
    
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
        text-align: center;
            height: 23px;
        }
    .auto-style4 {
        text-align: right;
        width: 229px;
    }
    .auto-style5 {
        width: 202px;
    }
    .auto-style7 {
        text-align: right;
        width: 229px;
        height: 30px;
    }
    .auto-style8 {
        width: 202px;
        height: 30px;
    }
    .auto-style9 {
        height: 30px;
    }
    .auto-style10 {
        text-align: right;
        width: 229px;
        height: 29px;
    }
    .auto-style11 {
        width: 202px;
        height: 29px;
    }
    .auto-style12 {
        height: 29px;
    }
    #Reset1 {
        width: 83px;
    }
</style>
</asp:Content>


