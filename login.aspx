<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="DiuAcsCnt.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <%--<link href="/Content/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/Content/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/Content/Ionicons/css/ionicons.min.css" rel="stylesheet" />

    <link href="/Content/appsite/css/skins/skin-purple.min.css" rel="stylesheet" />
    <link href="/Content/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <link href="/Content/morris.js/morris.css" rel="stylesheet" />
    <link href="/Content/plugins/iCheck/flat/_all.css" rel="stylesheet" />
    <link href="/Content/plugins/datatable/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="/Content/select2/css/select2.min.css" rel="stylesheet" />
    <link href="/Content/appsite/css/AdminLTE.min.css" rel="stylesheet" />
    <link href="Content/intlTelInput.min.css" rel="stylesheet" />
    <link href="/Content/appsite/css/AlertBox.css" rel="stylesheet" />--%>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic" />
    <script src="/Content/jquery/jquery.min.js" type="text/javascript"></script>
    <%-- <link href="/Content/toast/jquery.toast.min.css" rel="stylesheet" />--%>
    <link href="Content/login/Style.css" rel="stylesheet" />
    <style>
        .visible {
            display: block;
        }

        .visible {
            display: block;
        }

        .invisible {
            display: none;
        }

        * {
            font-family: sans-serif;
        }

        .content-center {
            width: 75%;
            margin: 0px auto;
        }
    </style>

</head>
<body class="hold-transition login-page">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="UpdatePanel1" ChildrenAsTriggers="false">
            <ContentTemplate>

                <input type="hidden" runat="server" id="apikey" />
                <input type="hidden" runat="server" id="authDomain" />
                <input type="hidden" runat="server" id="databaseURL" />
                <input type="hidden" runat="server" id="projectId" />
                <input type="hidden" runat="server" id="storageBucket" />
                <input type="hidden" runat="server" id="messagingSenderId" />
                <asp:HiddenField ID="HiddenField1" runat="server" />



                <div class="overlay visible"></div>

                <div class="modal position visible">



                    <div class="form">

                        <div class="form-inner">
                            <!-- Tabs-->
                            <div class="tabs">
                                <ul class="tabs login-tabs">

                                    <li class="center">
                                        <i class="fa fa-users" aria-hidden="true"></i><b style="margin-left: 10px;">Diu Login</b>
                                    </li>
                                </ul>


                                <div class="form-content current" id="phoneModal">

                                    <div class="row center userbox">
                                        <div class="form-group has-feedback">
                                            <asp:TextBox ID="txtbxloginId" CssClass="form-control field black" placeholder="Email" TextMode="Email" runat="server"></asp:TextBox>
                                            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                                        </div>

                                        <div class="form-group has-feedback">
                                            <asp:TextBox ID="txtbxPass" CssClass="form-control field black" placeholder="********" TextMode="Password" runat="server"></asp:TextBox>
                                            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                                        </div>
                                        <asp:Button ID="btnLogin" CssClass="flat-button signin verify" OnClick="btnLogin_Click" runat="server" Text="Sign In" />
                                        <%--<div class="form-group has-feedback">--%>
                                        <%-- <button id="submitPhone" name="sign-in-button" class="flat-button signin verify">Submit</button>--%>

                                        <%-- <asp:LinkButton ID="" class="flat-button signin verify" OnClick="lnkbtnLogin_Click" runat="server">Sign In</asp:LinkButton>--%>

                                        <%-- </div>--%>
                                    </div>


                                </div>

                            </div>



                        </div>
                    </div>
                </div>

                <!--------------------------------------------------------------------------------------------------------------------------------------------------------->





            </ContentTemplate>
            <Triggers>
                <%--  <asp:AsyncPostBackTrigger ControlID="btnLogin" EventName="Click" />--%>
            </Triggers>
        </asp:UpdatePanel>
        <script src="https://www.gstatic.com/firebasejs/5.7.2/firebase.js"></script>
        <script src="/Content/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="Scripts/login/Script.js"></script>
        <script src="/Content/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="/Content/morris.js/morris.min.js" type="text/javascript"></script>
        <script src="/Content/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <script src="/Content/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <script src="/Content/plugins/iCheck/icheck.min.js"></script>
        <script src="Scripts/intlTelInput.js"></script>
        <script src="/Content/plugins/datatable/js/jquery.dataTables.min.js"></script>
        <script src="/Content/plugins/datatable/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="/Content/appsite/js/adminlte.min.js" type="text/javascript"></script>
        <script src="/Content/select2/js/select2.full.min.js"></script>
        <script src="/Script/JSLib.js"></script>
        <script src="/Content/toast/jquery.toast.min.js"></script>
        <script src="/Content/toast/toasthandle.js"></script>
        <script src="/Scripts/Firebase/AuthInit.js"></script>
        <script src="/Scripts/Firebase/Login.js"></script>

        <script type="text/javascript">

            $(document).ready(function () {

                function EnterEvent(e) {
<%--                    alert(1);
                    if (e.keyCode == 13) {
                        document.getElementById('<%= lnkbtnLogin.ClientID %>').click();
                    }--%>
                };

                $(document).on('click', '.toolbar a[data-target]', function (e) {
                    e.preventDefault();
                    var target = $(this).data('target');
                    $('#login_box').hide();//hide others
                    $('#code-box').hide();
                    $('#forgot-box').hide();
                    $('#verify-box').hide();
                    $('#passchange-box').hide();
                    $('#pin-box').hide();
                    $(target).show(600);//show target
                });



            });

        </script>
        <link href="/Content/site.css" rel="stylesheet" />
    </form>
</body>
</html>
