<%@ Page Title="" Language="C#" MasterPageFile="~/SiteApp.Master" AutoEventWireup="true" CodeBehind="OBFiling.aspx.cs" Inherits="ESS.OBFiling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function openModal() {
            document.getElementById("hiddenBtn").click();
        }
    </script>
    <div class="container-fluid">
        <!-- Page Header -->
        <div class="container-fluid mb-2">
            <span>
                <label class="pageTitle">OB Filing</label>
            </span>
            <span>
                <asp:LinkButton ID="lnkBackButton" CssClass="btn-sm nav-link float-end backButton" OnClick="lnkBackButton_Click" runat="server"><i class="fa fa-arrow-left"></i>&nbsp;Back</asp:LinkButton>
            </span>
        </div>
        <!-- End Page Header -->

        <hr />

        <div class="container-fluid">
            <span>
                <a href="#" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#OBForm" style="font-size: 14px;"><i class="fa fa-plus-circle"></i>&nbsp;New</a>
                <a href="#" id="hiddenBtn" data-bs-toggle="modal" data-bs-target="#OBForm" style="display: none"></a>
            </span>
        </div>
    </div>

    <!-- User Form [Modal] -->
    <div class="modal fade" id="OBForm" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h5 class="modal-title"><i class="fa fa-edit"></i>&nbsp;New OB Filing</h5>
                    <button type="button" class="btn-close btn-sm" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <label>Fill out the following details.</label>

                    <div class="row mt-3">
                        <div class="col-md-4">
                            <label class="form-control-plaintext">Client:</label>
                        </div>
                        <div class="col-md">
                            <asp:DropDownList ID="ddClient" CssClass="form-control" runat="server" />
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-md-4">
                            <label class="form-control-plaintext">Date:</label>
                        </div>
                        <div class="col-md">
                            <asp:TextBox ID="txtDate" CssClass="form-control" TextMode="Date" runat="server" />
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-md-4">
                            <label class="form-control-plaintext">Time In:</label>
                        </div>
                        <div class="col-md">
                            <asp:DropDownList ID="ddTimeIn" CssClass="form-control" runat="server" />
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-md-4">
                            <label class="form-control-plaintext">Time Out:</label>
                        </div>
                        <div class="col-md">
                            <asp:DropDownList ID="ddTimeOut" CssClass="form-control" OnTextChanged="ddTimeOut_TextChanged" AutoPostBack="true" runat="server" />
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-md-4">
                            <label class="form-control-plaintext">Hours Field:</label>
                        </div>
                        <div class="col-md">
                            <asp:TextBox ID="txtHoursFields" CssClass="form-control bg-light" Style="text-align: right" Enabled="false" runat="server" />
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-md-4">
                            <label class="form-control-plaintext">Remarks:</label>
                        </div>
                        <div class="col-md">
                            <asp:TextBox ID="txtRemarks" CssClass="form-control" TextMode="MultiLine" runat="server" />
                        </div>
                    </div>

                    <!-- Action Button -->
                    <div class="col-md-12 mt-3" style="text-align: right">
                        <asp:Button ID="btnInsert" CssClass="btn btn-success btn-sm" Text="Save" runat="server" />
                        <button type="button" class="btn btn-danger btn-sm" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End User Form [Modal] -->

</asp:Content>
