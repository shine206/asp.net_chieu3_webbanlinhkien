<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Register.aspx.cs" Inherits="WebBanLinhKien.Register" %>

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
<asp:Content ID="registerContent" ContentPlaceHolderID="ProductContent" runat="server">
    <div class="breadcrumb">
        <div class="container">
            <ol class="list-unstyled list-inline">
                <li>
                    <a href="index.html" itemprop="item"><i class="fa fa-home"></i><span>Trang chủ</span></a>
                </li>
                <li><span class="divide"><i class="fa fa-angle-right"></i></span></li>
                <li>
                    <span class="current" itemprop="item"><b>Đăng ký tài khoản</b></span>
                </li>
            </ol>
        </div>
    </div>
    <!-- End Breadcrumb -->
    <section class="AccountPage">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-md-offset-3 ">
                    <div class="formAccountPage" id="loginForm">
                        <h2 class="titleDecoration AccountPageTitle"><span class="line"></span><span class="title fz18"><i class="fa fa-lock"></i>&nbsp; Đăng ký tài khoản</span></h2>
                        <asp:Label Text="" ID="lblMessage" runat="server" />
                        <form accept-charset="UTF-8" action="#" id="customer_login" method="post">
                            <input name="FormType" type="hidden" value="customer_login">
                            <input name="utf8" type="hidden" value="true">
                            <p>Đăng ký để nhận những ưu đãi đặc biệt từ cửa hàng chúng tôi.</p>
                            <div class="group">
                                <asp:Label ID="lblUsername" Text="Tên đăng nhập" runat="server" /><span class="error">*</span>
                                <asp:RequiredFieldValidator ID="errorUser" CssClass="error" ErrorMessage="(Bạn phải nhập tên đăng nhập)" ControlToValidate="txtUserName" runat="server" />
                                <asp:TextBox ID="txtUserName" CssClass="input-control" runat="server" />
                            </div>

                            <div class="group">
                                <asp:Label ID="lblPassword" Text="Mật khẩu" runat="server" /><span class="error">*</span>
                                <asp:RequiredFieldValidator CssClass="error" ErrorMessage="(Bạn phải nhập mật khẩu!)" ControlToValidate="passLogin" SetFocusOnError="True" Display="Dynamic" runat="server" />
                                <asp:TextBox ID="passLogin" TextMode="Password" CssClass="input-control" runat="server" />
                            </div>

                            <div class="group">
                                <asp:Label ID="lblRePassword" Text="Nhập lại mật khẩu" runat="server" /><span class="error">*</span>
                                <asp:RequiredFieldValidator CssClass="error" ErrorMessage="(Bạn phải nhập lại mật khẩu!)" ControlToValidate="rePassLogin" SetFocusOnError="True" Display="Dynamic" runat="server" />
                                <asp:CompareValidator ErrorMessage="(Nhập lại mật khẩu chưa chính xác!!!)" ForeColor="red" ControlToCompare="passLogin" ControlToValidate="rePassLogin" runat="server" />
                                <asp:TextBox ID="rePassLogin" TextMode="Password" CssClass="input-control" runat="server" />
                            </div>

                            <div class="group">
                                <asp:Label Text="Họ tên" ID="lblFullname" runat="server" /><span class="error">*</span>
                                <asp:RequiredFieldValidator ErrorMessage="(Bạn phải nhập đầy đủ họ tên!" CssClass="error" ControlToValidate="txtFullName" runat="server" />
                                <asp:TextBox runat="server" ID="txtFullName" CssClass="input-control" />
                            </div>

                            <div class="group">
                                <asp:Label Text="Email" ID="lblEmail" runat="server" /><span class="error">*</span>
                                <asp:RequiredFieldValidator ErrorMessage="(Bạn cần phải nhập email!)" CssClass="error" ControlToValidate="emailLogin" runat="server" />
                                <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ControlToValidate="emailLogin" ForeColor="Red" ErrorMessage="Invalid email address." />
                                <asp:TextBox runat="server" ID="emailLogin" TextMode="Email" CssClass="input-control" />
                            </div>

                            <div class="group">
                                <asp:Label Text="Địa chỉ" ID="lblAddress" runat="server" /><span class="error">*</span>
                                <asp:RequiredFieldValidator ErrorMessage="(Bạn phải nhập địa chỉ của bạn!)" CssClass="error" ControlToValidate="txtAddressUser" runat="server" />
                                <asp:TextBox runat="server" ID="txtAddressUser" CssClass="input-control" />
                            </div>
                            <div class="group">
                                <asp:Label Text="Số điện  thoại" ID="lblPhone" runat="server" /><span class="error">*</span>
                                <asp:RequiredFieldValidator ErrorMessage="(Bạn phải nhập số điện thoại của bạn!)" CssClass="error" ControlToValidate="txtPhone" runat="server" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                                    runat="server" ErrorMessage="Nhập đúng số điện thoại hợp lệ!!!" ForeColor="Red"
                                    ControlToValidate="txtPhone"
                                    ValidationExpression="^([\+]?(?:00)?[0-9]{1,3}[\s.-]?[0-9]{1,12})([\s.-]?[0-9]{1,4}?)$"></asp:RegularExpressionValidator>
                                <asp:TextBox runat="server" ID="txtPhone" CssClass="input-control" />
                            </div>

                            <%--<button class="button"><i class="hoverButton"></i>Đăng ký</button>--%>
                            <asp:Button Text="Đăng ký" ID="btnRegister" CssClass="button" runat="server" OnClick="btnRegister_Click" />

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
