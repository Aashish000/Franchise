<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="addfranchise.aspx.cs" Inherits="admin_AddFranchise" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-header">
        <h1><b>Add Franchise</b> </h1>
       
    </div> <br/>
    <div class="content">
        <asp:Label ID="msg" runat="server" Text="Label"></asp:Label>
        <table class="auto-style1">
            <tr>
                <td class="auto-style11">
                    <br />
                    Franchise Name:</td>
                <td class="auto-style8">
                    <br />
                    <asp:TextBox ID="franchise_name" runat="server" Width="195px"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="franchise_name" ErrorMessage="Franchise Name required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">Description</td>
                <td class="auto-style10">
                    <asp:TextBox ID="description" runat="server" Width="195px"></asp:TextBox>
                </td>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="description" ErrorMessage="Description required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Email</td>
                <td class="auto-style5">
                    <asp:TextBox ID="email" runat="server" Width="195px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="email" ErrorMessage="Email Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="enter a valid email" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">Logo</td>
                <td class="auto-style3">
                    <asp:FileUpload ID="logo" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="logo" ErrorMessage="Logo required " ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">Established Date</td>
                <td class="auto-style3">
                    <asp:TextBox ID="established_date" runat="server" Width="195px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="established_date" ErrorMessage="Established date required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="established_date" Display="Dynamic" ErrorMessage="Invalid Date Format(dd/mm/yy)" ForeColor="Red" ValidationExpression="^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">Started Date </td>
                <td class="auto-style3">
                    <asp:TextBox ID="started_date" runat="server" Width="195px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="started_date" ErrorMessage="Started Date required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="started_date" Display="Dynamic" ErrorMessage="Invalid Date  Format(dd/mm/yy)" ForeColor="Red" ValidationExpression="^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$"></asp:RegularExpressionValidator>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Concept </td>
                <td class="auto-style5">
                    <asp:TextBox ID="concept" runat="server" Width="195px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="concept" ErrorMessage="Concept required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">Investment Required</td>
                <td class="auto-style3">
                    <asp:TextBox ID="investment_required" runat="server" Width="195px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="investment_required" ErrorMessage="Investment required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="investment_required" Display="Dynamic" ErrorMessage="Investment can be only numbers" ForeColor="Red" ValidationExpression="^[1-9]\d{0,7}(?:\.\d{1,4})?$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">No. of units&nbsp; </td>
                <td class="auto-style3">
                    <asp:TextBox ID="no_of_units" runat="server" Width="196px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="no_of_units" ErrorMessage="No of units required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="no_of_units" Display="Dynamic" ErrorMessage="No of units can be only numbers " ForeColor="Red" ValidationExpression="^[1-9]\d{0,7}(?:\.\d{1,4})?$"></asp:RegularExpressionValidator>
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
                <td class="auto-style13">Category</td>
                <td class="auto-style3">
                <asp:DropDownList class="TextBox" ID="category" runat="server"></asp:DropDownList>
               
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
                    <input id="Reset1" type="reset" value="Reset" /></td>
            </tr>
        </table>

    </div>
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


