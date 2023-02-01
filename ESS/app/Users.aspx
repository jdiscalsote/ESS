<%@ Page Title="Users | ESS" Language="C#" MasterPageFile="~/SiteApp.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="ESS.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .modal-body, .modalInput {
            font-size: 12px;
        }

            .modalInput:focus {
                border-color: inherit;
                -webkit-box-shadow: none;
                box-shadow: none;
            }
    </style>
    <div class="container-fluid">

        <!-- Page Header -->
        <div class="container-fluid mb-2">
            <span>
                <label class="pageTitle">User Management</label>
            </span>
        </div>
        <!-- End Page Header -->

        <hr />

        <div class="container-fluid mb-2">
            <span>
                <label class="pt-2">User List</label>
            </span>
            <span>
                <a href="#" class="btn btn-outline-success addButton" data-bs-toggle="modal" data-bs-target="#userForm">Add User&nbsp;<i class="fa fa-plus-circle"></i></a>
            </span>
        </div>

        <!-- Table Section -->
        <div class="row p-2">
            <div class="col-md-12">
                <div class="table-responsive-md">
                    <asp:GridView ID="usersListTable" runat="server" GridLines="None" CssClass="border-top table bg-white shadow-sm" AutoGenerateColumns="False" HeaderStyle-ForeColor="#ffffff" HeaderStyle-HorizontalAlign="Left">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkView" Font-Underline="false" Text="View" OnClick="lnkView_Click" CommandArgument='<%# Eval("AccessCode" )%>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="AccessCode" HeaderText="AccessCode" />
                            <asp:BoundField DataField="EmpNo" HeaderText="EmpNo" />
                            <asp:BoundField DataField="UserNam" HeaderText="Employee Name" />
                            <asp:BoundField DataField="Username" HeaderText="Username" />
                            <asp:BoundField DataField="Password" HeaderText="Password" />
                            <asp:BoundField DataField="Role" HeaderText="Role" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
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
    <div class="modal fade" id="userForm" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h5 class="modal-title">Create New User</h5>
                    <button type="button" class="btn-close btn-sm" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="row mb-2">
                                <div class="col-md-4">
                                    <label for="txtAccessCode" class="form-control-plaintext">Access Code:</label>
                                </div>
                                <div class="col-md">
                                    <asp:TextBox ID="txtAccessCode" CssClass="form-control modalInput" runat="server" required />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row mb-2">
                                <div class="col-md-4">
                                    <label class="form-control-plaintext">Employee No:</label>
                                </div>
                                <div class="col-md">
                                    <asp:TextBox ID="txtEmpNo" CssClass="form-control modalInput" runat="server" required />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="row mb-2">
                                <div class="col-md-4">
                                    <label class="form-control-plaintext">Username:</label>
                                </div>
                                <div class="col-md">
                                    <asp:TextBox ID="txtUsername" CssClass="form-control modalInput" runat="server" required />
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-md-4">
                                    <label class="form-control-plaintext">First Name:</label>
                                </div>
                                <div class="col-md">
                                    <asp:TextBox ID="txtFirstNam" CssClass="form-control modalInput" runat="server" required />
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-md-4">
                                    <label class="form-control-plaintext">Middle Name:</label>
                                </div>
                                <div class="col-md">
                                    <asp:TextBox ID="txtMiddleName" CssClass="form-control modalInput" runat="server" required />
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-md-4">
                                    <label class="form-control-plaintext">Last Name:</label>
                                </div>
                                <div class="col-md">
                                    <asp:TextBox ID="txtLastNam" CssClass="form-control modalInput" runat="server" required />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row mb-2">
                                <div class="col-md-4">
                                    <label class="form-control-plaintext">Set Role:</label>
                                </div>
                                <div class="col-md">
                                    <asp:DropDownList ID="ddRole" CssClass="form-control modalInput" runat="server" required />
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-md-4">
                                    <label class="form-control-plaintext">Set Password:</label>
                                </div>
                                <div class="col-md">
                                    <asp:TextBox ID="txtPassword" CssClass="form-control modalInput" TextMode="Password" runat="server" required />
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-md-4">
                                    <label class="form-control-plaintext">Confirm Password:</label>
                                </div>
                                <div class="col-md">
                                    <asp:TextBox ID="txtConPassword" CssClass="form-control modalInput" TextMode="Password" runat="server" required />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Action Button -->
                <div class="row p-2">
                    <div class="col-md-12" style="text-align: right">
                        <asp:Button ID="btnInsert" CssClass="btn btn-success btn-sm" OnClick="btnInsert_Click" Text="Save" runat="server" />
                        <button type="button" class="btn btn-danger btn-sm" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- End User Form [Modal] -->

</asp:Content>
