<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebBanLinhKien.Login" MasterPageFile="~/Site.Master" EnableEventValidation="false" %>

<asp:Content runat="server" ContentPlaceHolderID="ProductContent">
    <section class="AccountPage">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-md-offset-3 ">
                    <div class="formAccountPage" id="loginForm">
                        <h2 class="titleDecoration AccountPageTitle"><span class="line"></span><span class="title fz18"><i class="fa fa-lock"></i>&nbsp; Đăng nhập</span></h2>

                                
                                <asp:Label ID="lblMessage" Text="" runat="server"></asp:Label>

                        <form accept-charset="UTF-8" action="#" id="customer_login" method="post">
                            <input name="FormType" type="hidden" value="customer_login">
                            <input name="utf8" type="hidden" value="true">
                            <div class="group">
                                <%--<label for="username">Username <span class="error">*</span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="error" ErrorMessage="(Tài khoản không được trống !!!)" ControlToValidate="username"></asp:RequiredFieldValidator>
                                </label>--%>
                                <asp:Label ID="lblUserName" Text="Username" runat="server" /><span class="error">*</span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="error" ErrorMessage="(Tài khoản không được trống !!!)" ControlToValidate="username"></asp:RequiredFieldValidator>

                                <%--<input type="text" name="username" id="username" required="" class="input-control">--%>
                                <asp:TextBox runat="server" ID="username" CssClass="input-control" />
                            </div>
                            <div class="group">
                                <%--<label for="passLogin">Mật khẩu <span class="error">*</span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="error" runat="server" ErrorMessage="(Mật khẩu không được trống !!!)" ControlToValidate="passLogin"></asp:RequiredFieldValidator>
                                </label>--%>
                                <asp:Label ID="lblPass" Text="Password" runat="server" /><span class="error">*</span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="error" runat="server" ErrorMessage="(Mật khẩu không được trống !!!)" ControlToValidate="passLogin"></asp:RequiredFieldValidator>

                                <asp:TextBox runat="server" TextMode="Password" ID="passLogin" CssClass="input-control" />

                                <%--<input type="password" id="passLogin" name="password" required="" class="input-control">--%>
                            </div>
                            <div class="group clearfix mt-10">
                                <a href="#recover" class="left">Quên mật khẩu?</a>
                                <a href="Register.aspx" class="right">Đăng ký tài khoản</a>
                            </div>
                            <asp:Button Text="Đăng nhập" CssClass="button" ID="btnDangNhap" OnClick="btnDangNhap_Click" runat="server" />
                            
                            
                        </form>
                    </div>
                    <div class="formAccountPage" id="recoverForm" style="display: none">
                        <h2 class="titleDecoration AccountPageTitle"><span class="line"></span><span class="title fz18"><i class="fa fa-lock"></i>&nbsp; Lấy lại mật khẩu</span></h2>
                        <form accept-charset="UTF-8" action="#" id="recover_customer_password" method="post">
                            <input name="FormType" type="hidden" value="recover_customer_password">
                            <input name="utf8" type="hidden" value="true">
                            <p>Điền địa chỉ email bạn đã đăng ký vào ô bên dưới để chúng tôi xác nhận và gửi yêu cầu đổi mật khẩu cho bạn.</p>
                            <div class="group">
                                <label for="emailRecover">Email <span class="error">*</span></label>
                                <input type="email" name="mail" id="emailRecover" required="" class="input-control">
                            </div>
                            <div class="group clearfix" style="margin-top: 15px">
                                <a href="#" class="right">Quay lại</a>
                            </div>
                            <input type="submit" class="button" value="Gửi">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End AccountPage -->

</asp:Content>
