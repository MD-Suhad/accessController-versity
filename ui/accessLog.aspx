<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="accessLog.aspx.cs" Inherits="DiuAcsCnt.ui.accessLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="server">

    <section class="content-header">
        <h1>Access Log
       
            <small>All log of devices</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="/Default.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Dashboard</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div id="msgbox" runat="server" visible="false" class="alert alert-warning">
                <button type="button" class="close" data-dismiss="alert">
                    &times;</button>
                <h4>
                    <asp:Label ID="msgTitleLabel" runat="server" Text=""></asp:Label>
                </h4>
                <asp:Label ID="msgDetailLabel" runat="server" Text=""></asp:Label>
            </div>

            <asp:HiddenField ID="hdnFldSerial" runat="server" />

            <asp:HiddenField ID="hdnFldFlag" runat="server" />
            <div class="col-md-12">
                <div class="box box-info">
                    <div class="box-header">

                        <h3>
                            <asp:Label ID="headerTitle" runat="server" Text="">Access Log List</asp:Label>
                        </h3>

                        <%--                        <h3 ID="headerTitle"class="box-title">Access Log List</h3>--%>
                    </div>





                    <div class="box-body">

                        <%--  <div class="row">

                            <div>
                                <asp:Button ID="btngetAlldevicelog" CommandArgument="0" OnClick="btngetAlldevicelog_Click" CssClass="btn btn-success" runat="server" Text="Show Access Log" />
                            </div>


                            <div>
                                <asp:Button ID="btngetAllRawLog" CommandArgument="0" OnClick="btngetAllRawLog_Click" CssClass="btn btn-success" runat="server" Text="Show Raw Log" />
                            </div>


                        </div>--%>



                        <div class="row">
                            <div class="col-lg-2">
                                <div class="form-group">

                                    <asp:Button ID="btngetAlldevicelog" CommandArgument="0" OnClick="btngetAlldevicelog_Click" CssClass="btn btn-success" runat="server" Text="Show Access Log" />

                                </div>

                            </div>
                            <div class="col-md-1 margin-left-1">
                                <div>
                                    <asp:Button ID="btngetAllRawLog" CommandArgument="0" OnClick="btngetAllRawLog_Click" CssClass="btn btn-success" runat="server" Text="Show Raw Log" />

                                </div>

                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>
                                        Student ID
                                    </label>
                                    <asp:TextBox ID="txtbxStudentID" placeholder="Enter Student ID" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>
                            </div>


                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>
                                        Ic Card
                                    </label>
                                    <asp:TextBox ID="txtbxIcCard" placeholder="" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>
                                        Form
                                    </label>
                                    <asp:TextBox ID="txtbxIssueDate" data-date-format="dd/mm/yyyy" CssClass="form-control datepicker" runat="server"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>
                                      Till
                                    </label>
                                    <asp:TextBox ID="txtbExpireDate" data-date-format="dd/mm/yyyy" CssClass="form-control datepicker" runat="server"></asp:TextBox>

                                </div>
                            </div>



                            <div class="col-lg-6">
                                <div class="form-group">

                                    <asp:Button ID="btnSearchLog" CommandArgument="0" OnClick="btnSearchLog_Click" CssClass="btn btn-success" runat="server" Text="Search" />

                                </div>

                            </div>

                        </div>


                        <div class="box-body">


                            <div class="dataTables_wrapper form-inline dt-bootstrap">


                                <asp:GridView ID="GridViewAccessLog" runat="server" AutoGenerateColumns="false" CssClass=" table table-bordered table-striped dataTable">
                                    <Columns>

                                        <asp:BoundField DataField="Logtime" HeaderText="Logtime" />
                                        <asp:BoundField DataField="StudentId" HeaderText="StudentId" />
                                        <asp:BoundField DataField="IcCard" HeaderText="IcCard" />


                                        <asp:BoundField DataField="AccessGate" HeaderText="AccessGate" />
                                        <asp:BoundField DataField="DeviceId" HeaderText="DeviceId" />
                                        <%--<asp:BoundField DataField="DeviceIp" HeaderText="DeviceIp" />
                                        --%>
                                        <asp:BoundField DataField="DeviceRecordId" HeaderText="DeviceRecordId" />


                                    </Columns>
                                </asp:GridView>
                                <asp:GridView ID="GridViewRawLog" runat="server" AutoGenerateColumns="false" CssClass=" table table-bordered table-striped dataTable">
                                    <Columns>


                                        <asp:BoundField DataField="DeviceId" HeaderText="deviceId" />

                                        <asp:BoundField DataField="CardNumber" HeaderText="CardNumber" />
                                        <asp:BoundField DataField="LogTime" HeaderText="LogTime" />
                                        <asp:BoundField DataField="DeviceSerial" HeaderText="DeviceSerial" />
                                        <asp:BoundField DataField="LogType" HeaderText="LogType" />
                                        <asp:BoundField DataField="DeviceType" HeaderText="DeviceType" />
                                        <asp:BoundField DataField="DoorNo" HeaderText="DoorNo" />
                                        <asp:BoundField DataField="ControllerSerial" HeaderText="ControllerSerial" />

                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="scriptPlaceHolder" runat="server">
    <script>
        $('.datepicker').datepicker({
            autoclose: true
        });
        $(function () {
            //Initialize Select2 Elements
            $('.select2').select2();

        });
        <%--$(function () {

            $('#<%= GridViewAccessLog.ClientID %>').DataTable({
                'paging': true,
                'lengthChange': false,
                'searching': true,
                'ordering': true,
                'info': true,
                'autoWidth': false,
                'stateSave': true
            })


        });--%>
    </script>
</asp:Content>
