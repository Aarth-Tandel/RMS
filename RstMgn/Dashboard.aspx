<%@ Page Language="C#" MasterPageFile="~/MasterUser.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="RstMgn.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
    <main style="min-width: 1500px">
        <div>
            <h1><strong>Hungry?</strong></h1>
        </div>
        <div>
            <blockquote>
                Hello!
            <asp:Label ID="LblUser" runat="server" Text="User"></asp:Label>
                Have a lovely lists of Restaurants Just for you. Please choose City and Location.
            </blockquote>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <%--<asp:Label runat="server" ID="lblCity" Text="City:"></asp:Label>--%>
                <asp:DropDownList ID="LstBxCity" runat="server" OnSelectedIndexChanged="DropDownCity_SelectedIndexChanged" AutoGenerateColumns="" AutoPostBack="True">
                </asp:DropDownList>
            </div>
            <div class="input-field col s6">
                <%--<asp:Label runat="server" ID="lblLocation" Text="Location:"></asp:Label>--%>
                <asp:DropDownList ID="LstBxLocation" runat="server" OnSelectedIndexChanged="DropDownLocation_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>
                <br />
            </div>
        </div>
        <div class="row">
            <div class="col s12">

                <asp:GridView ID="GridRestaurants" class="bordered centered striped" HorizontalAlign="Center" runat="server" Width="100%" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Restaurant">
                            <ItemTemplate>
                                <asp:LinkButton Restaurant="LinkButton1" OnClick="GridSelection_Click" Text='<%#Eval("Restaurant")%>' runat="server">LinkButton</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Veg" DataField="Veg" />
                        <asp:BoundField HeaderText="NonVeg" DataField="NonVeg" />
                        <asp:BoundField HeaderText="Offers" DataField="Offers" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>


        <div class="row">
            <div class="col s2 m3">
                <div class="card hoverable medium">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="Images/Meat.jpg">
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4">Barbaque Nation<i class="material-icons right">more_vert</i></span>
                        <p><a href="http://www.barbeque-nation.com/" class="pink-text">Barbaque Nation</a></p>
                    </div>
                    <div class="card-reveal">
                        <span class="card-title grey-text text-darken-4">Barbaque Nation<i class="material-icons right">close</i></span>
                        <p>Looking for a buffet? We have variety of choices for you to select</p>
                        <a href="http://www.barbeque-nation.com/" class="pink-text">Barbaque Nation</a>
                    </div>
                </div>
            </div>

            <div class="col s2 m3">
                <div class="card medium hoverable">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="Images/julbord.jpg">
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4">Happinezz<i class="material-icons right">more_vert</i></span>
                        <p><a href="http://www.happinez.com/" class="pink-text">Happinezz</a></p>
                    </div>
                    <div class="card-reveal">
                        <span class="card-title grey-text text-darken-4">Happinezz<i class="material-icons right">close</i></span>
                        <p>A great restaurant for you and your family to have fun!</p>
                        <a href="http://www.happinez.com/" class="pink-text">Happinezz</a>
                    </div>
                </div>
            </div>

             <div class="col s2 m3">
                <div class="card hoverable medium">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="Images/indian.jpg">
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4">Tortillas<i class="material-icons right">more_vert</i></span>
                        <p> <a href="https://www.tortilla.co.uk/" class="pink-text">Tortillas</a></p>
                    </div>
                    <div class="card-reveal">
                        <span class="card-title grey-text text-darken-4">Tortillas<i class="material-icons right">close</i></span>
                        <p>Tired of Indian food? Try something new at Tortiallas a popular chain of mexican food.</p>
                        <a href="https://www.tortilla.co.uk/" class="pink-text">Tortillas</a>
                    </div>
                </div>
            </div>

           <div class="col s2 m3">
                <div class="card hoverable medium">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="Images/burger.jpg">
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4">Mc'Donalds<i class="material-icons right">more_vert</i></span>
                        <p> <a href="https://www.mcdelivery.co.in/?utm_source=google&utm_medium=cpc&utm_campaign=google_web&gclid=Cj0KEQjwt6fHBRDtm9O8xPPHq4gBEiQAdxotvEoOy2kdt0rQKpNhtpr-ARfVtxoIXsZZDQPXGBeG_uoaAg7t8P8HAQ" class="pink-text">Mc'Donalds</a></p>
                    </div>
                    <div class="card-reveal">
                        <span class="card-title grey-text text-darken-4">Mc'Donalds<i class="material-icons right">close</i></span>
                        <p>Quick food on the go. With our drive through open 24x7.</p>
                        <a href="https://www.mcdelivery.co.in/?utm_source=google&utm_medium=cpc&utm_campaign=google_web&gclid=Cj0KEQjwt6fHBRDtm9O8xPPHq4gBEiQAdxotvEoOy2kdt0rQKpNhtpr-ARfVtxoIXsZZDQPXGBeG_uoaAg7t8P8HAQ" class="pink-text">Mc'Donalds</a>
                    </div>
                </div>
            </div>
            </div>
    </main>
</asp:Content>
