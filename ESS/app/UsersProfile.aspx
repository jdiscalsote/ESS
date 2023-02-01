<%@ Page Title="Users Profile | ESS Project" Language="C#" MasterPageFile="~/SiteApp.Master" AutoEventWireup="true" CodeBehind="UsersProfile.aspx.cs" Inherits="ESS.UsersProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .nav .nav-item > a:hover {
            color: #000000;
            border: 1px solid #000000;
            background-color: rgba(255,255,255,1);
        }

        .nav .nav-item > a.active {
            color: #000000;
            background-color: #ffffff;
            border: 1px solid #000000;
        }
    </style>
    <div class="container-fluid">
        <!-- Page Header -->
        <div class="container-fluid mb-2">
            <span>
                <label class="pageTitle">User Profile</label>
            </span>
            <span>
                <asp:LinkButton ID="lnkBackButton" CssClass="btn-sm nav-link float-end backButton" OnClick="lnkBackButton_Click" runat="server"><i class="fa fa-arrow-left"></i>&nbsp;Back</asp:LinkButton>
            </span>
        </div>
        <!-- End Page Header -->

        <hr />

        <div class="row">
            <!-- Left Side Profile -->
            <div class="col-md-3 mb-2">
                <div class="card text-center shadow">
                    <div class="card-img-top">
                        <img src="../image/img_avatar1.png" class="img-fluid shadow-sm userProfieIMG" />
                    </div>
                    <div class="card-body">
                        <asp:Label ID="lblEmpName" CssClass="fw-bolder" runat="server" />
                        <br />
                        <asp:Label ID="lblRole" CssClass="text-sm-center text-muted" runat="server" />

                        <div class="row mt-5">
                            <div class="col-md container" style="border-top: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; border-bottom: 1px solid #d5d5d5">
                                <dl class="pt-3">
                                    <dt>
                                        <asp:Label ID="lblTotalLogin" CssClass="fw-bolder opacity-75" runat="server" />
                                    </dt>
                                    <dd class="small text-muted" style="font-size: 12px">Total Login</dd>
                                </dl>
                            </div>
                            <div class="col-md container" style="border-top: 1px solid #d5d5d5; border-bottom: 1px solid #d5d5d5">
                                <dl class="pt-3">
                                    <dt>
                                        <asp:Label ID="lblPageVisit" CssClass="fw-bolder opacity-75" runat="server" />
                                    </dt>
                                    <dd class="small text-muted" style="font-size: 12px">Total Page Visit</dd>
                                </dl>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 pt-3"><i class="fa fa-calendar" style="border: 1px solid #808080; border-radius: 50%; font-size: 20px; padding: 8px;"></i></div>
                            <div class="col-md text-start">
                                <dl class="pt-3">
                                    <dt>
                                        <label class="opacity-75">Last Login</label>
                                    </dt>
                                    <dd class="small text-muted" style="font-size: 12px">
                                        <asp:Label ID="lblLastLogin" runat="server" />
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Left Side Profile -->

            <!-- Right Side Profile -->
            <div class="col-md-9">
                <div class="card shadow">
                    <asp:UpdatePanel ID="UpdatePanel" runat="server">
                        <ContentTemplate>
                            <!-- Nav Tabs -->
                            <div id="main-content" class="card-header">
                                <ul class="nav nav-pills nav-justified" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-bs-toggle="pill" href="#EditProfile" role="tab" aria-controls="EditProfile" aria-selected="true">Edit Profile</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-bs-toggle="pill" href="#ChangePassword" role="tab" aria-controls="ChangePassword" aria-selected="false">Change Password</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-bs-toggle="pill" href="#LogIn" role="tab" aria-controls="LogIn" aria-selected="false">Log In</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-bs-toggle="pill" href="#PageVisit" role="tab" aria-controls="PageVisit" aria-selected="false">Page Visit</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- End Nav Tabs -->
                            <div class="card-body">
                                <!-- Tab Panels -->
                                <div class="tab-content">
                                    <!-- Edit Profile -->
                                    <div id="EditProfile" class="container tab-pane fade show active" role="tabpanel">
                                        <div class="row mb-5">
                                            <div class="col-md-4">
                                                <div class="card-img">
                                                    <img src="../image/img_avatar1.png" class="img-fluid img-thumbnail shadow-sm" width="130" />
                                                </div>
                                            </div>
                                            <div class="col-md">
                                                <asp:FileUpload ID="fuProfile" CssClass="form-control-sm pt-5" runat="server" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4 mb-3">
                                                <label class="formConLabel">First Name</label>
                                                <asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server" Enabled="false" />
                                            </div>
                                            <div class="col-md-4 mb-3">
                                                <label class="formConLabel">Middle Name</label>
                                                <asp:TextBox ID="txtMiddleName" CssClass="form-control" runat="server" Enabled="false" />
                                            </div>
                                            <div class="col-md-4 mb-3">
                                                <label class="formConLabel">Last Name</label>
                                                <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server" Enabled="false" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4 mb-3">
                                                <label class="formConLabel">Username</label>
                                                <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server" Enabled="false" />
                                            </div>
                                            <div class="col-md-4">
                                                <label class="formConLabel">Role</label>
                                                <asp:DropDownList ID="ddRole" CssClass="form-control" runat="server" Enabled="false" />
                                            </div>
                                            <div class="col-md-4"></div>
                                        </div>
                                    </div>
                                    <!-- End Edit Profile -->

                                    <!-- Change Password -->
                                    <div id="ChangePassword" class="container tab-pane fade" role="tabpanel">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <dl class="mb-2">
                                                    <dt>
                                                        <label class="formConLabel" style="font-weight: normal">Old Password</label>
                                                    </dt>
                                                    <dd>
                                                        <asp:TextBox ID="txtOldPass" CssClass="form-control" TextMode="Password" runat="server" />
                                                    </dd>
                                                </dl>

                                                <dl class="mb-2">
                                                    <dt>
                                                        <label class="formConLabel" style="font-weight: normal">New Password</label>
                                                    </dt>
                                                    <dd>
                                                        <asp:TextBox ID="txtNewPass" CssClass="form-control" TextMode="Password" runat="server" />
                                                    </dd>
                                                </dl>

                                                <dl class="mb-3">
                                                    <dt>
                                                        <label class="formConLabel" style="font-weight: normal">Confirm Password</label>
                                                    </dt>
                                                    <dd>
                                                        <asp:TextBox ID="txtConPass" CssClass="form-control" TextMode="Password" runat="server" />
                                                    </dd>
                                                </dl>
                                                <asp:Button ID="btnUpdatePass" CssClass="btn btn-outline-success btn-sm" Text="Update" OnClick="btnUpdatePass_Click" CausesValidation="false" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Change Password -->

                                    <div id="LogIn" class="container tab-pane fade" role="tabpanel"></div>

                                    <div id="PageVisit" class="container tab-pane fade" role="tabpanel"></div>
                                </div>
                                <!-- End Tab Panels -->
                            </div>

                            <asp:HiddenField ID="TabName" runat="server" />
                            <asp:HiddenField ID="OldPass" runat="server" />
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <script type="text/javascript">
                        $(function () {
                            SetTabs();
                        });
                        var prm = Sys.WebForms.PageRequestManager.getInstance();
                        if (prm != null) {
                            prm.add_endRequest(function (sender, e) {
                                if (sender._postBackSettings.panelsToUpdate != null) {
                                    SetTabs();
                                }
                            });
                        };
                        function SetTabs() {
                            var tabName = $("[id*=TabName]").val() != "" ? $("[id*=TabName]").val() : "EditProfile";
                            $('#main-content a[href="#' + tabName + '"]').tab('show');
                            $("#main-content a").click(function () {
                                $("[id*=TabName]").val($(this).attr("href").replace("#", ""));
                            });
                        };
                    </script>
                </div>
            </div>
            <!-- End Right Side Profile -->
        </div>
    </div>
</asp:Content>
