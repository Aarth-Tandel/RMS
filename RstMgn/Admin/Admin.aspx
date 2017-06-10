<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/MasterPageAdmin.Master" CodeBehind="Admin.aspx.cs" Inherits="RstMgn.Admin.LandingPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.carousel.carousel-slider').carousel({ fullWidth: true });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col s12 center-align">
            <h1>Hi!
            <asp:Label ID="LblUser" runat="server" Text="User"></asp:Label>
                What do you want to do?</h1>
            <br />
        </div>
        <div class="col s6 center-align">
            <a class='btn btn-large' href='RestaurantRegistarion.aspx'>Restaurant</a>
        </div>
        <div class="col s6 center-align">
            <a class='btn btn-large' href='UserRegistraion.aspx'>User</a>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="carousel carousel-slider container center-align" style="margin-top:10%">
            <a class="carousel-item" href="#one!">
                <img src="http://lorempixel.com/800/400/food/1"></a>
            <a class="carousel-item" href="#two!">
                <img src="http://lorempixel.com/800/400/food/2"></a>
            <a class="carousel-item" href="#three!">
                <img src="http://lorempixel.com/800/400/food/3"></a>
            <a class="carousel-item" href="#four!">
                <img src="http://lorempixel.com/800/400/food/4"></a>
            <a class="carousel-item" href="#four!">
                <img src="http://lorempixel.com/800/400/food/5"></a>
        </div>
    </div>
</asp:Content>
