<%@ Page Title="Leave Filling | ESS" Language="C#" MasterPageFile="~/SiteApp.Master" AutoEventWireup="true" CodeBehind="LeaveFiling.aspx.cs" Inherits="ESS.LeaveFiling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /*.container h3 {
            color: rgba(100,100,100,0.9);
        }*/
    </style>

    <script>
        function openModal() {
            document.getElementById("hiddenBtn").click();
        }

        window.setTimeout(function () {
            $(".alert").fadeTo(500, 0)
        }, 4000);
    </script>

    <div class="container-fluid">

        <div class="position-relative">
            <div class="position-absolute top-0 end-0">
                <asp:Panel ID="panel1" runat="server" />
            </div>
        </div>

        <!-- Page Header -->
        <div class="container-fluid mb-2">
            <span>
                <label class="pageTitle">Leave Filing</label>
            </span>
            <span>
                <asp:LinkButton ID="lnkBackButton" CssClass="btn-sm nav-link float-end backButton" OnClick="lnkBackButton_Click" runat="server"><i class="fa fa-arrow-left"></i>&nbsp;Back</asp:LinkButton>
            </span>
        </div>
        <!-- End Page Header -->

        <hr />

        <div class="container-fluid">
            <span>
                <a href="#" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#leaveForm" style="font-size: 14px;"><i class="fa fa-plus-circle"></i>&nbsp;New</a>
                <a href="#" id="hiddenBtn" data-bs-toggle="modal" data-bs-target="#modalApprovers" style="display: none"></a>
            </span>
        </div>

        <!-- Table Section -->
        <div class="row p-2">
            <div class="col-md-12">
                <div class="table-responsive-md">
                    <asp:GridView ID="leaveListTable" runat="server" GridLines="None" CssClass="border-top table bg-white shadow-sm" AutoGenerateColumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-HorizontalAlign="Left">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkView" Font-Underline="false" Text="View" OnClick="lnkView_Click" CommandArgument='<%# Eval("LeaveCode" )%>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="LeaveCode" HeaderText="Leave Code" />
                            <asp:BoundField DataField="StartDate" HeaderText="Date" DataFormatString="{0:MM/dd/yyy}" />
                            <asp:BoundField DataField="LeaveType" HeaderText="Leave Type" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                            <asp:BoundField DataField="PaidLeave?" HeaderText="Paid Leave?" />
                            <asp:BoundField DataField="Reason" HeaderText="Reason" />
                        </Columns>
                        <HeaderStyle ForeColor="#31353d" CssClass="gridHeader" />
                        <RowStyle CssClass="gridRows" />
                    </asp:GridView>
                </div>
            </div>
        </div>
        <!-- End Table Section -->
    </div>

    <!-- User Form [Modal] -->
    <div class="modal fade" id="leaveForm" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h5 class="modal-title"><i class="fa fa-edit"></i>&nbsp;New Leave Filing</h5>
                    <button type="button" class="btn-close btn-sm" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <label>Fill out the following details.</label>

                    <div class="row mt-3">
                        <div class="col-md-4">
                            <label class="form-control-plaintext">Start Date:</label>
                        </div>
                        <div class="col-md">
                            <asp:TextBox ID="txtStartDt" CssClass="form-control" TextMode="Date" runat="server" />
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-md-4">
                            <label class="form-control-plaintext">End Date:</label>
                        </div>
                        <div class="col-md">
                            <asp:TextBox ID="txtEndDt" CssClass="form-control" TextMode="Date" runat="server" />
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-md-4">
                            <label class="form-control-plaintext">Leave Type:</label>
                        </div>
                        <div class="col-md">
                            <asp:DropDownList ID="ddLeaveType" CssClass="form-control" runat="server" />
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-md-4">
                            <label class="form-control-plaintext">Quantity:</label>
                        </div>
                        <div class="col-md">
                            <asp:DropDownList ID="ddQuantity" CssClass="form-control" runat="server" />
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-md-4">
                            <label class="form-control-plaintext">Reason:</label>
                        </div>
                        <div class="col-md">
                            <asp:TextBox ID="txtReason" CssClass="form-control" TextMode="MultiLine" runat="server" />
                        </div>
                    </div>

                    <!-- Action Button -->
                    <div class="col-md-12 mt-3" style="text-align: right">
                        <asp:Button ID="btnInsert" CssClass="btn btn-success btn-sm" Text="Save" OnClick="btnInsert_Click" runat="server" />
                        <button type="button" class="btn btn-danger btn-sm" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End User Form [Modal] -->

    <!-- Approvers Status [Modal] -->
    <div class="modal fade" id="modalApprovers" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h5 class="modal-title"><i class="fa fa-users"></i>&nbsp;Approvers Status</h5>
                    <button type="button" class="btn-close btn-sm" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive-md">
                                <asp:GridView ID="gridApprovers" runat="server" GridLines="None" CssClass="table bg-white shadow-sm" AutoGenerateColumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-HorizontalAlign="Left" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" EmptyDataRowStyle-HorizontalAlign="Center">
                                    <Columns>
                                        <asp:BoundField DataField="ApprovedBy" HeaderText="Approved By" />
                                        <asp:BoundField DataField="Status" HeaderText="Status" />
                                        <asp:BoundField DataField="ApproverRemarks" HeaderText="Approver Remarks" />
                                        <asp:BoundField DataField="ApprovedDate" HeaderText="Approved Date" DataFormatString="{0:MM/dd/yyy}" />
                                    </Columns>
                                    <HeaderStyle ForeColor="#31353d" CssClass="gridHeader" />
                                    <RowStyle CssClass="gridRows" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>

                    <!-- Action Button -->
                    <div class="col-md-12 mt-3" style="text-align: right">
                        <button type="button" class="btn btn-danger btn-sm" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Approvers Status [Modal] -->

</asp:Content>
