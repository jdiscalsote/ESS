<%@ Page Title="Dashboard | ESS Project" Language="C#" MasterPageFile="~/SiteApp.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="ESS.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .d-grid .btn {
            color: #ffffff;
            background-color: slategray;
        }

        .btnBox {
            width: 100%;
            border: 1px solid #000000;
            background-color: #ffffff;
        }
        .btnBox:hover, .btnBox:focus {
            outline: none;
            background-color: #ededed;
            border: 1px solid #000000;
        }

        .d-grid .fa {
            transition: .3s transform ease-in-out;
        }

        .d-grid .collapsed .fa {
            transform: rotate(-90deg);
        }
    </style>

    <div class="container-fluid mt-4">
        <div class="row">
            <div class="col-md-8 p-1">
                <div class="card">
                    <div class="card-body">
                        <div class="d-grid">
                            <button type="button" class="btn btn-sm" data-bs-toggle="collapse" data-bs-target="#collap1">
                                <span class="float-start">About Me</span>
                                <span class="small"><i class="fa fa-arrow-down float-end p-1"></i></span>
                            </button>
                        </div>
                        <div id="collap1" class="collapse show">
                            <br />

                            <div class="row">
                                <div class="col-md-3">
                                    <asp:LinkButton ID="lnkProfile" CssClass="btnBox btn btn-sm" OnClick="lnkProfile_Click" runat="server">
                                        <h1><i class="fa fa-user pt-2"></i></h1>
                                        <p class="small">My Personal Info</p>
                                    </asp:LinkButton>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btnBox btn-sm">
                                        <h1><i class="fa fa-calendar-check-o pt-2"></i></h1>
                                        <p class="small">My Timesheet</p>
                                    </button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btnBox btn-sm">
                                        <h1><i class="fa fa-clock-o pt-2"></i></h1>
                                        <p class="small">Daily Time Record</p>
                                    </button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btnBox btn-sm">
                                        <h1><i class="fa fa-calculator pt-2"></i></h1>
                                        <p class="small">Shift Schedules</p>
                                    </button>
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-3">
                                    <button type="button" class="btnBox btn-sm">
                                        <h1><i class="fa fa-vcard pt-2"></i></h1>
                                        <p class="small">Leave Balances</p>
                                    </button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btnBox btn-sm">
                                        <h1><i class="fa fa-vcard pt-2"></i></h1>
                                        <p class="small">Leave Ledger</p>
                                    </button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btnBox btn-sm">
                                        <h1><i class="fa fa-calendar pt-2"></i></h1>
                                        <p class="small">My Calendar</p>
                                    </button>
                                </div>
                                <div class="col-md-3">
                                    <asp:LinkButton ID="lnkChangePass" CssClass="btnBox btn btn-sm" data-bs-toggle="modal" data-bs-target="#changePass" runat="server">
                                        <h1><i class="fa fa-lock pt-2"></i></h1>
                                        <p class="small">Change Password</p>
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <br />

                <div class="card">
                    <div class="card-body">
                        <div class="d-grid">
                            <button type="button" class="btn btn-sm" data-bs-toggle="collapse" data-bs-target="#collap2">
                                <span class="float-start">Filing</span>
                                <span class="small"><i class="fa fa-arrow-down float-end p-1"></i></span>
                            </button>
                        </div>
                        <div id="collap2" class="collapse show">
                            <br />

                            <div class="row">
                                <div class="col-md-3">
                                    <asp:LinkButton ID="lnkLeaveFil" CssClass="btnBox btn btn-sm" OnClick="lnkLeaveFil_Click" runat="server">
                                        <h1><i class="fa fa-file-text pt-2"></i></h1>
                                        <p class="small">Leave Filing</p>
                                    </asp:LinkButton>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btnBox btn-sm">
                                        <h1><i class="fa fa-clock-o pt-2"></i></h1>
                                        <p class="small">Overtime Filing</p>
                                    </button>
                                </div>
                                <div class="col-md-3">
                                    <asp:LinkButton ID="lnkOBFil" CssClass="btnBox btn btn-sm" OnClick="lnkOBFil_Click" runat="server">
                                        <h1><i class="fa fa-clock-o pt-2"></i></h1>
                                        <p class="small">OB Filing</p>
                                    </asp:LinkButton>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btnBox btn-sm">
                                        <h1><i class="fa fa-clock-o pt-2"></i></h1>
                                        <p class="small">Time Log Filing</p>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <br />

                <div class="card">
                    <div class="card-body">
                        <div class="d-grid">
                            <button type="button" class="btn btn-sm" data-bs-toggle="collapse" data-bs-target="#collap3">
                                <span class="float-start">My Payroll Info</span>
                                <span class="small"><i class="fa fa-arrow-down float-end p-1"></i></span>
                            </button>
                        </div>
                        <div id="collap3" class="collapse show">
                            <br />

                            <div class="row">
                                <div class="col-md-3">
                                    <asp:LinkButton ID="lnkPayslip" CssClass="btnBox btn btn-sm" data-bs-toggle="modal" data-bs-target="#payslip" runat="server">
                                        <h1><i class="fa fa-dollar pt-2"></i></h1>
                                        <p class="small">Payslip</p>
                                    </asp:LinkButton>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btnBox btn-sm">
                                        <h1><i class="fa fa-clipboard pt-2"></i></h1>
                                        <p class="small">2316 Report</p>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4 p-1">
                <div class="card">
                    <div class="card-body">
                        <div class="d-grid">
                            <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="collapse" data-bs-target="#btnSideSec">
                                <span class="float-start">Announcements</span>
                                <span class="small"><i class="fa fa-arrow-down float-end p-1"></i></span>
                            </button>
                        </div>
                        <div id="btnSideSec" class="collapse show">
                            No Announcements
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Change Password [Modal] -->
    <div class="modal fade" id="changePass" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h5 class="modal-title">
                        <span class="fa-passwd-reset fa-stack small">
                            <i class="fa fa-undo fa-stack-2x"></i>
                            <i class="fa fa-lock fa-stack-1x"></i>
                        </span>&nbsp;Change Password
                    </h5>
                    <button type="button" class="btn-close btn-sm" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <label>Fill out the following details.</label>

                    <div class="row mt-3">
                        <div class="col-md-4">
                            <label class="form-control-plaintext">Old Password:</label>
                        </div>
                        <div class="col-md">
                            <asp:TextBox ID="txtOldPass" CssClass="form-control" TextMode="Password" runat="server" required />
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-md-4">
                            <label class="form-control-plaintext">New Password:</label>
                        </div>
                        <div class="col-md">
                            <asp:TextBox ID="txtNewPass" CssClass="form-control" TextMode="Password" runat="server" required />
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-md-4">
                            <label class="form-control-plaintext">Confirm Password:</label>
                        </div>
                        <div class="col-md">
                            <asp:TextBox ID="txtConfPass" CssClass="form-control" TextMode="Password" runat="server" required />
                        </div>
                    </div>
                </div>

                <!-- Action Button -->
                <div class="modal-footer">
                    <div class="col-md-12" style="text-align: right">
                        <asp:Button ID="btnInsert" CssClass="btn btn-success btn-sm" Text="Update" runat="server" />
                        <button type="button" class="btn btn-danger btn-sm" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </div>
                <!-- End Action Button -->
            </div>
        </div>
    </div>
    <!-- End Change Password [Modal] -->

    <!-- Payslip [Modal] -->
    <div class="modal fade" id="payslip" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h5 class="modal-title"><i class="fa fa-dollar"></i>&nbsp;Payslip</h5>
                    <button type="button" class="btn-close btn-sm" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <label>Fill out the following details.</label>

                    <div class="row mt-3">
                        <div class="col-md-4">
                            <label class="form-control-plaintext">Month:</label>
                        </div>
                        <div class="col-md">
                            <asp:DropDownList ID="ddMonth" CssClass="form-control" runat="server" required />
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-md-4">
                            <label class="form-control-plaintext">Period:</label>
                        </div>
                        <div class="col-md">
                            <asp:DropDownList ID="ddPeriod" CssClass="form-control" runat="server" required />
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-md-4">
                            <label class="form-control-plaintext">Year:</label>
                        </div>
                        <div class="col-md">
                            <asp:TextBox ID="txtYear" CssClass="form-control" runat="server" required />
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-md-4">
                            <label class="form-control-plaintext">Format:</label>
                        </div>
                        <div class="col-md">
                            <asp:DropDownList ID="ddFormat" CssClass="form-control" runat="server" required />
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-md-4">
                            <label class="form-control-plaintext">Password:</label>
                        </div>
                        <div class="col-md">
                            <asp:TextBox ID="txtPassword" CssClass="form-control" TextMode="Password" runat="server" required />
                        </div>
                    </div>
                </div>

                <!-- Action Button -->
                <div class="modal-footer">
                    <div class="col-md-12" style="text-align: right">
                        <asp:Button ID="btnGenerate" CssClass="btn btn-success btn-sm" Text="Generate" runat="server" />
                        <button type="button" class="btn btn-danger btn-sm" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </div>
                <!-- End Action Button -->
            </div>
        </div>
    </div>
    <!-- End Payslip [Modal] -->

</asp:Content>
