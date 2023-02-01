<%@ Page Title="Profile | ESS" Language="C#" MasterPageFile="~/SiteApp.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="ESS.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .lblName {
            font-size: 18px;
            font-weight: 600;
        }
        .lblVal {
            font-size: 18px;
        }
        .sec2Header {
            font-weight: 600;
        }
    </style>
    <div class="container-fluid">
        <!-- Page Header -->
        <div class="container-fluid mb-2">
            <span>
                <label class="pageTitle">My Personal Info</label>
            </span>
            <span>
                <asp:LinkButton ID="lnkBackButton" CssClass="btn-sm nav-link float-end backButton" OnClick="lnkBackButton_Click" runat="server"><i class="fa fa-arrow-left"></i>&nbsp;Back</asp:LinkButton>
            </span>
        </div>
        <!-- End Page Header -->

        <hr />

        <div class="row">
            <div class="col-md">
                <!-- Header -->
                <div class="card shadow-sm">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-2">
                                <label class="form-control-plaintext lblName">Access Code:</label>
                            </div>
                            <div class="col-md">
                                <asp:Label ID="lblAccCode" CssClass="form-control-plaintext lblVal" runat="server" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <label class="form-control-plaintext lblName">Employee No.:</label>
                            </div>
                            <div class="col-md">
                                <asp:Label ID="lblEmpCode" CssClass="form-control-plaintext lblVal" runat="server" />
                            </div>
                        </div>                        
                        <div class="row">
                            <div class="col-md-2">
                                <label class="form-control-plaintext lblName">Employee Name:</label>
                            </div>
                            <div class="col-md">
                                <asp:Label ID="lblEmpName" CssClass="form-control-plaintext lblVal" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Header -->

                <br />

                <!-- Section 1 -->
                <div class="card shadow-sm">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row mb-2">
                                    <div class="col-md-4">
                                        <label class="form-control-plaintext formConLabel">TIN:</label>
                                    </div>
                                    <div class="col-md">
                                        <asp:Label ID="lblTIN" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-4">
                                        <label class="form-control-plaintext formConLabel">SSS No:</label>
                                    </div>
                                    <div class="col-md">
                                        <asp:Label ID="lblSSS" CssClass="form-control" runat="server" />
                                    </div>
                                </div>                                                               
                            </div>
                            <div class="col-md-6">
                                <div class="row mb-2">
                                    <div class="col-md-4">
                                        <label class="form-control-plaintext formConLabel">PHIC No:</label>
                                    </div>
                                    <div class="col-md">
                                        <asp:Label ID="lblPHIC" CssClass="form-control" runat="server" />
                                    </div>
                                </div> 
                                <div class="row mb-2">
                                    <div class="col-md-4">
                                        <label class="form-control-plaintext formConLabel">HDMF No:</label>
                                    </div>
                                    <div class="col-md">
                                        <asp:Label ID="lblHDMF" CssClass="form-control" runat="server" />
                                    </div>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Section 1 -->

                <br />

                <!-- General Section -->
                <div class="card shadow-sm">
                    <div class="card-body">                     
                        <h5 class="sec2Header"><u>General</u></h5>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Position:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblPosition" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Department:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblDepartment" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Employment Type:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblEmpType" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Date Hired:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblDateHired" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Date Regular:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblDateRegular" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Date Seperated:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblDateSeperated" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Contract Start:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblContractStart" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Contract End:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblContractEnd" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Team:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblTeam" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Immediate Superior:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblImmSuperior" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Location:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblLocation" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Shift Schedule:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblShiftSchedule" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Bank:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblBank" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Account Type:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblAccountType" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-4"><labe class="form-control-plaintext formConLabel">Account No</labe></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblAccountNo" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Webkiosk Role:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblWebRole" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End General Section -->

                <br />

                <!-- Personal Information Section -->
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="sec2Header"><u>Personal Information</u></h5>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Registered Address:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblRegAddress" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Local Address:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblLocalAddress" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Foreign Address:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblForeignAddress" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Telephone Number:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblTelNum" CssClass="form-control" runat="server" />
                                    </div>
                                </div>    
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Mobile Number:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblMobNum" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">                                
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Gender:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblGender" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Birth Date:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblBirthDate" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Email Address:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblEmailAddress" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-4"><label class="form-control-plaintext formConLabel">Marital Status:</label></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblMaritalStatus" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Personal Information Section -->

            </div>
        </div>
    </div>

</asp:Content>
