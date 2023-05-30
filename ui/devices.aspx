<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="devices.aspx.cs" Inherits="DiuAcsCnt.ui.devices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <section class="content-header">
        <h1>Devices
       
            <small>Add New Device</small>
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
            <div class="col-md-12">

                <div class="box box-success">
                    <div class="box-header">
                        <h3 class="box-title">Device Info </h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                             <div class="col-md-2">
                                <div class="form-group">
                                    <label>
                                        Device Controller SN
                                    </label>
                                    <asp:TextBox ID="txtbxDeviceControllerSN" placeholder="Enter Controller SN" CssClass="form-control" runat="server">

                                    </asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>
                                        Device Name
                                    </label>
                                    <asp:TextBox ID="txtbxDeviceName" placeholder="Enter device Name" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>
                                        Device Ip
                                    </label>
                                    <asp:TextBox ID="txtbxDeviceIP" placeholder="Enter Device Ip" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>
                                        Device Port
                                    </label>
                                    <asp:TextBox ID="txtbxDevicePort" placeholder="Enter Device Port" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>
                            </div>

                        </div>

                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <asp:Button ID="btnDeviceSave" CommandArgument="0" OnClick="btnDeviceSave_Click" CssClass="btn btn-success" runat="server" Text="Add Device" />

                    </div>
                </div>
            </div>
            <asp:HiddenField ID="hdnFldSerial" runat="server" />
            <asp:HiddenField ID="hdnFldFlag" runat="server" />
            <div class="col-md-12">
                <div class="box box-info">
                    <div class="box-header">
                        <h3 class="box-title">Device List</h3>
                    </div>
                    <div class="box-body ">
                        <div class="dataTables_wrapper form-inline dt-bootstrap">


                            <asp:GridView ID="DeviceListGridView" runat="server" AutoGenerateColumns="false" CssClass=" table table-bordered table-striped dataTable">
                                <Columns>

                                    <asp:BoundField DataField="DeviceId" HeaderText="#" />
                                    <asp:BoundField DataField="ControllerSN" HeaderText="Controller Serial" />
                                    <asp:BoundField DataField="DeviceName" HeaderText="Name" />
                                    <asp:BoundField DataField="DeviecIp" HeaderText="IP" />
                                    <asp:BoundField DataField="DevicePort" HeaderText="Port" />

                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="editLinkButton" CssClass="btn btn-primary" runat="server" OnClick="editLinkButton_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                            <asp:LinkButton ID="deleteLinkButton" CssClass="btn btn-danger clickProcessing" runat="server" OnClick="deleteLinkButton_Click"><i class="fa fa-trash"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                </Columns>
                            </asp:GridView>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder" runat="server">

    <%--<script type="text/javascript">
        $(document).ready(function () {
            $('#<%= DeviceListGridView.ClientID %>').DataTable();
    });
    </script>--%>
    <script>


        $(function () {
            
            $('#<%= DeviceListGridView.ClientID %>').DataTable({
                'paging': true,
                'lengthChange': false,
                'searching': true,
                'ordering': true,
                'info': true,
                'autoWidth': false,
                'stateSave': true
            })


        });

    </script>
</asp:Content>
