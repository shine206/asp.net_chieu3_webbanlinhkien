<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WebBanLinhKien.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 146px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SlideShowContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PromotionProductContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ADSContent" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="NewsContent" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ProductContent" runat="server">
    <div class="breadcrumb">
        <div class="container">
            <ol class="list-unstyled list-inline">
                <li>
                    <a href="index.html" itemprop="item"><i class="fa fa-home"></i> <span>Trang chủ</span></a>
                </li>
                <li><span class="divide"><i class="fa fa-angle-right"></i></span>
                </li>
                <li>
                    <span class="current" itemprop="item"><b>Giỏ hàng</b></span>
                </li>
            </ol>
        </div>
    </div>
    <!-- End Breadcrumb -->
    <section class="cartPage">
        <div class="container">
            <h1 class="cartPageTitle">Giỏ hàng của bạn</h1>

            <form action="/cart" method="post">
                <div class="table-responsive">
                    <table class="table tableCart">
                        <thead>
                            <tr>
                                <th style="width:100px;text-align:center;">Ảnh</th>
                                <th>Tên sản phẩm</th>
                                <th style="width:150px">Giá lẻ</th>
                                <th style="width:160px">Số lượng</th>
                                <th class="auto-style1">Tổng cộng</th>
                                <th style="width:50px">Xóa</th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr>
                                <td>
                                    <a href="/may-say-quan-ao-electrolux-6-kg-edv6051?variantid=9362597">

                                        <img alt="MÁY S?Y QU?N ÁO ELECTROLUX 6 KG EDV6051" src="Content/images/sanpham-8.jpg" class="img-fix">

                                    </a>
                                </td>
                                <td>
                                    <a href="/may-say-quan-ao-electrolux-6-kg-edv6051?variantid=9362597" id="product_name">MÁY SẤY QUẦN ÁO ELECTROLUX 6 KG EDV6051</a>

                                </td>
                                <td>7.900.000?</td>
                                <td>
                                    <div class="cartQtyGroup">
                                        <%--<a href="#" class="button">Cập nhật giỏ hàng</a>--%>
                                        <asp:Button Text="-" ID="btnSub" CssClass="cartQtyButton" runat="server" />
                                        <%--<a href="/checkout" class="button">Tiến hành thanh toán</a>--%>
                                        <asp:TextBox ID="Qty4326078" CssClass="input-control" runat="server" >1</asp:TextBox>
                                        <%--<button class="button cartQtyButton">+</button>--%>
                                        
                                        <asp:Button Text="+" ID="btnAdd" CssClass="cartQtyButton" runat="server" />
                                    </div>
                                </td>
                                <td class="auto-style1"><b>7.900.000?</b>
                                </td>
                                <td>
                                    <%--<a href="/cart/change?line=1&amp;quantity=0" data-toggle="tooltip" data-placement="top" title="" data-original-title="Xóa"><i class="fa fa-trash"></i>--%>
                                    <%--<asp:CheckBox ID="chkDel" Text="X" ForeColor="Red" runat="server" OnCheckedChanged="chkDel_CheckedChanged" />--%>
                                   
                                   <%--</a>--%>
                                     <asp:Button Text="X" ForeColor="Red" ID="btnDel" runat="server" />
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="clearfix">
                    <div class="pageCartButton left">
                        <%--<a href="Home.aspx" class="button">Tiếp tục mua hàng</a>--%>
                        <asp:Button ID="btnContinue" Text="Tiếp tục mua hàng" CssClass="button" runat="server" OnClick="btnContinue_Click"  />
                        <%--<a href="#" class="button">Cập nhật giỏ hàng</a>--%>
                        <asp:Button ID="btnUpdate" Text="Cập nhật giỏ hàng" CssClass="button" runat="server" OnClick="btnUpdate_Click"  />
                    </div>
                    <div class="pageCartSumary right">
                        <h3 style="
    margin: 20px 0px;
">Tổng cộng</h3>
                        <table class="pageCartSumaryTable">
                            <tbody>
                                <tr>
                                    <td><b>Tạm tính</b>
                                    </td>
                                    <td>7.900.000?</td>
                                </tr>
                                <tr>
                                    <td><b>Phí vận chuyển</b>
                                    </td>
                                    <td>Tính khi thanh toán</td>
                                </tr>

                                <tr>
                                    <td><b>Thuế</b>
                                    </td>
                                    <td>Tính khi thanh toán</td>
                                </tr>
                                <tr>
                                    <td><b>Tổng cộng</b>
                                    </td>
                                    <td>7.900.000?</td>
                                </tr>
                            </tbody>
                        </table>
                        <%--<a href="/checkout" class="button">Tiến hành thanh toán</a>--%>
                        <asp:Button Text="Tiến hành thanh toán" CssClass="button" runat="server" />
                    </div>
                </div>
            </form>

        </div>
    </section>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="BrandContent" runat="server">
</asp:Content>
