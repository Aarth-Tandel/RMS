<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterUser.Master" CodeBehind="Details.aspx.cs" Inherits="RstMgn.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        src="https://code.jquery.com/jquery-3.2.1.min.js"</script>
    <link href="css/materialize.css" rel="stylesheet" type="text/css" />
    <script src="js/materialize.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script>
        $(document).ready(function () {
            $('select').material_select();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentSidebar" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MasterContent" runat="server">
    <div>
    </div>
    <h2 class="center-align">
<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="LblName" runat="server" Text="Label"></asp:Label></strong>
    </h2>
    <p class="center-align">
        Ratings:
            <asp:Label ID="LblReview" runat="server" Text="Label"></asp:Label>
    </p>
    <p class="center-align">
        Location:
            <asp:Label ID="LblLocation" runat="server" Text="Label"></asp:Label>
    </p>
    <div class="container">
        <asp:GridView class="centered striped" HorizontalAlign="Center" ID="GridMenu" runat="server">
        </asp:GridView>
        <br />
    </div>
</asp:Content>
