<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="studentInfo.aspx.cs" Inherits="DiuAcsCnt.ui.studentInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <section class="content-header">
        <h1>Diu Student Management
       
            <small>Add student to device</small>
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
                        <h3 class="box-title">Student Management </h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-2">
                                <div class="form-group">

                                    <asp:TextBox ID="txtbxStudentID" placeholder="Enter Student ID" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>

                            </div>
                            <div class="col-md-2 margin-left-1">
                                <div>
                                    <asp:Button ID="btnStudentSearch" CommandArgument="0" OnClick="btnStudentSearch_Click" CssClass="btn btn-success" runat="server" Text="Get StudentInfo" />

                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        Student Name
                                    </label>
                                    <asp:TextBox ID="txtbxStudentName" placeholder="Enter Student Name" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>
                                        Department Name
                                    </label>
                                    <asp:TextBox ID="txtbxDeptName" placeholder="Department Name" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>
                                        Diu Card ID
                                    </label>
                                    <asp:TextBox ID="txtbxDiuCardId" placeholder="Enter Diu Card Id" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>
                                        Ic Card
                                    </label>
                                    <asp:TextBox ID="txtbxIcCard" placeholder="" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>
                                        Card Issue Date
                                    </label>
                                    <asp:TextBox ID="txtbxIssueDate" data-date-format="dd/mm/yyyy" CssClass="form-control datepicker" runat="server"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>
                                        Card Expire Date
                                    </label>
                                    <asp:TextBox ID="txtbExpireDate" data-date-format="dd/mm/yyyy" CssClass="form-control datepicker" runat="server"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>
                                        Access Zone Name
                                    </label>
                                    <asp:DropDownList ID="DefaultZone" CssClass="select2 form-control" runat="server" SelectionMode="Single">
                                        <asp:ListItem Text="Zone 1" Value="Zone 1" />
                                        <asp:ListItem Text="Zone 2" Value="Zone 2" />
                                        <asp:ListItem Text="Zone 3" Value="Zone 3" />
                                        <asp:ListItem Text="Zone 4" Value="Zone 4" />

                                    </asp:DropDownList>
                                </div>
                            </div>



                        
                        </div>
                    </div>

                    <div class="box-footer">
                        <asp:Button ID="btnStudentAdd" CommandArgument="0" OnClick="btnStudentAdd_Click" CssClass="btn btn-success" runat="server" Text="Add Student to Access Manage" />

                    </div>
                </div>
                <!-- /.box-body -->

            </div>
        </div>
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
                        <asp:GridView ID="StudentListGridView" runat="server" AutoGenerateColumns="false" CssClass=" table table-bordered table-striped dataTable">
                            <Columns>
                                <asp:BoundField DataField="Serial" HeaderText="#" />
                                <asp:BoundField DataField="StudentId" HeaderText="StudentId" />
                                <asp:BoundField DataField="StudentName" HeaderText="Name" />
                                <asp:BoundField DataField="DeptName" HeaderText="Dept" />
                                <asp:BoundField DataField="DefaultZone" HeaderText="Zone" />
                                <asp:BoundField DataField="DiuCardId" HeaderText="CardId" />
                                <asp:BoundField DataField="IcCard" HeaderText="Card" />
                                <asp:BoundField DataField="IssueDate" HeaderText="Create" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="ExpireDate" HeaderText="Expire" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>

                                        <i class="<%# getStatusMening( Eval("IsSync").ToString())  %> "><i class=' fa fa-refresh'></i></i>

                                        <%-- <p class='<%# getStatusMening( Eval("IsSync").ToString())  %>  '><i class="fa fa-refresh"></i></p>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%-- <asp:BoundField DataField="IsSync" HeaderText="Status" />--%>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="editLinkButton" CssClass="btn btn-primary" runat="server" OnClick="editLinkButton_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                                        <asp:LinkButton ID="deleteLinkButton" CssClass="btn btn-danger clickProcessing" runat="server" OnClick="deleteLinkButton_Click"><i class="fa fa-trash"></i></asp:LinkButton>
                                         <asp:LinkButton ID="removeStudentCardfromDeviceButton" CssClass="bg-yellow-active btn btn-primary" runat="server" OnClick="removeStudentCardfromDeviceButton_Click"><i class="fa fa-remove"></i></asp:LinkButton>
                                        <asp:LinkButton ID="addStudentCardToDeviceButton" CssClass="bg-green-gradient btn btn-primary" runat="server" OnClick="addStudentCardToDeviceButton_Click"><i class="fa fa-arrow-right"></i></asp:LinkButton>
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

            $('#<%= StudentListGridView.ClientID %>').DataTable({
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
