<%@ Page Title="Login | ESS Project" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ESS.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .form-control:focus, .invalid-feedback:focus {
            outline: none;
            box-shadow: none;
            border: 1px solid #000000;
        }

        .form-control.is-invalid:focus, .was-validated .form-control:invalid:focus {
            outline: none;
            box-shadow: none;
        }

        .form-control.is-valid:focus, .was-validated .form-control:valid:focus {
            outline: none;
            box-shadow: none;
        }

        .btnLogin {
            height: 10%;
        }

        .animated-button {
		  background-color: #4CAF50;
		  color: #ffffff;
		  border: none;
          border-radius: 5px;
		  padding: 15px 35px;
		  text-align: center;
		  text-decoration: none;
		  display: inline-block;
		  font-size: 16px;
		  margin: 4px 2px;
		  cursor: pointer;
		  transition-duration: 0.4s;
		}

		.animated-button:hover {
		  background-color: #3e8e41;
		  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
		}
    </style>

    <div class="mainDev">
        <div class="container-login">
            <div class="wrap-login">
                <div class="card shadow">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="container">
                                    <h3 class="sysTitle text-white">EMPLOYEE SELF SERVICE</h3>
                                    <p>Please Log In to your ESS account.</p>

                                    <form class="requires-validation" novalidate runat="server">

                                        <div class="form-floating">
                                            <asp:TextBox ID="txtAccountCode" CssClass="form-control" placeholder="Account Code" AutoCompleteType="Disabled" runat="server" required />
                                            <div class="invalid-feedback">
                                                Account Code is required
                                            </div>
                                            <label for="txtAccountCode" class="form-label">Access Code</label>
                                        </div>

                                        <br />

                                        <div class="form-floating">
                                            <asp:TextBox ID="txtEmpNoNam" CssClass="form-control" placeholder="Username or Employee Code" AutoCompleteType="Disabled" runat="server" required />
                                            <div class="invalid-feedback">
                                                Username or Employee Code Code is required
                                            </div>
                                            <label for="txtEmpNoNam">Username or Employee Code</label>
                                        </div>

                                        <br />

                                        <div class="form-floating">
                                            <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server" required />
                                            <div class="invalid-feedback">
                                                Password is required
                                            </div>
                                            <label for="txtPassword">Password</label>
                                        </div>

                                        <br />

                                        <div class="form-group">
                                            <asp:Button ID="btnLogin" CssClass="animated-button" OnClick="btnLogin_Click" Text="Secure login" Width="100%" runat="server" />
                                        </div>

                                        <div class="form-group mt-3 mb-3">
                                            <asp:LinkButton ID="lnkbtnForPass" CssClass="text-decoration-none small link-primary" runat="server">Forgot Password?</asp:LinkButton>
                                        </div>

                                        <script>                                           
                                            (function () {                                                                                      
                                                'use strict'
                                                const forms = document.querySelectorAll('.requires-validation')
                                                Array.from(forms)
                                                    .forEach(function (form) {
                                                        form.addEventListener('submit', function (event) {
                                                            if (!form.checkValidity()) {
                                                                event.preventDefault()
                                                                event.stopPropagation()
                                                            }

                                                            form.classList.add('was-validated')
                                                        }, false)
                                                    })
                                            })()
                                        </script>
                                    </form>
                                </div>
                            </div>
                            <div class="col-md-6 sideIMG"></div>
                        </div>
                    </div>
                </div>
                <p class="small pt-3" style="text-align: center">&copy; 2022 DeveloperJNOD | All Rights Reserved</p>
            </div>
        </div>
    </div>
</asp:Content>
