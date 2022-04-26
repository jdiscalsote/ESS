<%@ Page Title="Dashboard | ESS" Language="C#" MasterPageFile="~/SiteApp.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="ESS.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .d-grid .btn {
            color: #ffffff;
            background-color: slategray;
        }
        .btnBox {
            width: 100%;
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
                                    <asp:LinkButton ID="lnkProfile" CssClass="btnBox btn btn-sm border-dark" OnClick="lnkProfile_Click" OnClientClick="TargetBlank();" runat="server">
                                        <h1><i class="fa fa-user pt-2"></i></h1>
                                        <p class="small">My Personal Info</p>
                                    </asp:LinkButton>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btnBox btn btn-sm border-dark">
                                        <h1><i class="fa fa-calendar-check-o pt-2"></i></h1>
                                        <p class="small">My Timesheet</p>
                                    </button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btnBox btn btn-sm border-dark">
                                        <h1><i class="fa fa-clock-o pt-2"></i></h1>
                                        <p class="small">Daily Time Record</p>
                                    </button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btnBox btn btn-sm border-dark">
                                        <h1><i class="fa fa-calculator pt-2"></i></h1>
                                        <p class="small">Shift Schedules</p>
                                    </button>
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-3">
                                    <button type="button" class="btnBox btn btn-sm border-dark">
                                        <h1><i class="fa fa-vcard pt-2"></i></h1>
                                        <p class="small">Leave Balances</p>
                                    </button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btnBox btn btn-sm border-dark">
                                        <h1><i class="fa fa-vcard pt-2"></i></h1>
                                        <p class="small">Leave Ledger</p>
                                    </button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btnBox btn btn-sm border-dark">
                                        <h1><i class="fa fa-calendar pt-2"></i></h1>
                                        <p class="small">My Calendar</p>
                                    </button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btnBox btn btn-sm border-dark">
                                        <h1><i class="fa fa-lock pt-2"></i></h1>
                                        <p class="small">Change Password</p>
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
                            <button type="button" class="btn btn-sm" data-bs-toggle="collapse" data-bs-target="#collap2">
                                <span class="float-start">Filing</span>
                                <span class="small"><i class="fa fa-arrow-down float-end p-1"></i></span>                              
                            </button>
                        </div>
                        <div id="collap2" class="collapse show">
                            <br />

                            <div class="row">
                                <div class="col-md-3">
                                    <button type="button" class="btnBox btn btn-sm border-dark">
                                        <h1><i class="fa fa-file-text pt-2"></i></h1>
                                        <p class="small">Leave Filing</p>
                                    </button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btnBox btn btn-sm border-dark">
                                        <h1><i class="fa fa-clock-o pt-2"></i></h1>
                                        <p class="small">Overtime Filing</p>
                                    </button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btnBox btn btn-sm border-dark">
                                        <h1><i class="fa fa-clock-o pt-2"></i></h1>
                                        <p class="small">OB Filing</p>
                                    </button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btnBox btn btn-sm border-dark">
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
                                    <button type="button" class="btnBox btn btn-sm border-dark">
                                        <h1><i class="fa fa-dollar pt-2"></i></h1>
                                        <p class="small">Payslip</p>
                                    </button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btnBox btn btn-sm border-dark">
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

    <script type="text/javascript">
        function TargetBlank() {
        document.forms[0].target = "_blank";
    }
    </script>
</asp:Content>
