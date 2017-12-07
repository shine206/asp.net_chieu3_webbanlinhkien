<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Forgot.aspx.cs" Inherits="WebBanLinhKien.Forgot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SlideShowContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PromotionProductContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ADSContent" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="NewsContent" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="ProductContent" ID="forgotPassContent" runat="server">
    <div class="breadcrumb">
        <div class="container">
            <ol class="list-unstyled list-inline">
                <li>
                    <a href="Home.aspx" itemprop="item"><i class="fa fa-home"></i><span>Trang chủ</span></a>
                </li>
                <li><span class="divide"><i class="fa fa-angle-right"></i></span></li>
                <li>
                    <a href="Login.aspx"><span class="current" itemprop="item"><b>Đăng nhập</b></span></a>
                </li>
                <li><span class="divide"><i class="fa fa-angle-right"></i></span></li>
                <li>
                    <span class="current" itemprop="item"><b>Quên mật khẩu</b></span>
                </li>
            </ol>
        </div>
    </div>

    <section class="AccountPage">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-md-offset-3 ">
                    <div class="formAccountPage" id="forgotForm">
                        <h2 class="titleDecoration AccountPageTitle"><span class="line"></span><span class="title fz18">&nbsp; Enter your email.</span></h2>
                        <form accept-charset="UTF-8" action="#" id="customer_forgotpass" method="post">
                            <input name="FormType" type="hidden" value="customer_forgotpass">
                            <input name="utf8" type="hidden" value="true">
                            
                            <div class="group">
                                <asp:Label ID="lblEmail" Text="Email" runat="server" /><span class="error">*</span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="error" runat="server" ErrorMessage="(Email bắt buộc phải nhập!!!)" ControlToValidate="txtEmailVerify"></asp:RequiredFieldValidator>
                                <asp:TextBox runat="server" TextMode="Email" ID="txtEmailVerify" CssClass="input-control"/>        
                            </div>
                            
                            <asp:Button Text="Email Link" CssClass="button" ID="btnSend" runat="server" OnClick="btnSend_Click" />
                            
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
<asp:Content ID="Content7" ContentPlaceHolderID="BrandContent" runat="server">
</asp:Content>
