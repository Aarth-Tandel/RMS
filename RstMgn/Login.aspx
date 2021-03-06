﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RstMgn.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>Vascos</title>
    <style type="text/css">
        .auto-style1 {
            width: 410px;
            margin: 0 auto;
            margin-top: 7%;
        }

        .auto-style2 {
            margin-left: 0px;
            background: #3498DB;
            color: white;
        }

        .BigCheckBox input {
            width: 20px;
        }
    </style>
    <link href="Login.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/Validation/Loginvalidation.js"></script>
</head>
<body>
    <form id="form1" runat="server" class="auto-style1">
            <h1 class="heading">Vascos</h1>
            <div class="login-screen">
                <div class="app-title">
                    <h2>Login</h2>
                </div>
                <div class="login-form">
                    <div class="control-group">
                        <asp:TextBox ID="txtUseraName" runat="server" class="login-field" value="" placeholder="username" type="text"></asp:TextBox>
                    </div>

                    <div class="control-group">
                        <asp:TextBox ID="txtPassword" runat="server" class="login-field" value="" placeholder="password" type="password"></asp:TextBox>
                    </div>
                    <div>
                        <asp:CheckBox ID="RememberCheckBox" runat="server" CssClass="BigCheckBox" Text="Remember Me" />
                    </div>
                    <br />
                    <br />
                    <asp:Button ID="BtnSubmit" runat="server" Text="Sign in" OnClick="SubmitButton_Click" OnClientClick=" return UserValid()" class="btn btn-primary btn-large btn-block" href="#" CssClass="auto-style2"></asp:Button>
                    <br />
                    <br />
                    <asp:Label ID="LblLoginStatus" runat="server" Text="Label" Visible="False"></asp:Label>
                    <br />
                </div>
            </div>
    </form>
</body>
</html>
