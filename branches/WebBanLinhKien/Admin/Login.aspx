<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebBanLinhKien.Admin.Login" %>

<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap Admin Theme v3</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="Content/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="Content/css/styles.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-bg">
    <form runat="server">
        <div class="header">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Logo -->
                        <div class="logo">
                            <h1><a href="Dashboard.aspx">Sky Market</a></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="page-content container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-wrapper">
                        <div class="box">
                            <div class="content-wrap">
                                <h6>Sign In</h6>
                                <asp:Panel runat="server" ID="pnError" Visible="False">
                                    <div class="alert alert-danger">
                                      <strong>Lỗi! </strong> <asp:Label Text="" ID="lblErrorMessage" runat="server" />
                                    </div>
                                </asp:Panel>
                                <%--<input class="form-control" type="text" placeholder="E-mail address">
                                <input class="form-control" type="password" placeholder="Password">--%>
                                <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control"  placeholder="Username"/>
                                <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control"  placeholder="Password" TextMode="Password"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="Bạn chưa nhập Username !!!"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RequiredFieldValidator ErrorMessage="Bạn chưa nhập password !!!" ControlToValidate="txtPassword" runat="server" />
                                <div class="action">
                                    <asp:Button Text="Login" CssClass="btn btn-primary signup" runat="server" ID="btnLogin" OnClick="btnLogin_Click" />
                                </div>
                            </div>
                        </div>

                        <div class="already">
                            <p>Don't have an account yet?</p>
                            <a href="signup.html">Sign Up</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="Content/bootstrap/js/bootstrap.min.js"></script>
    <script src="Content/js/custom.js"></script>
</body>
</html>
