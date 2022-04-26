<%@ Page Title="Login | ESS" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ESS.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container p-5">
        <div class="card shadow">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6 p-3 mt-5 mb-5">
                        <div class="container">
                            <h3>Hello There!</h3>
                            <p>Please Log In to your ESS account</p>

                            <div class="form-group">
                                <asp:TextBox ID="txtAccountCode" CssClass="form-control" placeholder="Account Code" AutoCompleteType="Disabled" runat="server" />
                            </div>

                            <br />

                            <div class="form-group">
                                <asp:TextBox ID="txtUsername" CssClass="form-control" placeholder="Username or Employee Code" AutoCompleteType="Disabled" runat="server" />
                            </div>

                            <br />

                            <div class="form-group">
                                <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server" />
                            </div>

                            <br />

                            <div class="form-group">
                                <asp:Button ID="btnLogin" CssClass="btn btn-success" OnClick="btnLogin_Click" Text="Login" Width="100%" runat="server" />
                            </div>

                            <div class="form-group mt-3">
                                <asp:LinkButton ID="lnkbtnForPass" CssClass="text-decoration-none link-primary" runat="server">Forgot Password?</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 sideIMG"></div>
                </div>
            </div>
        </div>
        <p class="small pt-1" style="text-align: center">&copy; 2022 DeveloperJNOD | All RightsReserved</p>
    </div>
</asp:Content>
