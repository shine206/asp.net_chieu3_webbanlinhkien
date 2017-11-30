<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebBanLinhKien.Register" %>
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
                    <a href="index.html" itemprop="item"><i class="fa fa-home"></i> <span>Trang chủ</span></a>
                </li>
                <li><span class="divide"><i class="fa fa-angle-right"></i></span></li>
                <li>
                    <span class="current" itemprop="item"><b>Đăng ký tài khoản</b></span>
                </li>
            </ol>
        </div>
    </div><!-- End Breadcrumb -->
    <section class="AccountPage">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-md-offset-3 ">
                    <div class="formAccountPage" id="loginForm">
                        <h2 class="titleDecoration AccountPageTitle"><span class="line"></span><span class="title fz18"><i class="fa fa-lock"></i>&nbsp; Đăng ký tài khoản</span></h2>
                        <form accept-charset="UTF-8" action="#" id="customer_login" method="post">
                            <input name="FormType" type="hidden" value="customer_login">
                            <input name="utf8" type="hidden" value="true">
                            <p>Đăng ký để nhận những ưu đại đặc biệt từ cửa hàng chúng tôi.</p>
							<div class="group">
                                <label for="username">Tên đăng nhập <span class="error">*</span></label>
                                <%--<input type="text" name="username" id="username" required="" class="input-control">--%>
                                <asp:TextBox ID="txtUserName" CssClass="input-control" runat="server" />
                            </div>
							<div class="group">
                                <label for="passLogin">Mật khẩu <span class="error">*</span></label>
                                <%--<input type="password" id="passLogin" name="password" required="" class="input-control">--%>
                                <asp:TextBox ID="passLogin" TextMode="Password" CssClass="input-control" runat="server" />
                            </div>
							<div class="group">
                                <label for="rePassLogin">Nhập lại mật khẩu <span class="error">*</span></label>
                                <%--<input type="password" id="rePassLogin" name="password" required="" class="input-control">--%>
                                <asp:TextBox ID="rePassLogin" TextMode="Password" CssClass="input-control" runat="server" />
                            </div>
                            <div class="group">
                                <label for="fullName">Họ Tên <span class="error">*</span></label>
                                <%--<input type="text" name="fullname" id="fullname" required="" class="input-control">--%>
                                <asp:TextBox runat="server" ID="txtFullName"  CssClass="input-control"/>
                            </div>
                            <div class="group">
                                <label for="emailLogin">Email <span class="error">*</span></label>
                                <%--<input type="email" name="Email" id="emailLogin" required="" class="input-control">--%>
                                <asp:TextBox runat="server" ID="emailLogin"  CssClass="input-control"/>
                            </div>
                            <div class="group">
                                <label for="addressUser">Address <span class="error">*</span></label>
                                <asp:TextBox runat="server" ID="addressUser" CssClass="input-control" />
                            </div>
							 <div class="group">
                                <label for="phone">Số điện thoại <span class="error">*</span></label>
                                <%--<input type="number" name="phone" id="phone" required="" class="input-control">--%>
                                 <asp:TextBox runat="server" ID="phone"  CssClass="input-control"/>
                            </div>
                            
                            <%--<button class="button"><i class="hoverButton"></i>Đăng ký</button>--%>
                            <asp:Button Text="Đăng ký" ID="btnRegister" CssClass="button" runat="server" />
                        </form>
                    </div>
                    
                </div>
            </div>
        </div>
    </section><!-- End AccountPage -->
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="BrandContent" runat="server">
</asp:Content>
