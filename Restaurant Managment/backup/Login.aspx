<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RstMgn.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            text-align: center;
        }
        .auto-style2 {
            font-size: xx-large;
            color: #FFFFFF;
            background-color: #0066FF;
        }
        .auto-style3 {
            background-color: #0066FF;
        }
        .auto-style4 {
        }
        .auto-style5 {
            text-align: center;
        }
        .auto-style6 {
            text-align: center;
        }
        .auto-style7 {
            text-align: center;
        }
        .auto-style8 {
            width: 24%;
        }
        .auto-style9 {
            height: 69px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2 class="auto-style2">R<span data-dobid="hdw">estaurant</span><strong class="auto-style3"> Managment System</strong></h2>
        <table align="center" class="auto-style8">
            <tr>
                <td class="auto-style9" colspan="2">Login</td>
            </tr>
            <tr>
                <td>
            <span class="auto-style4">Username:&nbsp;&nbsp;</span>&nbsp;
            </td>
                <td>
            <asp:TextBox ID="txtUseraName" runat="server" Width="210px" style="margin-top: 0px; margin-bottom: 0px" OnTextChanged="txtUseraName_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Password:&nbsp;&nbsp;&nbsp;</td>
                <td> <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" OnTextChanged="TextBox2_TextChanged" Width="210px" style="margin-top: 0px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
            <asp:CheckBox ID="RememberCheckBox" Text ="Remember me" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" CssClass="auto-style7" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
            <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" CssClass="auto-style6" />
                </td>
            </tr>
        </table>
        <p class="auto-style5">
            &nbsp;</p>
        <p style="margin-left: 0px; margin-top: 15px;" class="auto-style5">
            <asp:Label ID="LoginStatus" runat="server" Text="Label" Visible="False"></asp:Label>
        </p>
    </form>
</body>
</html>