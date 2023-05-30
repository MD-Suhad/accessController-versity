<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="AccessManage.aspx.cs" Inherits="DiuAcsCnt.ui.AccessManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="server">

    <section class="content-header">
        <h1>Access Management
       
            <small>All Access information</small>
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
                       <%-- <h3 class="box-title">Student Management </h3>--%>
                    </div>
                    <div class="box-body">

                        <div class="row">

                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>
                                        Student ID
                                    </label>
                                    <asp:TextBox ID="txtbxStudentId" placeholder="Enter Student ID" CssClass="form-control" runat="server"></asp:TextBox>

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
                                        Issue Date
                                    </label>
                                    <asp:TextBox ID="txtbxIssueDate" data-date-format="dd/mm/yyyy" CssClass="form-control datepicker" runat="server"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>
                                        Card Expire
                                    </label>
                                    <asp:TextBox ID="txtbxExpireDate" data-date-format="dd/mm/yyyy" CssClass="form-control datepicker" runat="server"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        Devices
                                    </label>
                                    <asp:DropDownList ID="lstDevices" CssClass="select2 form-control" runat="server"></asp:DropDownList>
                                  
                                </div>
                            </div>


                            

                        </div>

                        <div class="row">
                            <div class="col-md-2 margin-left-1">

                                <div class="form-group">
                                    
                                    <asp:Button ID="btnAcManageUpdate" CommandArgument="0" OnClick="btnAcManageUpdate_Click" CssClass="btn btn-success" runat="server" Text="Update Data" />

                                </div>

                            </div>

                        </div>


                    </div>


                </div>
                <!-- /.box-body -->

            </div>
        </div>

        <%--<div class="box-footer">
                        <asp:Button ID="btnStudentAdd" CommandArgument="0" OnClick="btnStudentAdd_Click" CssClass="btn btn-success" runat="server" Text="Add Student to Access Manage" />

               
        <asp:HiddenField ID="hdnFldSerial" runat="server" />
        <asp:HiddenField ID="hdnFldFlag" runat="server" />
        <div class="row">
            <div class="box box-info">
                <div class="box-header">
                    <h3 class="box-title">Student List</h3>
                </div>
                <div class="box-body ">
                    <div class="dataTables_wrapper form-inline dt-bootstrap">




                        <%-- SELECT [Serial],[],[],[],[],[],[],[],[CreatedBy],[CreatedDate],[CreatedFrom],[ModifiedBy],[ModifiedDate],[ModifiedFrom],[IsDelete],[CountryOrder] FROM [dbo].[CountryInfo]--%>

        <asp:HiddenField ID="hdnFldSerial" runat="server" />
        <asp:HiddenField ID="hdnFldFlag" runat="server" />
        <div class="row">
            <div class="box box-info">
                <div class="box-header">
                    <h3 class="box-title">Access Manage List</h3>
                </div>
                <div class="box-body ">
                    <div class="dataTables_wrapper form-inline dt-bootstrap">
                        <asp:GridView ID="grdViewAccessMange" runat="server" AutoGenerateColumns="false" CssClass=" table table-bordered table-striped dataTable">
                            <Columns>
                                <asp:BoundField DataField="Serial" HeaderText="#" />
                                <asp:BoundField DataField="StudentId" HeaderText="StudentId" />
                                <asp:BoundField DataField="IcCard" HeaderText="IcCard" />
                                <asp:BoundField DataField="DeviceId" HeaderText="deviceId" />
                                <asp:BoundField DataField="DeviceIp" HeaderText="IP" />
                                <asp:BoundField DataField="IssueDate" HeaderText="Create" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="ExpireDate" HeaderText="Expire" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <i class='<%# getStatusMening( Eval("IsSync").ToString())  %> '><i class="fa fa-refresh align-items-center"></i></i>
                                    </ItemTemplate>
                                </asp:TemplateField>
                              <%--  <asp:BoundField DataField="IsSync" HeaderText="Status" />--%>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="editAccessButton" CssClass="btn btn-primary" runat="server" OnClick="editAccessButton_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                       <asp:LinkButton ID="removeCardfromDeviceButton" CssClass="bg-red-gradient btn btn-primary" runat="server" OnClick="removeCardfromDeviceButton_Click"><i class="fa fa-remove"></i></asp:LinkButton>
<%--                                        <asp:LinkButton ID="addStudentCardToDeviceButton" CssClass="btn btn-primary" runat="server" OnClick="addStudentCardToDeviceButton_Click"><i class="fa fa-arrow-right"></i></asp:LinkButton>--%>
                                        <asp:LinkButton ID="syncDeviceAccessButton" CssClass="bg-green-gradient btn btn-primary" runat="server" OnClick="syncDeviceAccessButton_Click"><i class="fa fa-arrow-right"></i></asp:LinkButton>

                                    </ItemTemplate>
                                   
                                </asp:TemplateField>


                            </Columns>
                        </asp:GridView>

                    </div>
                </div>

            </div>
        </div>

    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder" runat="server">
    <script>
        $('.datepicker').datepicker({
            autoclose: true
        });
        $(function () {
            //Initialize Select2 Elements
            $('.select2').select2();

        });
        $(function () {

            $('#<%= grdViewAccessMange.ClientID %>').DataTable({
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
<%-- SELECT [Serial],[],[],[],[],[],[],[],[CreatedBy],[CreatedDate],[CreatedFrom],[ModifiedBy],[ModifiedDate],[ModifiedFrom],[IsDelete],[CountryOrder] FROM [dbo].[CountryInfo]--%>
<%--  <asp:GridView ID="AccManageListGridView" runat="server" AutoGenerateColumns="false" CssClass=" table table-bordered table-striped dataTable">
                                <Columns>
                                    <asp:BoundField DataField="DeviceId" HeaderText="deviceId" />
                                    <asp:BoundField DataField="DeviecIp" HeaderText="IP" />
                                     <asp:BoundField DataField="logId" HeaderText="Id" />
                                    <asp:BoundField DataField="IcCard" HeaderText="IcCard" />
                                     <asp:BoundField DataField="Logtime" HeaderText="Logtime" />
                                    <asp:BoundField DataField="AccessGate" HeaderText="AccessGate" />
                                     <asp:BoundField DataField="StudentId" HeaderText="StudentId" />
                                    <asp:BoundField DataField="DeviceRecordId" HeaderText="DeviceRecordId" />--%>