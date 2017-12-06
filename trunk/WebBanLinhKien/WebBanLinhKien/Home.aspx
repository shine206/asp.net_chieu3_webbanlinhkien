<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" MasterPageFile="~/Site.Master" Inherits="WebBanLinhKien.Home" %>

<asp:Content runat="server" ContentPlaceHolderID="SlideShowContent" ID="slideShowContent">
    <div class="row">
        <div class="hidden-xs hidden-sm hidden-md col-lg-3">
            <ul class="list-unstyled listCate hasIcon ">
                <asp:PlaceHolder runat="server" ID="liContent" />
            </ul>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-9">
            <div class="slideshow owl-carousel owl-theme">
                <div class="item-slide">
                    <a href="#">
                        <img class="img-responsive" src="Content/images/slideshow1.jpg"></a>
                </div>
                <div class="item-slide">
                    <a href="#">
                        <img class="img-responsive" src="Content/images/slideshow2.jpg"></a>
                </div>
            </div>
        </div>
    </div>
    <!-- End Row -->
</asp:Content>


<asp:Content runat="server" ContentPlaceHolderID="PromotionProductContent" ID="PromotionProductContent">
    <div class="clearfix">
        <div class="coDownCollection">
            <h2 class="titleDecoration">
                <span class="line"></span>
                <span class="title fz18">Sản phẩm khuyến mại</span>
            </h2>
            <div class="slideProducts owl-carousel owl-theme">
                <asp:Repeater runat="server" ID="rptPromotionContent">
                    <ItemTemplate>
                        <!-- Item -->
                        <div class="item-slideProducts">
                            <div class="productGrid">
                                <!-- <div class="productSale"><span>-23%</span></div> -->
                                <div class="countDown" data-end="kmdn_ngay1_thang12_nam2017">Còn hàng</div>
                                <div class="productImg">
                                    <a href="detail.html" title="<%#Eval("name") %>">
                                        <img src="<%#Eval("link_image") %>" data-original="<%#Eval("link_image") %>" class="img-responsive" alt="<%#Eval("name") %>" style="display: inline;">
                                    </a>
                                    <div class="hoverButtons">
                                        <span data-toggle="modal" data-target="#998"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Cho vào giỏ hàng"><i class="fa fa-shopping-cart"></i></a></span>

                                        <span data-toggle="modal" data-target="#999"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Xem nhanh"><i class="fa fa-search"></i></a></span>

                                        <a href="#" class="button skype" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tư vấn qua Skype"><i class="fa fa-skype"></i></a>
                                    </div>
                                </div>
                                <h3><a href="detail.html" title="<%#Eval("name") %>"><%#Eval("name") %></a></h3>
                                <div class="productPrice">
                                    <del><%# Eval("sel_price", "{0:0,0} đ") %></del>
                                    <span><%# Eval("price", "{0:0,0} đ") %></span>
                                </div>
                                <div class="actions clearfix">
                                    <a href="#" class="button"><i class="hoverButton"></i>Chọn sản phẩm</a>
                                </div>
                            </div>
                        </div>
                        <!-- End Item -->
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <!-- End Slide Product -->

</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ADSContent" ID="ADSContent">
    <div class="hidden-xs clearfix">
        <div class="threBanner">
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                <img src="Content/images/banner1.jpg" data-original="images/banner1.jpg" alt="" class="img-responsive">
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                <img src="Content/images/banner2.jpg" data-original="images/banner2.jpg" alt="" class="img-responsive">
            </div>
        </div>
    </div>
    <!-- Banner -->

</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ProductContent" ID="ProductContent">
    <div class="bigCollection s1" id="bigCollection_1">
        <div class="controlTabsWrapper">
            <div class="controlTabs">
                <h2 class="title hidden-xs hidden-sm">Danh Mục</h2>
                <a href="#navBigCollectionMobile1" class="title hidden-md hidden-lg bigCollectionBtnNav dropDownButton" data-toggle="collapse">Điện lạnh <i class="fa fa-bars"></i></a>

                <ul class="nav nav-tabs tabAJAXProducts hidden-xs hidden-sm" role="tablist">
                    <asp:PlaceHolder runat="server" ID="tabAJAXProductsContent" />
                </ul>
            </div>
        </div>
        <!-- End ControlTabsWrapper -->
        <div class="tabContentWrapper">
            <div class="tabContent">
                <asp:PlaceHolder runat="server" ID="tabContent"/>
            </div>
        </div>
        <!--  tabContentWrapper -->
    </div>
    <!-- End s1 -->
    <%--<asp:GridView runat="server" ID="gvTest"></asp:GridView>--%>
    <div id="999" class="modal fade" role="dialog">
        <div class="quickViewWrapper">
            <a href="#" class="close close-window" data-dismiss="modal" title="Close" href="">×</a>
            <div class="quickViewCountDown" style="">236D : 22H : 2M : 5S</div>
            <div class="clearfix">
                <div class="quickViewImg">
                    <div class="quickViewFeaturedImg">
                        <div class="slideshow-product owl-carousel owl-theme">
                            <div class="item" data-hash="sp1">
                                <img src="Content/images/sp1.jpg" class="img-responsive" alt="Ảnh sản phẩm">
                            </div>
                            <div class="item" data-hash="sp2">
                                <img src="Content/images/sp2.jpg" class="img-responsive" alt="Ảnh sản phẩm">
                            </div>
                            <div class="item" data-hash="sp3">
                                <img src="Content/images/sp3.jpg" class="img-responsive" alt="Ảnh sản phẩm">
                            </div>
                            <div class="item" data-hash="sp4">
                                <img src="Content/images/sp4.jpg" class="img-responsive" alt="Ảnh sản phẩm">
                            </div>
                            <div class="item" data-hash="sp5">
                                <img src="Content/images/sp5.jpg" class="img-responsive" alt="Ảnh sản phẩm">
                            </div>
                        </div>
                    </div>
                    <div class="quickViewThumbImg owl-carousel owl-theme">
                        <div class="sub-item">
                            <a href="#sp1">
                                <img src="Content/images/sub-1.jpg"></a>
                        </div>
                        <div class="sub-item">
                            <a href="#sp2">
                                <img src="Content/images/sub-2.jpg"></a>
                        </div>
                        <div class="sub-item">
                            <a href="#sp3">
                                <img src="Content/images/sub-3.jpg"></a>
                        </div>
                        <div class="sub-item">
                            <a href="#sp4">
                                <img src="Content/images/sub-4.jpg"></a>
                        </div>
                        <div class="sub-item">
                            <a href="#sp5">
                                <img src="Content/images/sub-5.jpg"></a>
                        </div>
                    </div>
                </div>
                <div class="quickViewProduct">
                    <div class="quickViewProductTitle"><a href="#">Bếp hồng ngoại Midea MIR-T2015DC</a></div>
                    <div class="quickViewProductMeta clearfix">
                        <div class="quickViewProductVendor">NSX: <b>Midea</b></div>
                        <div class="quickViewProductBrand">Loại: <b>Bếp điện</b></div>
                        <div class="quickViewProductsku" style="display: none;"></div>
                        <div class="quickViewProductBarcode">Mã SP: <b>T2015DC</b></div>
                    </div>
                    <div class="quickViewProductPrice hasMarginTop">
                        <span>900.000 VND</span>
                        <del style="">1.300.000 VND</del>
                    </div>
                    <div class="quickViewProductActions clearfix">
                        <form action="#" method="post" class="quickViewProductVariants" id="product-actions-5868449">
                            <div class="quickViewProductQuantity clearfix">
                                <label>Số lượng:</label>
                                <div class="quickViewProductQuantityGroup">
                                    <button class="button quickViewProductQuantityButton" onclick="var result = document.getElementById('quickviewQty'); var quickviewQty = result.value; if( !isNaN( quickviewQty ) &amp;&amp; quickviewQty > 1 ) result.value--;return false;">-</button>
                                    <input type="text" title="Số lượng" value="1" min="1" class="quickviewQty" id="quickviewQty" name="quantity">
                                    <button class="button quickViewProductQuantityButton" onclick="var result = document.getElementById('quickviewQty'); var quickviewQty = result.value; if( !isNaN( quickviewQty )) result.value++;return false;">+</button>
                                </div>
                            </div>
                            <div class="quickViewProductButtons">
                                <button class="button quickViewAddCart">
                                    <i class="fa fa-shopping-cart"></i>Cho vào giỏ hàng
                                </button>
                                <a href="javascript:void(0);" class="button quickViewContact" style="display: none;" data-code="T2015DC">
                                    <i class="fa fa-envelope-o" aria-hidden="true"></i>
                                    Đặt hàng
                                </a>
                                <a href="#" title="Tư vấn qua Skype" class="button skype"><i class="fa fa-skype"></i></a>
                            </div>
                            <input type="hidden" name="variantId" value="9363066">
                        </form>
                    </div>
                    <a href="tel:0868155456" class="boxHotline"><i class="fa fa-volume-control-phone"></i>0868.155.456</a>
                </div>
            </div>
        </div>
    </div>
    <div id="998" class="modal fade" role="dialog">
        <div class="noticeAddWrapper">
            <a href="#" class="close" data-dismiss="modal">×</a>
            <span class="noteAddWrapper">✔ Thêm vào giỏ hàng thành công!</span>
            <div class="clearfix">
                <div class="noticeAddImg">
                    <a href="">
                        <img src="Content/images/big-165330-bep-hong-ngoai-midea-mir-t2015dc.jpg" class="img-responsive" alt="Ảnh sản phẩm"></a>
                </div>
                <div class="noticeAddInfo">
                    <div class="noticeAddInfoTitle">Bếp hồng ngoại Midea MIR-T2015DC</div>
                    <div class="noticeAddInfoQty"><i>Số lượng: 1</i></div>
                    <div class="noticeAddInfoPrice">900.000 VND</div>
                </div>
            </div>
            <div class="clearfix noticeAddBottom">
                <a href="#" data-dismiss="modal" class="left button"><i class="hoverButton"></i>Tiếp tục mua hàng</a>
                <a href="#" class="right button"><i class="hoverButton"></i>Thanh toán</a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="BrandContent" ID="BrandContent">
    <div class="brand">
        <h2 class="titleDecoration"><span class="line"></span><span class="title fz18">Nhãn hiệu liên kết</span></h2>
        <div class="sliderBrand owl-carousel owl-theme">
            <div class="item">
                <img src="Content/images/brand01.png" class="img-responsive">
            </div>
            <div class="item">
                <img src="Content/images/brand02.png" class="img-responsive">
            </div>
            <div class="item">
                <img src="Content/images/brand03.png" class="img-responsive">
            </div>
            <div class="item">
                <img src="Content/images/brand04.png" class="img-responsive">
            </div>
            <div class="item">
                <img src="Content/images/brand05.png" class="img-responsive">
            </div>
            <div class="item">
                <img src="Content/images/brand06.png" class="img-responsive">
            </div>
            <div class="item">
                <img src="Content/images/brand07.png" class="img-responsive">
            </div>
        </div>
    </div>
    <!-- End Brand -->

</asp:Content>
