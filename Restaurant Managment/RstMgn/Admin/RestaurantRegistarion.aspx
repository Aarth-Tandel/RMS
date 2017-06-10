<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/MasterPageAdmin.Master" CodeBehind="RestaurantRegistarion.aspx.cs" Inherits="RstMgn.Admin.RestaurantRegistarion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="../Scripts/Validation/MenuValidation.js"></script>
    <script src="../Scripts/Validation/RestaurantRegistrationValidation.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.modal').modal();
            $('select').material_select();

        });
        function showmodalpopup() {
            $('.modal').modal();
            $('#Menu').modal('open');
        }
        function test() {
            var id = $('#<%=LstBxCity.ClientID%> option:selected').text();
            PageMethods.testFunction(id, onSucceed, onError);
        }
        function onSucceed(result) {

            debugger;
            var select = document.getElementById('<%= LstBxLocation.ClientID %>');
            var rad = $("#LstBxLocation")

            for (var i = 0; i < result.length; i++) {
                alert(result[i]);
                $(select).append("<option value=" + i + ">" +
                         result[i] + "</option>");
            }
        }

        function onError(result) {
            alert("Error Occured");
        }
    </script>
    <style type="text/css">
        .hiddencol {
            display: none;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
    <a href="Admin.aspx">
        <img src="../Images/ic_arrow_back_black_24dp_2x.png" /></a>
    <div class="container">
        <h2 class="center-align">Here is the list of restaurants</h2>
        <blockquote>Want to add a Restaurant click below</blockquote>
        <a class="modal-trigger waves-effect waves-light btn" href="#AddRestaurant">Restaurant</a>
        <div class="row">
            <div class="col s6" style="margin-top: 5%">

                <div id="AddRestaurant" class="modal modal-fixed-footer">
                    <div class="modal-content">
                        <h2 class="center-align">Add Restaurant</h2>
                        <div class="row" style="margin-top: 10%">

                            <div class="col s12 input-field">
                                <i class="material-icons prefix">label</i>
                                <asp:TextBox ID="TxtBxName" runat="server" type="text" class="validate"></asp:TextBox>
                                <label for="TxtBxName">Restaurant Name</label>
                            </div>

                            <div class="col s6 input-field">
                                <asp:DropDownList ID="LstBxCity" class="browser-default" runat="server" onchange="test();" AppendDataBoundItems="true"></asp:DropDownList>
                            </div>


                            <div class="col s6 input-field">
                                <asp:DropDownList ID="LstBxLocation" class="browser-default" runat="server"></asp:DropDownList>
                            </div>


                            <div class="col s12">
                                Food Type:
                    <asp:CheckBox ID="ChkBxVeg" runat="server" />
                                <label for="MainContent_ChkBxVeg">Veg</label>
                                <asp:CheckBox ID="ChkBxNonVeg" runat="server" />
                                <label for="MainContent_ChkBxNonVeg">Non-Veg</label>
                            </div>

                            <div class="col s12">
                                Offers:
                    <asp:CheckBox ID="ChkbxOffers" runat="server" />
                                <label for="MainContent_ChkbxOffers">Offers</label>
                            </div>
                            <div class="col s12 input-field">
                                <i class="material-icons prefix">label</i>
                                <asp:TextBox ID="TxtBxReviews" runat="server" type="text" class="validate"></asp:TextBox>
                                <label for="TxtBxReviews">Rating out of 5</label>
                            </div>
                            <div class="col s12 center-align">
                                <asp:Button ID="BtnSubmit" runat="server" OnClientClick="return ValidDetails()" OnClick="BtnSubmit_Click" Text="Save" CssClass=" center-align waves-effect waves-white  teal btn-flat white-text" />
                                <asp:Label ID="LblStatus" runat="server" Text="Label" Visible="False"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col s12 container">
        <asp:GridView ID="GridRestaurant" runat="server" AutoGenerateColumns="false" class="centered striped responsive-table">
            <Columns>
                <asp:TemplateField ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="ID" runat="server" Text='<%#Eval("ID")%>'></asp:Label>
                        <asp:HiddenField ID="HiddenID" runat="server" Value='<%#Eval("ID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Restaurant">
                    <ItemTemplate>
                        <asp:LinkButton ID="Restaurant" OnClick="GridSelection_Click" Text='<%#Eval("Restaurant")%>' runat="server"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="City">
                    <ItemTemplate>
                        <asp:Label ID="City" Text='<%#Eval("City")%>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Location">
                    <ItemTemplate>
                        <asp:Label ID="Location" Text='<%#Eval("Location")%>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Food Offered">
                    <ItemTemplate>
                        <asp:Image ImageUrl='<%#Eval("Veg").Equals("Yes")?"../Images/veg_small.jpg":""%>' runat="server"></asp:Image>
                        <asp:Image ImageUrl='<%#Eval("nonveg").Equals("Yes")?"../Images/non-veg_small.jpg":""%>' runat="server"></asp:Image>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol">
                    <ItemTemplate>
                        <asp:Label ID="Veg" runat="server" Text='<%#Eval("Veg")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol">
                    <ItemTemplate>
                        <asp:Label ID="Nonveg" runat="server" Text='<%#Eval("nonveg")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol">
                    <ItemTemplate>
                        <asp:Label ID="Reviews" runat="server" Text='<%#Eval("Reviews")%>'></asp:Label>
                        <asp:HiddenField ID="HiddenReviews" runat="server" Value='<%#Eval("Reviews") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol">
                    <ItemTemplate>
                        <asp:Label ID="Offers" runat="server" Text='<%#Eval("Offers")%>'></asp:Label>
                        <asp:HiddenField ID="HiddenOffers" runat="server" Value='<%#Eval("Offers") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>


    <div id="Menu" class="modal modal-fixed-footer">
        <div class="modal-content">
            <div class="row">

                <h2 class="center-align">Add Menu</h2>
                <h4 class="center-align">
                    <asp:Label ID="LblRestaurantName" runat="server" Text="restaurant"></asp:Label></h4>

                <div class="col s6">
                    <table style="width: 100%;">
                        <tr>
                            <td>City:</td>

                            <td>
                                <asp:Label ID="LblCity" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Location:</td>
                            <td>
                                <asp:Label ID="LblLocation" runat="server" Text="Label"></asp:Label></td>

                        </tr>
                        <tr>
                            <td>Food Types:</td>
                            <td>
                                <asp:Image runat="server" ID="VegImg" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Image runat="server" ID="NonvegImg" /></td>
                        </tr>
                        <tr>
                            <td>Offers: </td>
                            <td>
                                <asp:Label ID="LblOffers" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Ratings:</td>
                            <td>
                                <asp:Label ID="LblReviews" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                    </table>
                </div>

                <div class="col s6">
                    <div class="col s12 input-field">
                        <i class="material-icons prefix">label</i>
                        <asp:TextBox ID="TxtDish" runat="server" type="text" class="validate"></asp:TextBox>
                        <label for="TxtDish">Dish</label>
                    </div>

                    <div class="col s12 input-field">
                        <i class="material-icons prefix">label</i>
                        <asp:TextBox ID="TxtPrice" runat="server" type="text" class="validate"></asp:TextBox>
                        <label for="TxtPrice">Price</label>
                    </div>

                    <div class="col s12">
                        FoodType:
                            <p>
                                <asp:RadioButton ID="RadioBtnVeg" runat="server" GroupName="Menu" />
                                <label for="MainContent_RadioBtnVeg">Veg</label>
                            </p>
                        <p>
                            <asp:RadioButton ID="RadioBtnNonveg" runat="server" GroupName="Menu" />
                            <label for="MainContent_RadioBtnNonveg">Non-Veg</label>
                        </p>
                    </div>

                </div>
            </div>
            <div class="col s12 center-align">
                <asp:Button ID="BtnAddMenu" OnClientClick="return ValidMenuDetails()" runat="server" Text="Save" class="modal-action waves-effect waves-white btn-flat teal white-text big" OnClick="BtnAddRestaurant_Click" />
            </div>
            <div class="col s12 center-align">
                <asp:Label ID="LblRestaurantAdded" runat="server" Text="Label" Visible="false"></asp:Label>
            </div>
        </div>
        <div class="modal-footer">
            <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
        </div>
    </div>


</asp:Content>
