<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="AccessZone.aspx.cs" Inherits="DiuAcsCnt.ui.AccessZone" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <section class="content-header">
        <h1>AccessZone Management
       
            <small>Add Device to AccessZone</small>
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
                        <h3 class="box-title">Access Zone Info </h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        Access Zone Name
                                    </label>
                                    <asp:DropDownList ID="lstZone" CssClass="select2 form-control" runat="server" SelectionMode="Single">
                                        <asp:ListItem Text="Zone 1" Value="Zone 1" />
                                        <asp:ListItem Text="Zone 2" Value="Zone 2" />
                                        <asp:ListItem Text="Zone 3" Value="Zone 3" />
                                        <asp:ListItem Text="Zone 4" Value="Zone 4" />

                                    </asp:DropDownList>
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

                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <asp:Button ID="btnAccessZoneSave" CommandArgument="0" OnClick="btnAccessZoneSave_Click1" CssClass="btn btn-success" runat="server" Text="Map to AccessZone" />

                    </div>
                </div>
            </div>
            <asp:HiddenField ID="hdnFldSerial" runat="server" />
            <asp:HiddenField ID="hdnFldFlag" runat="server" />
            <div class="col-md-12">
                <div class="box box-info">
                    <div class="box-header">
                        <h3 class="box-title">Access Zone List</h3>
                    </div>
                    <div class="box-body ">
                        <div class="dataTables_wrapper form-inline dt-bootstrap">

                            <%-- SELECT [Serial],[],[],[],[],[],[],[],[CreatedBy],[CreatedDate],[CreatedFrom],[ModifiedBy],[ModifiedDate],[ModifiedFrom],[IsDelete],[CountryOrder] FROM [dbo].[CountryInfo]--%>
                            <asp:GridView ID="DeviceZoneMapGridView" runat="server" AutoGenerateColumns="false" CssClass=" table table-bordered table-striped dataTable">
                                <Columns>
                                    <asp:BoundField DataField="SerialId" HeaderText="#" />
                                    <asp:BoundField DataField="AccessZone" HeaderText="Access Zone" />
                                    <asp:BoundField DataField="DeviceId" HeaderText="Device Id" />
                                    <asp:BoundField DataField="DeviceName" HeaderText="Device Name" />
                                   <%-- <asp:BoundField DataField="DevicePort" HeaderText="Port" />--%>

                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <%-- <asp:LinkButton ID="editLinkButton" CssClass="btn btn-primary" runat="server" OnClick="editLinkButton_Click"><i class="fa fa-edit"></i></asp:LinkButton>--%>
                                            <asp:LinkButton ID="deleteLinkButton" CssClass="btn btn-danger clickProcessing" runat="server" OnClick="deleteLinkButton_Click"><i class="fa fa-trash"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                  
                                </Columns>
                            </asp:GridView>

                        </div>
                    </div>
                    <!-- /.box-body -->
                    <%--                    <div class="box-footer">
                      
                    </div>--%>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptPlaceHolder" runat="server">
    <script>
        $(function () {

            $('#<%= DeviceZoneMapGridView.ClientID %>').DataTable({
                 'paging': true,
                 'lengthChange': false,
                 'searching': true,
                 'ordering': true,
                 'info': true,
                 'autoWidth': false,
                 'stateSave': true
             })


         })
    </script>
</asp:Content>
