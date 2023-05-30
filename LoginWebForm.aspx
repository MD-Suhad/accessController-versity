<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginWebForm.aspx.cs" Inherits="DiuAcsCnt.LoginWebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="/Content/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
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
    <link href="/Content/appsite/css/AlertBox.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <script src="/Content/jquery/jquery.min.js" type="text/javascript"></script>
    <link href="/Content/toast/jquery.toast.min.css" rel="stylesheet" />
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
                    <div style="margin-top: -15px;">

                        <img src="http://omaxmarket.com:4041/UploadContent/others/201810082355311572_ComLogo.png" class="logo" alt="logo">
                        <div class="brand login-text">
                            <font style="text-align: center; margin-left: 23px;">Sign in with your Phone or Email</font>
                            <br>
                            <br>
                            <%--                        <strong>OR</strong><br>
                        <br>
                       If you forget your password please recover it from Forgot Password.--%>
                            <strong style="margin-left: 100px;">OR</strong><br>
                            <br>
                            <div class="row center-80">
                                <img src="Content/Images/qr/frame.png" height="200" width="200" />
                            </div>
                        </div>

                    </div>


                    <%--       <button class="brand login flat-button facebook">Verify Yourself</button>--%>


                    <div class="form position">
                        <a href="#">
                            <button class="close">x</button></a>
                        <div class="form-inner">
                            <!-- Tabs-->
                            <div class="tabs">
                                <ul class="tabs login-tabs">
                                    <li class="current" data-tab="phoneModal">
                                        <a href="#phoneModal"><i class="fa fa-phone" aria-hidden="true"></i><b style="margin-left: 10px;">Phone</b></a>
                                    </li>
                                    <li data-tab="mailModal" class="">
                                        <a href="#mailModal"><i class="fa fa-envelope" aria-hidden="true"></i><b style="margin-left: 10px;">Email</b></a>
                                    </li>
                                </ul>
                                <!--Login Form -->

                                <ul class="tabs single-tab invisible forgot-pass-tab">
                                    <li class="current" data-tab="passwordChangeModal">
                                        <a href="#passwordChangeModal"><i class="fa fa-lock" aria-hidden="true"></i><b style="margin-left: 10px;"><font style="margin-right: 10px;">Forgot</font>Password</b></a>
                                    </li>

                                </ul>

                                <ul class="tabs single-tab invisible verify-tab">
                                    <li class="current" data-tab="verifyModal">
                                        <a href="#verifyModal"><i class="fa fa-check" aria-hidden="true"></i><b style="margin-left: 10px;"><font style="margin-right: 10px;">Verify</font>Yourself</b></a>
                                    </li>

                                </ul>
                                <ul class="tabs single-tab invisible pass-tab">
                                    <li class="current" data-tab="passwordInput">
                                        <a href="#passwordInput"><i class="fa fa-check" aria-hidden="true"></i><b style="margin-left: 10px;"><font style="margin-right: 10px;">Enter</font>Password</b></a>
                                    </li>

                                </ul>
                                <ul class="tabs single-tab invisible code-tab">
                                    <li class="current" data-tab="codeInput">
                                        <a href="#codeInput"><i class="fa fa-check" aria-hidden="true"></i><b style="margin-left: 10px;"><font style="margin-right: 10px;">Enter</font>Code</b></a>
                                    </li>

                                </ul>

                                <ul class="tabs single-tab invisible passChange-tab">
                                    <li class="current" data-tab="passwordChangeModal">
                                        <a href="#passwordChangeModal"><i class="fa fa-check" aria-hidden="true"></i><b style="margin-left: 10px;"><font style="margin-right: 10px;">Enter</font>Password</b></a>
                                    </li>

                                </ul>

                                <ul class="tabs single-tab invisible pin-tab">
                                    <li class="current" data-tab="pinBox">
                                        <a href="#pinBox"><i class="fa fa-check" aria-hidden="true"></i><b style="margin-left: 10px;"><font style="margin-right: 10px;">Enter</font>Password</b></a>
                                    </li>

                                </ul>

                                <div class="form-content current" id="phoneModal">

                                    <div class="row center-90 userbox">

                                        <input name="login-id" id="user" placeholder="PHONE" class="field black" required="" style="margin-top: 10px;">
                                        <%--                                        <input type="password" name="usrpw" placeholder="PASSWORD" class="field" required="">--%>
                                        <div class="clear"></div>
                                        <a href="#" data-tab="passwordChangeModal" class="">
                                            <span class="forgot secondary-text">Forgot password?</span>
                                        </a>


                                        <div class="row">
                                            <button id="submitPhone" name="sign-in-button" class="flat-button signin verify">Verify</button>
                                        </div>

                                    </div>

                                    <%--                                    <div class="row verySection" style="margin-top: 15px; text-align: center;">
                                         <a href="#" data-tab="verifyModal" class="underline" style="color: #21506a">Verify Yourself</a>
                                    </div>--%>
                                </div>

                                <div class="form-content" id="mailModal">

                                    <div class="row center-90 userbox">

                                        <input type="email" name="login-id" class="field" style="margin-top: 10px; color: black" id="user-mail" placeholder="Email" required="">
                                        <div class="clear"></div>
                                        <a href="#" data-tab="passwordChangeModal" class="">
                                            <span class="forgot secondary-text">Forgot password?</span>
                                        </a>


                                        <div class="row">
                                            <button id="submitMail" name="sign-in-button" class="flat-button signin verify" data-mail="true">Verify</button>
                                        </div>

                                    </div>

                                </div>

                                <div class="form-content" id="passwordChangeModal">

                                    <div class="row center-90">

                                        <input type="password" name="login-id" id="user-password" placeholder="Password" class="field" required="">
                                        <input type="password" name="login-id" id="user-con-password" placeholder="Confirm Password" class="field" required="">

                                        <div class="clear"></div>

                                        <div class="row">
                                            <button id="passchange" name="sign-in-button" class="flat-button signin">Enter</button>
                                        </div>

                                    </div>

                                </div>
                                <input type="hidden" id="passStore" />
                                <div class="form-content" id="pinBox">

                                    <div class="row center-90">

                                        <input type="password" name="login-id" id="user-pin" placeholder="pin" class="field" required="">
                                        <input type="password" name="login-id" id="user-con-pin" placeholder="Confirm pin" class="field" required="">

                                        <div class="clear"></div>

                                        <div class="row">
                                            <button id="pinChange" name="sign-in-button" class="flat-button signin">Enter</button>
                                        </div>

                                    </div>

                                </div>

                                <div class="form-content" id="passwordInput">

                                    <div class="row center-90">

                                        <input type="password" name="login-id" id="pass" placeholder="******" class="field" required="">

                                        <div class="clear"></div>

                                        <div class="row">
                                            <button id="mobileLogin" name="sign-in-button" class="flat-button signin">Log In</button>
                                        </div>

                                        <%--                                    <div class="row center-75" style="margin-top: 95px;">
                                        <a href="/Default.aspx" class="brand login flat-button facebook">Back To Login</a>
                                    </div>--%>
                                    </div>

                                </div>

                                <div class="form-content" id="codeInput">

                                    <div class="row center-90">

                                        <input type="text" name="login-id" id="confirmCode" placeholder="******" class="field" required="">

                                        <div class="clear"></div>

                                        <div class="row">
                                            <button id="codebtn" name="sign-in-button" class="flat-button signin">Enter</button>
                                            <button id="resend" name="sign-in-button" class="flat-button signin" style="display: none">Resend</button>

                                        </div>
                                        <div class="row">
                                            <div id="countdown" style="color: black"></div>
                                        </div>
                                    </div>

                                </div>

                                <div class="form-content" id="verifyModal">

                                    <div class="row">


                                        <div id="verify-box" class="box no-border">
                                            <div class="login-box-body">
                                                <div class="widget-main">
                                                    <h4 class="header red lighter bigger">
                                                        <i class="ace-icon fa fa-key"></i>
                                                        Verify Account
                                                    </h4>

                                                    <div class="space-6"></div>
                                                    <p>
                                                        Enter your Phone/Email 
                                                    </p>
                                                    <ul class="nav nav-tabs">
                                                        <li class="active">
                                                            <a href="#1" data-toggle="tab">Phone</a>
                                                        </li>
                                                        <li><a href="#2" data-toggle="tab">Email</a>
                                                        </li>
                                                    </ul>

                                                    <div class="tab-content ">
                                                        <div class="tab-pane active" id="1">
                                                            <fieldset style="margin-top: 10px;">
                                                                <div class="form-group has-feedback">


                                                                    <div class="input-group" style="padding: 20px;">

                                                                        <%--                                                    <span class="input-group-addon">
                                                        <select id="filterCountry"></select>
                                                    </span>--%>

                                                                        <%-- <asp:TextBox ID="mobilePhone" CssClass="form-control" placeholder="1717xxxxxx" TextMode="Phone" runat="server"></asp:TextBox>--%>
                                                                        <input id="mobilePhone" name="phone" type="tel">
                                                                        <%--                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-phone form-control-feedback"></span>
                                                    </span>--%>
                                                                    </div>

                                                                </div>

                                                                <div id="recaptcha-container">
                                                                </div>
                                                                <div class="clearfix  center-25" style="margin-top: -15px;">
                                                                    <button id="phoneEnter" class="btn btn-facebook btn-flat pull-right">Send Code</button>
                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                        <div class="tab-pane" id="2">
                                                            <div class="form-group has-feedback">

                                                                <fieldset style="margin-top: 0px;">
                                                                    <div class="input-group" style="margin-left: 15px;">

                                                                        <input id="emailEnter" name="phone" type="text" type="email" placeholder="EMAIl" class="field" required="">
                                                                        <%--   <input id="emailEnter" name="phone" type="text" class="form-control">--%>
                                                                    </div>
                                                                    <div class="clearfix" style="margin-top: 0px;">
                                                                        <button id="btnEmail" class="flat-button signin">Send Mail</button>
                                                                    </div>
                                                                </fieldset>
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane" id="3">
                                                            <h3>add clearfix to tab-content (see the css)</h3>
                                                        </div>
                                                    </div>
                                                </div>



                                            </div>
                                            <!-- /.widget-main -->

                                            <div class="toolbar align-center" style="padding-bottom: 10px;">
                                                <a href="/Default.aspx" class="back-to-login-link" style="color: #21506a">Back to login
												<i class="ace-icon fa fa-arrow-right"></i>
                                                </a>
                                            </div>
                                        </div>


                                    </div>

                                </div>

                                <%--  <div class="form-content current" id="member">
                                    <form id="sign-in">
                                        <input type="email" name="login-id" id="user" placeholder="USERNAME / EMAIL" class="field" required="">
                                        <input type="password" name="usrpw" placeholder="PASSWORD" class="field" required="">
                                        <div class="clear"></div>
                                        <input type="checkbox" name="rmbrme" id="custom-check" class="check"><label for="custom-check" class="check-label secondary-text">Remember me</label><a href=""><span class="forgot secondary-text">Forgot password?</span></a>
                                        <button id="submit" name="sign-in-button" class="flat-button signin">Log In</button>
                                    </form>
                                </div>--%>
                                <!--Registration form-->
                                <%--  <div class="form-content" id="new">
                                    <form id="reg">
                                        <input type="text" name="login-id" id="user" placeholder="USERNAME" class="field" required="">
                                        <input type="email" name="email" id="usremail" placeholder="EMAIL ADDRESS" class="field" required="">
                                        <input type="password" name="usrpw" placeholder="PASSWORD" class="field" required="">
                                        <button id="submit" name="register-button" class="flat-button signin">Sign Up</button>
                                        <div class="clear"></div>
                                        <input type="checkbox" name="promo" id="promo-check" class="check" checked=""><label for="promo-check" class="check-label secondary-text promo">I'd like to receive special offers and discount coupons. No spam!</label>
                                    </form>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <!--------------------------------------------------------------------------------------------------------------------------------------------------------->

                <div class="login-box invisible">
                    <%--<div class="login-logo">
                        <a href="/Default.aspx"><b><%= Lumex.Project.BLL.SystemBLL.CompanyShortName %></b> Login</a>
                    </div>--%>
                    <!-- /.login-logo -->
                    <div id="login_box" class="login-box-body visible">
                        <p class="login-box-msg">Sign in Please</p>


                        <div class="form-group has-feedback">
                            <asp:TextBox ID="txtbxloginId" CssClass="form-control" placeholder="Email" TextMode="Email" runat="server"></asp:TextBox>

                            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <asp:TextBox ID="txtbxPass" CssClass="form-control" placeholder="********" TextMode="Password" runat="server"></asp:TextBox>

                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                        </div>
                        <div class="row">
                            <div class="col-xs-8">
                            </div>
                            <!-- /.col -->
                            <%--<div class="col-xs-4">
                                <asp:LinkButton ID="lnkbtnLogin" onKeyProcess="return EnterEvent(event)" class="btn btn-primary btn-block btn-flat" OnClick="lnkbtnLogin_Click" runat="server">Sign In</asp:LinkButton>

                            </div>--%>
                            <!-- /.col -->
                        </div>

                        <div class="col-md-12">
                            <asp:Label ID="lblConformation" CssClass="help-block" runat="server" Text=""></asp:Label>
                        </div>

                        <!-- /.social-auth-links -->
                        <div class="toolbar">
                            <a href="#" data-target="#forgot-box">I forgot my password</a><br>
                            <a href="#" data-target="#verify-box">Verify Yourself</a><br>
                        </div>
                    </div>
                    <!-- /.login-box-body -->


                    <!-- /.login-box -->
                    <div id="forgot-box" style="display: none" class="box no-border">
                        <div class="login-box-body">
                            <div class="widget-main">
                                <h4 class="header red lighter bigger">
                                    <i class="ace-icon fa fa-key"></i>
                                    Retrieve Password
                                </h4>

                                <div class="space-6"></div>
                                <p>
                                    Enter your email and to receive instructions
                                </p>


                                <fieldset>
                                    <div class="form-group has-feedback">
                                        <asp:TextBox ID="txtbxEmailAddToReset" CssClass="form-control" placeholder="Email" TextMode="Email" runat="server"></asp:TextBox>

                                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                                    </div>


                                  <%--  <div class="clearfix">
                                        <asp:LinkButton ID="lnkbtnFromRequest" OnClick="lnkbtnFromRequest_Click" CssClass="btn btn-facebook btn-flat pull-right" runat="server">Send Request</asp:LinkButton>

                                    </div>--%>
                                </fieldset>

                            </div>
                            <!-- /.widget-main -->

                            <div class="toolbar center">
                                <a href="/login.aspx" data-target="#login_box" class="back-to-login-link">Back to login
												<i class="ace-icon fa fa-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                        <!-- /.widget-body -->
                    </div>



                    <div id="verify-box" style="display: none" class="box no-border">
                        <div class="login-box-body">
                            <div class="widget-main">
                                <h4 class="header red lighter bigger">
                                    <i class="ace-icon fa fa-key"></i>
                                    Verify Account
                                </h4>

                                <div class="space-6"></div>
                                <p>
                                    Enter your phone number
                                </p>
                                <ul class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#1" data-toggle="tab">Phone</a>
                                    </li>
                                    <li><a href="#2" data-toggle="tab">Email</a>
                                    </li>
                                </ul>

                                <div class="tab-content ">
                                    <div class="tab-pane active" id="1">
                                        <fieldset style="margin-top: 10px;">
                                            <div class="form-group has-feedback">


                                                <div class="input-group">

                                                    <%--                                                    <span class="input-group-addon">
                                                        <select id="filterCountry"></select>
                                                    </span>--%>

                                                    <%-- <asp:TextBox ID="mobilePhone" CssClass="form-control" placeholder="1717xxxxxx" TextMode="Phone" runat="server"></asp:TextBox>--%>
                                                    <input id="mobilePhone" name="phone" type="tel">
                                                    <%--                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-phone form-control-feedback"></span>
                                                    </span>--%>
                                                </div>

                                            </div>

                                            <div id="recaptcha-container">
                                            </div>
                                            <div class="clearfix">
                                                <button id="phoneEnter" class="btn btn-facebook btn-flat pull-right">Send Code</button>
                                            </div>
                                        </fieldset>
                                    </div>
                                    <div class="tab-pane" id="2">
                                        <div class="form-group has-feedback">

                                            <fieldset style="margin-top: 10px;">
                                                <div class="input-group">


                                                    <input id="emailEnter" name="phone" type="text" class="form-control">
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                                                    </span>
                                                </div>
                                                <div class="clearfix" style="margin-top: 10px;">
                                                    <button id="btnEmail" class="btn btn-facebook btn-flat pull-right">Send Mail</button>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="3">
                                        <h3>add clearfix to tab-content (see the css)</h3>
                                    </div>
                                </div>
                            </div>



                        </div>
                        <!-- /.widget-main -->

                        <div class="toolbar center">
                            <a href="/login.aspx" data-target="#login_box" class="back-to-login-link">Back to login
												<i class="ace-icon fa fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>


                    <div id="code-box" style="display: none" class="box no-border">
                        <div class="login-box-body">
                            <div class="widget-main">
                                <h4 class="header red lighter bigger">
                                    <i class="ace-icon fa fa-key"></i>
                                    Verify Account
                                </h4>

                                <div class="space-6"></div>
                                <p>
                                    Enter the code you received in phone
                                </p>


                                <fieldset>
                                    <div class="form-group has-feedback">
                                        <%--   <asp:TextBox ID="" CssClass="form-control" placeholder="Code" TextMode="Phone" runat="server"></asp:TextBox>--%>

                                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                    </div>


                                    <%--                                    <div class="clearfix">
                                        <a id="enterCode" class="btn btn-facebook btn-flat pull-right">Enter Code</a>
                                        <button id="resend" class="btn btn-facebook btn-flat pull-left" style="display: none">Resend Code</button>
                                        <div id="countdown"></div>
                                    </div>--%>
                                </fieldset>

                            </div>
                            <!-- /.widget-main -->

                            <%--                            <div class="toolbar center">
                                <a href="/login.aspx" data-target="#login_box" class="back-to-login-link">Back to login
												<i class="ace-icon fa fa-arrow-right"></i>
                                </a>
                            </div>--%>
                        </div>
                        <!-- /.widget-body -->
                    </div>


                    <div id="passchange-box" style="display: none" class="box no-border">
                        <div class="login-box-body">
                            <div class="widget-main">
                                <h4 class="header red lighter bigger">
                                    <i class="ace-icon fa fa-key"></i>
                                    Change Password
                                </h4>

                                <div class="space-6"></div>
                                <p>
                                    Enter New Password
                                </p>


                                <fieldset>
                                    <div class="form-group has-feedback">
                                        <asp:TextBox ID="newPass" CssClass="form-control" placeholder="New Password" TextMode="Password" runat="server"></asp:TextBox>

                                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <asp:TextBox ID="confirmPass" CssClass="form-control" placeholder="Confirm Password" TextMode="Password" runat="server"></asp:TextBox>

                                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                    </div>


                                    <div class="clearfix">
                                        <a id="enterPass" class="btn btn-facebook btn-flat pull-right">Change Password</a>

                                    </div>
                                </fieldset>

                            </div>
                            <!-- /.widget-main -->

                            <%--                            <div class="toolbar center">
                                <a href="/login.aspx" data-target="#login_box" class="back-to-login-link">Back to login
												<i class="ace-icon fa fa-arrow-right"></i>
                                </a>
                            </div>--%>
                        </div>
                        <!-- /.widget-body -->
                    </div>

                    <div id="pin-box" style="display: none" class="box no-border">
                        <div class="login-box-body">
                            <div class="widget-main">
                                <h4 class="header red lighter bigger">
                                    <i class="ace-icon fa fa-key"></i>
                                    Change Pin
                                </h4>

                                <div class="space-6"></div>
                                <p>
                                    Enter New Pin
                                </p>


                                <fieldset>
                                    <div class="form-group has-feedback">
                                        <asp:TextBox ID="newPin" CssClass="form-control" placeholder="New Pin" TextMode="Password" runat="server"></asp:TextBox>

                                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                    </div>

                                    <div class="form-group has-feedback">
                                        <asp:TextBox ID="confirmPin" CssClass="form-control" placeholder="Confirm Pin" TextMode="Password" runat="server"></asp:TextBox>

                                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                    </div>


                                    <div class="clearfix">
                                        <a id="enterPin" class="btn btn-facebook btn-flat pull-right">Change Pin</a>

                                    </div>
                                </fieldset>

                            </div>
                            <!-- /.widget-main -->

                            <%--                            <div class="toolbar center">
                                <a href="/login.aspx" data-target="#login_box" class="back-to-login-link">Back to login
												<i class="ace-icon fa fa-arrow-right"></i>
                                </a>
                            </div>--%>
                        </div>
                        <!-- /.widget-body -->
                    </div>
                    <!-- /.widget-body -->
                </div>



                <input type="hidden" id="userId" />
                <!-- /.forgot-box -->
                <%--        </div>--%>
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
