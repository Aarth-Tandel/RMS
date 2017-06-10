<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/MasterPageAdmin.Master" CodeBehind="UserRegistraion.aspx.cs" Inherits="RstMgn.Admin.UserRegistraion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.modal').modal();
        });
    </script>
    <script src="../Scripts/Validation/UserRegistrationValidation.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <a href="Admin.aspx">
        <img src="../Images/ic_arrow_back_black_24dp_2x.png" /></a>
    <div class="container">
        <h2 class="center-align">List of Users for Vascos</h2>
        <div class="row" style="margin-top: 10%">        
            <div class="col s6 input-field">
                <div class="col s12">
                    <blockquote>Want to add a User click below</blockquote>
                    <a class="modal-trigger waves-effect waves-light btn" href="#AddUser">User</a>
                    <div id="AddUser" class="modal modal-fixed-footer">
                        <div class="modal-content">
                            <div class="container">
                                <h2 class="center-align">Add User</h2>
                                <div class="row" style="margin-top: 10%">
                                    <div class="col s12 input-field">
                                        <i class="material-icons prefix">person</i>
                                        <asp:TextBox ID="TxtUsername" runat="server" type="text" class="validate"></asp:TextBox>
                                        <label for="TxtBxUsername">Username</label>
                                    </div>

                                    <div class="col s12 input-field">
                                        <i class="material-icons prefix">vpn_key</i>
                                        <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" type="text" class="validate"></asp:TextBox>
                                        <label for="TxtPassword">Password</label>
                                    </div>

                                    <div class="col s12 input-field">
                                        <i class="material-icons prefix">vpn_key</i>
                                        <asp:TextBox ID="TxtRePasword" runat="server" TextMode="Password" type="text" class="validate"></asp:TextBox>
                                        <label for="TxtRePasword">Confirm Password</label>
                                    </div>
                                    <div class="col s12 center-align">
                                        <asp:Button ID="BtnAddUser" runat="server" OnClick="BtnAdd_Click" OnClientClick="return ValidDetails()" Text="Save" CssClass="modal-action waves-effect waves-green btn-flat teal big center-align white-text" />
                                    </div>
                                    <asp:Label ID="LblStatus" runat="server" Text="Label" Visible="False" type="text" class="validate"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col s6 container center-align" style="text-align: center">
                <asp:GridView ID="GridUser" runat="server" AutoGenerateColumns="false" class="responsive-table striped centered">
                    <Columns>
                        <asp:BoundField HeaderText="Username" DataField="Username" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
