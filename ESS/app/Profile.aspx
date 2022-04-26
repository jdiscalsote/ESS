<%@ Page Title="Profile | ESS" Language="C#" MasterPageFile="~/SiteApp.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="ESS.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        h5 {
            font-weight: 600;
        }
        h6 {
            font-size: 14px;
            font-weight: 600;
        }
        .h6_Label {
            font-size: 14px;
        }
        .h5_Header {
            border-bottom: 2px solid #800000;
        }
    </style>
    <div class="container-fluid mt-4">
        <div class="row">
            <div class="col-md">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-2">
                                <h5>Employee Code:</h5>
                            </div>
                            <div class="col-md">
                                <asp:Label ID="lblEmpCode" Text="2021001726" CssClass="form-control-plaintext" runat="server" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <h5>Access Code:</h5>
                            </div>
                            <div class="col-md">
                                <asp:Label ID="lblAccCode" Text="20211726" CssClass="form-control-plaintext" runat="server" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <h5>Employee Name:</h5>
                            </div>
                            <div class="col-md">
                                <asp:Label ID="lblEmpName" Text="DISCALSOTE, JOHN NICOLE O." CssClass="form-control-plaintext" runat="server" />
                            </div>
                        </div>
                        <hr style="border-top: 2px solid #800000; margin-top: -5px" />
                        <div class="row pt-1">
                            <div class="col-md-6">
                                <div class="row  ">
                                    <div class="col-md-4">
                                        <h6>TIN:</h6>
                                    </div>
                                    <div class="col-md">
                                        <asp:Label ID="Label2" CssClass="h6_Label" Text="357-100-292" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <h6>SSS No:</h6>
                                    </div>
                                    <div class="col-md">
                                        <asp:Label ID="Label3" CssClass="h6_Label" Text="34-8196658-2" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <h6>PHIC No:</h6>
                                    </div>
                                    <div class="col-md">
                                        <asp:Label ID="Label4" CssClass="h6_Label" Text="03-026366620-4" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <h6>HDMF No:</h6>
                                    </div>
                                    <div class="col-md">
                                        <asp:Label ID="Label5" CssClass="h6_Label" Text="1212-4340-0891" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-4">
                                        <h6>Birth Date:</h6>
                                    </div>
                                    <div class="col-md">
                                        <asp:Label ID="Label1" CssClass="h6_Label" Text="02/02/1998" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <br /> <br />

                        <h5 class="h5_Header">General</h5>
                        <div class="row pt-1">
                            <div class="col-md-6  ">
                                <div class="row">
                                    <div class="col-md-4"><h6>Position:</h6></div>
                                    <div class="col-md">
                                        <asp:Label ID="lblPosition" CssClass="h6_Label" Text="FLI_A156" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4"><h6>Department:</h6></div>
                                    <div class="col-md">
                                        <asp:Label ID="Label6" CssClass="h6_Label" Text="ITG" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4"><h6>Employment Type:</h6></div>
                                    <div class="col-md">
                                        <asp:Label ID="Label7" CssClass="h6_Label" Text="PROBATIONARY" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4"><h6>Date Hired:</h6></div>
                                    <div class="col-md">
                                        <asp:Label ID="Label8" CssClass="h6_Label" Text="10/16/2021" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4"><h6>Date Regular:</h6></div>
                                    <div class="col-md">
                                        <asp:Label ID="Label9" CssClass="h6_Label" Text="" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4"><h6>Date Seperated:</h6></div>
                                    <div class="col-md">
                                        <asp:Label ID="Label10" CssClass="h6_Label" Text="" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4"><h6>Contract Start:</h6></div>
                                    <div class="col-md">
                                        <asp:Label ID="Label11" CssClass="h6_Label" Text="" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4"><h6>Contract End:</h6></div>
                                    <div class="col-md">
                                        <asp:Label ID="Label12" CssClass="h6_Label" Text="" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6  ">
                                <div class="row">
                                    <div class="col-md-4"><h6>Team:</h6></div>
                                    <div class="col-md">
                                        <asp:Label ID="Label13" CssClass="h6_Label" Text="ITG" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4"><h6>Immediate Superior:</h6></div>
                                    <div class="col-md">
                                        <asp:Label ID="Label14" CssClass="h6_Label" Text="BASILIO, RICHARD R." runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4"><h6>Location:</h6></div>
                                    <div class="col-md">
                                        <asp:Label ID="Label15" CssClass="h6_Label" Text="MAKATI" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4"><h6>Shift Schedule:</h6></div>
                                    <div class="col-md">
                                        <asp:Label ID="Label16" CssClass="h6_Label" Text="FLEXI 8 HRS - 07:30 AM to 09:00 AM <br> (NCWW)_NO SAT" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4"><h6>Bank:</h6></div>
                                    <div class="col-md">
                                        <asp:Label ID="Label17" CssClass="h6_Label" Text="METROBANK" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4"><h6>Account Type:</h6></div>
                                    <div class="col-md">
                                        <asp:Label ID="Label18" CssClass="h6_Label" Text="SA" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4"><h6>Account No</h6></div>
                                    <div class="col-md">
                                        <asp:Label ID="Label19" CssClass="h6_Label" Text="0963896899938" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4"><h6>Webkiosk Role:</h6></div>
                                    <div class="col-md">
                                        <asp:Label ID="Label20" CssClass="h6_Label" Text="Staff" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
