<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" MasterPageFile="~/Site.Master" Inherits="WebBanLinhKien.Home" %>

<asp:Content runat="server" ContentPlaceHolderID="SlideShowContent" ID="slideShowContent">

    <div class="row">
        <div class="hidden-xs hidden-sm hidden-md col-lg-3">
            <ul class="list-unstyled listCate hasIcon ">
                <li class="hasSubListCate">
                    <i class="fa fa-angle-right"></i>
                    <a href="product.html">Điện lạnh</a>
                    <div class="subListCate">
                        <a href="product.html">Máy giặt</a>
                        <a href="product.html">Máy lạnh</a>
                        <a href="product.html">Tủ lạnh</a>
                        <a href="product.html">Máy sấy quần áo</a>
                        <a href="product.html">Máy nước nóng</a>
                        <a href="product.html">Máy lọc nước</a>
                        <a href="product.html">Máy rửa chén</a>
                    </div>
                </li>
                <li class="hasSubListCate">
                    <i class="fa fa-angle-right"></i>
                    <a href="product.html">Nhà bếp</a>
                    <div class="subListCate">
                        <a href="product.html">Bếp điện</a>
                        <a href="product.html">Nồi áp suất</a>
                        <a href="product.html">Nồi cơm điện</a>
                        <a href="product.html">Lò vi sóng</a>
                        <a href="product.html">Bếp gas</a>
                        <a href="product.html">Máy xay</a>
                        <a href="product.html">Máy khử mùi</a>
                    </div>
                </li>
                <li class="hasSubListCate">
                    <i class="fa fa-angle-right"></i>
                    <a href="product.html">Đồ gia dụng</a>
                    <div class="subListCate">
                        <a href="product.html">Máy hút bụi</a>
                        <a href="product.html">Máy hút ẩm</a>
                        <a href="product.html">Quạt phun sương</a>
                        <a href="product.html">Ổn áp</a>
                        <a href="product.html">Đèn điện</a>
                        <a href="product.html">Bàn là</a>
                        <a href="product.html">Máy may</a>
                    </div>
                </li>
                <li class="hasSubListCate">
                    <i class="fa fa-angle-right"></i>
                    <a href="product.html">Kỹ thuật số</a>
                    <div class="subListCate">
                        <a href="product.html">Máy ảnh ống kính rời</a>
                        <a href="product.html">Máy ảnh du lịch</a>
                        <a href="product.html">Máy quay phim</a>
                        <a href="product.html">Thiết bị giải trí</a>
                        <a href="product.html">Phụ kiện kỹ thuật số</a>
                        <a href="product.html">Máy nghe nhạc</a>
                    </div>
                </li>
                <li class="hasSubListCate">
                    <i class="fa fa-angle-right"></i>
                    <a href="product.html">Phụ kiện</a>
                    <div class="subListCate">
                        <a href="product.html">Phụ kiện điện tử</a>
                        <a href="product.html">Phụ kiện điện thoại</a>
                        <a href="product.html">Phụ kiện văn phòng</a>
                        <a href="product.html">Phụ kiện kỹ thuật số</a>
                        <a href="product.html">Phụ kiện Apple</a>
                    </div>
                </li>
                <li class="hasSubListCate">
                    <i class="fa fa-angle-right"></i>
                    <a href="product.html">Sức khỏe</a>
                    <div class="subListCate">
                        <a href="product.html">Máy sấy tóc</a>
                        <a href="product.html">Máy cạo râu</a>
                        <a href="product.html">Cân sức khỏe</a>
                        <a href="product.html">Máy tập đa năng</a>
                    </div>
                </li>
                <li class="hasSubListCate">
                    <i class="fa fa-angle-right"></i>
                    <a href="product.html">Bách hóa</a>
                    <div class="subListCate">
                        <a href="product.html">Balo &amp; Vali</a>
                        <a href="product.html">Hóa phẩm</a>
                        <a href="product.html">Gối và áo gối</a>
                        <a href="product.html">Bọc nệm</a>
                        <a href="product.html">Nệm</a>
                        <a href="product.html">Thùng rác</a>
                    </div>
                </li>
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
                <!-- Item -->
                <div class="item-slideProducts">
                    <div class="productGrid">
                        <!-- <div class="productSale"><span>-23%</span></div> -->
                        <div class="countDown" data-end="kmdn_ngay1_thang12_nam2017">208D : 12H : 38M : 10S</div>
                        <div class="productImg">
                            <a href="detail.html" title="Máy giặt Panasonic NA-F100A1WRV">
                                <img src="Content/images/slideProduct-1.jpg" data-original="images/slideProduct-1.jpg" class="img-responsive" alt="Máy giặt Panasonic NA-F100A1WRV" style="display: inline;">
                            </a>
                            <div class="hoverButtons">
                                <span data-toggle="modal" data-target="#998"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Cho vào giỏ hàng"><i class="fa fa-shopping-cart"></i></a></span>

                                <span data-toggle="modal" data-target="#999"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Xem nhanh"><i class="fa fa-search"></i></a></span>

                                <a href="#" class="button skype" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tư vấn qua Skype"><i class="fa fa-skype"></i></a>
                            </div>
                        </div>
                        <h3><a href="detail.html" title="Máy giặt Panasonic NA-F100A1WRV">Máy giặt Panasonic NA-F100A1WRV</a></h3>
                        <div class="productPrice">
                            <del>7.990.000₫</del>
                            <span>6.190.000₫</span>
                        </div>
                        <form class="actions clearfix" method="post" action="#">
                            <a href="#" class="button"><i class="hoverButton"></i>Chọn sản phẩm</a>
                        </form>
                    </div>
                </div>
                <!-- End Item -->
                <!-- Item -->
                <div class="item-slideProducts">
                    <div class="productGrid">
                        <!-- <div class="productSale"><span>-23%</span></div> -->
                        <div class="countDown" data-end="kmdn_ngay1_thang12_nam2017">208D : 12H : 38M : 10S</div>
                        <div class="productImg">
                            <a href="detail.html" title="Máy giặt Panasonic NA-F100A1WRV">
                                <img src="Content/images/slideProduct-2.jpg" data-original="images/slideProduct-2.jpg" class="img-responsive" alt="Máy giặt Panasonic NA-F100A1WRV" style="display: inline;">
                            </a>
                            <div class="hoverButtons">
                                <span data-toggle="modal" data-target="#998"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Cho vào giỏ hàng"><i class="fa fa-shopping-cart"></i></a></span>

                                <span data-toggle="modal" data-target="#999"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Xem nhanh"><i class="fa fa-search"></i></a></span>

                                <a href="#" class="button skype" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tư vấn qua Skype"><i class="fa fa-skype"></i></a>
                            </div>
                        </div>
                        <h3><a href="detail.html" title="Máy giặt Panasonic NA-F100A1WRV">Máy giặt Panasonic NA-F100A1WRV</a></h3>
                        <div class="productPrice">
                            <del>7.990.000₫</del>
                            <span>6.190.000₫</span>
                        </div>
                        <form class="actions clearfix" method="post" action="#">
                            <a href="#" class="button"><i class="hoverButton"></i>Chọn sản phẩm</a>
                        </form>
                    </div>
                </div>
                <!-- End Item -->
                <!-- Item -->
                <div class="item-slideProducts">
                    <div class="productGrid">
                        <!-- <div class="productSale"><span>-23%</span></div> -->
                        <div class="countDown" data-end="kmdn_ngay1_thang12_nam2017">208D : 12H : 38M : 10S</div>
                        <div class="productImg">
                            <a href="detail.html" title="Máy giặt Panasonic NA-F100A1WRV">
                                <img src="Content/images/slideProduct-3.jpg" data-original="images/slideProduct-3.jpg" class="img-responsive" alt="Máy giặt Panasonic NA-F100A1WRV" style="display: inline;">
                            </a>
                            <div class="hoverButtons">
                                <span data-toggle="modal" data-target="#998"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Cho vào giỏ hàng"><i class="fa fa-shopping-cart"></i></a></span>

                                <span data-toggle="modal" data-target="#999"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Xem nhanh"><i class="fa fa-search"></i></a></span>

                                <a href="#" class="button skype" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tư vấn qua Skype"><i class="fa fa-skype"></i></a>
                            </div>
                        </div>
                        <h3><a href="detail.html" title="Máy giặt Panasonic NA-F100A1WRV">Máy giặt Panasonic NA-F100A1WRV</a></h3>
                        <div class="productPrice">
                            <del>7.990.000₫</del>
                            <span>6.190.000₫</span>
                        </div>
                        <form class="actions clearfix" method="post" action="#">
                            <a href="#" class="button"><i class="hoverButton"></i>Chọn sản phẩm</a>
                        </form>
                    </div>
                </div>
                <!-- End Item -->
                <!-- Item -->
                <div class="item-slideProducts">
                    <div class="productGrid">
                        <!-- <div class="productSale"><span>-23%</span></div> -->
                        <div class="countDown" data-end="kmdn_ngay1_thang12_nam2017">208D : 12H : 38M : 10S</div>
                        <div class="productImg">
                            <a href="detail.html" title="Máy giặt Panasonic NA-F100A1WRV">
                                <img src="Content/images/slideProduct-4.jpg" data-original="images/slideProduct-4.jpg" class="img-responsive" alt="Máy giặt Panasonic NA-F100A1WRV" style="display: inline;">
                            </a>
                            <div class="hoverButtons">
                                <span data-toggle="modal" data-target="#998"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Cho vào giỏ hàng"><i class="fa fa-shopping-cart"></i></a></span>

                                <span data-toggle="modal" data-target="#999"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Xem nhanh"><i class="fa fa-search"></i></a></span>

                                <a href="#" class="button skype" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tư vấn qua Skype"><i class="fa fa-skype"></i></a>
                            </div>
                        </div>
                        <h3><a href="detail.html" title="Máy giặt Panasonic NA-F100A1WRV">Máy giặt Panasonic NA-F100A1WRV</a></h3>
                        <div class="productPrice">
                            <del>7.990.000₫</del>
                            <span>6.190.000₫</span>
                        </div>
                        <form class="actions clearfix" method="post" action="#">
                            <a href="#" class="button"><i class="hoverButton"></i>Chọn sản phẩm</a>
                        </form>
                    </div>
                </div>
                <!-- End Item -->
                <!-- Item -->
                <div class="item-slideProducts">
                    <div class="productGrid">
                        <!-- <div class="productSale"><span>-23%</span></div> -->
                        <div class="countDown" data-end="kmdn_ngay1_thang12_nam2017">208D : 12H : 38M : 10S</div>
                        <div class="productImg">
                            <a href="detail.html" title="Máy giặt Panasonic NA-F100A1WRV">
                                <img src="Content/images/slideProduct-5.jpg" data-original="images/slideProduct-5.jpg" class="img-responsive" alt="Máy giặt Panasonic NA-F100A1WRV" style="display: inline;">
                            </a>
                            <div class="hoverButtons">
                                <span data-toggle="modal" data-target="#998"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Cho vào giỏ hàng"><i class="fa fa-shopping-cart"></i></a></span>

                                <span data-toggle="modal" data-target="#999"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Xem nhanh"><i class="fa fa-search"></i></a></span>

                                <a href="#" class="button skype" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tư vấn qua Skype"><i class="fa fa-skype"></i></a>
                            </div>
                        </div>
                        <h3><a href="detail.html" title="Máy giặt Panasonic NA-F100A1WRV">Máy giặt Panasonic NA-F100A1WRV</a></h3>
                        <div class="productPrice">
                            <del>7.990.000₫</del>
                            <span>6.190.000₫</span>
                        </div>
                        <form class="actions clearfix" method="post" action="#">
                            <a href="#" class="button"><i class="hoverButton"></i>Chọn sản phẩm</a>
                        </form>
                    </div>
                </div>
                <!-- End Item -->
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
                <h2 class="title hidden-xs hidden-sm">Điện lạnh</h2>
                <a href="#navBigCollectionMobile1" class="title hidden-md hidden-lg bigCollectionBtnNav dropDownButton" data-toggle="collapse">Điện lạnh <i class="fa fa-bars"></i></a>
                <div class="navBigCollectionMobile dropList hidden-md hidden-lg collapse" id="navBigCollectionMobile1">
                    <ul class="nav nav-tabs tabAJAXProducts" role="tablist">
                        <li role="presentation" class="active">
                            <a href="#taba1" data-collection="may-giat" role="tab" data-toggle="tab">Máy giặt</a>
                            <a href="#" class="readMore" data-toggle="tooltip" title="" data-original-title="Xem thêm sản phẩm khác">+</a>
                        </li>
                        <li role="presentation">
                            <a href="#taba2" data-collection="may-lanh" role="tab" data-toggle="tab">Máy lạnh</a>
                            <a href="#" class="readMore" data-toggle="tooltip" title="" data-original-title="Xem thêm sản phẩm khác">+</a>
                        </li>
                        <li role="presentation">
                            <a href="#taba3" data-collection="tu-lanh" role="tab" data-toggle="tab">Tủ lạnh</a>
                            <a href="#" class="readMore" data-toggle="tooltip" title="" data-original-title="Xem thêm sản phẩm khác">+</a>
                        </li>
                        <li role="presentation">
                            <a href="#taba4" data-collection="may-say-quan-ao" role="tab" data-toggle="tab">Máy sấy quần áo</a>
                            <a href="#" class="readMore" data-toggle="tooltip" title="" data-original-title="Xem thêm sản phẩm khác">+</a>
                        </li>
                        <li role="presentation">
                            <a href="#taba5" data-collection="may-nuoc-nong" role="tab" data-toggle="tab">Máy nước nóng</a>
                            <a href="#" class="readMore" data-toggle="tooltip" title="" data-original-title="Xem thêm sản phẩm khác">+</a>
                        </li>
                        <li role="presentation">
                            <a href="#taba6" data-collection="may-loc-nuoc" role="tab" data-toggle="tab">Máy lọc nước</a>
                            <a href="#" class="readMore" data-toggle="tooltip" title="" data-original-title="Xem thêm sản phẩm khác">+</a>
                        </li>
                        <li role="presentation">
                            <a href="#taba7" data-collection="" role="tab" data-toggle="tab">Máy rửa chén</a>
                            <a href="#" class="readMore" data-toggle="tooltip" title="" data-original-title="Xem thêm sản phẩm khác">+</a>
                        </li>
                    </ul>
                </div>
                <ul class="nav nav-tabs tabAJAXProducts hidden-xs hidden-sm" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#taba1" data-collection="may-giat" role="tab" data-toggle="tab">Máy giặt</a>
                        <a href="#" class="readMore" data-toggle="tooltip" title="" data-original-title="Xem thêm sản phẩm khác">+</a>
                    </li>
                    <li role="presentation">
                        <a href="#taba2" data-collection="may-lanh" role="tab" data-toggle="tab">Máy lạnh</a>
                        <a href="#" class="readMore" data-toggle="tooltip" title="" data-original-title="Xem thêm sản phẩm khác">+</a>
                    </li>
                    <li role="presentation">
                        <a href="#taba3" data-collection="tu-lanh" role="tab" data-toggle="tab">Tủ lạnh</a>
                        <a href="#" class="readMore" data-toggle="tooltip" title="" data-original-title="Xem thêm sản phẩm khác">+</a>
                    </li>
                    <li role="presentation">
                        <a href="#taba4" data-collection="may-say-quan-ao" role="tab" data-toggle="tab">Máy sấy quần áo</a>
                        <a href="#" class="readMore" data-toggle="tooltip" title="" data-original-title="Xem thêm sản phẩm khác">+</a>
                    </li>
                    <li role="presentation">
                        <a href="#taba5" data-collection="may-nuoc-nong" role="tab" data-toggle="tab">Máy nước nóng</a>
                        <a href="#" class="readMore" data-toggle="tooltip" title="" data-original-title="Xem thêm sản phẩm khác">+</a>
                    </li>
                    <li role="presentation">
                        <a href="#taba6" data-collection="may-loc-nuoc" role="tab" data-toggle="tab">Máy lọc nước</a>
                        <a href="#" class="readMore" data-toggle="tooltip" title="" data-original-title="Xem thêm sản phẩm khác">+</a>
                    </li>
                    <li role="presentation">
                        <a href="#taba7" data-collection="" role="tab" data-toggle="tab">Máy rửa chén</a>
                        <a href="#/" class="readMore" data-toggle="tooltip" title="" data-original-title="Xem thêm sản phẩm khác">+</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- End ControlTabsWrapper -->
        <div class="tabContentWrapper">
            <div class="tabContent">
                <div class="tab-pane fade in active" id="taba1" role="tabpanel">
                    <!-- Item -->
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                        <div class="productGrid">
                            <div class="productSale"><span>-23%</span></div>
                            <div class="productImg">
                                <a href="#" title="Máy giặt Panasonic NA-F100A1WRV">
                                    <img src="Content/images/apihulozuab22v.jpg" data-original="images/apihulozuab22v.jpg" class="img-fix" alt="Máy giặt Panasonic NA-F100A1WRV" style="display: inline;">
                                </a>
                                <div class="hoverButtons">
                                    <span data-toggle="modal" data-target="#999"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Xem nhanh"><i class="fa fa-search"></i></a></span>
                                    <a href="#" class="button skype" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tư vấn qua Skype"><i class="fa fa-skype"></i></a>
                                </div>
                            </div>
                            <h3><a href="#" title="Máy giặt Panasonic NA-F100A1WRV">Máy giặt Panasonic NA-F100A1WRV</a></h3>
                            <div class="productPrice">
                                <del>7.990.000₫</del>
                                <span>6.190.000₫</span>
                            </div>
                            <form class="actions clearfix" method="post" action="#">
                                <a href="#" class="button"><i class="hoverButton"></i>Chọn sản phẩm</a>
                            </form>
                        </div>
                    </div>
                    <!--End Item-->
                    <!-- Item -->
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                        <div class="productGrid">
                            <!-- <div class="productSale"><span>-23%</span></div> -->
                            <div class="productImg">
                                <a href="#" title="Máy giặt Panasonic NA-F100A1WRV">
                                    <img src="Content/images/sanpham-2.jpg" data-original="images/sanpham-2.jpg" class="img-fix" alt="Máy giặt Samsung 9 kg WA90J5710SG/SV" style="display: inline;">
                                </a>
                                <div class="hoverButtons">
                                    <span data-toggle="modal" data-target="#999"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Xem nhanh"><i class="fa fa-search"></i></a></span>
                                    <a href="#" class="button skype" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tư vấn qua Skype"><i class="fa fa-skype"></i></a>
                                </div>
                            </div>
                            <h3><a href="#" title="Máy giặt Panasonic NA-F100A1WRV">Máy giặt Samsung 9 kg WA90J5710SG/SV</a></h3>
                            <div class="productPrice">
                                <del>7.990.000₫</del>
                                <span>6.190.000₫</span>
                            </div>
                            <form class="actions clearfix" method="post" action="#">
                                <a href="#" class="button"><i class="hoverButton"></i>Chọn sản phẩm</a>
                            </form>
                        </div>
                    </div>
                    <!--End Item-->
                    <!-- Item -->
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                        <div class="productGrid">
                            <div class="productSale"><span>-3%</span></div>
                            <div class="productImg">
                                <a href="#" title="Máy giặt Panasonic NA-F100A1WRV">
                                    <img src="Content/images/sanpham-3.jpg" data-original="images/sanpham-3.jpg" class="img-fix" alt="Máy giặt Samsung 9 kg WA90J5710SG/SV" style="display: inline;">
                                </a>
                                <div class="hoverButtons">
                                    <span data-toggle="modal" data-target="#999"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Xem nhanh"><i class="fa fa-search"></i></a></span>
                                    <a href="#" class="button skype" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tư vấn qua Skype"><i class="fa fa-skype"></i></a>
                                </div>
                            </div>
                            <h3><a href="#" title="Máy giặt Panasonic NA-F100A1WRV">Máy giặt Samsung 9 kg WA90J5710SG/SV</a></h3>
                            <div class="productPrice">
                                <del>7.990.000₫</del>
                                <span>6.190.000₫</span>
                            </div>
                            <form class="actions clearfix" method="post" action="#">
                                <a href="#" class="button"><i class="hoverButton"></i>Chọn sản phẩm</a>
                            </form>
                        </div>
                    </div>
                    <!--End Item-->
                    <!-- Item -->
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                        <div class="productGrid">
                            <!-- <div class="productSale"><span>-23%</span></div> -->
                            <div class="productImg">
                                <a href="#" title="Máy giặt Panasonic NA-F100A1WRV">
                                    <img src="Content/images/sanpham-4.jpg" data-original="images/sanpham-4.jpg" class="img-fix" alt="Máy giặt Samsung 9 kg WA90J5710SG/SV" style="display: inline;">
                                </a>
                                <div class="hoverButtons">
                                    <span data-toggle="modal" data-target="#999"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Xem nhanh"><i class="fa fa-search"></i></a></span>
                                    <a href="#" class="button skype" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tư vấn qua Skype"><i class="fa fa-skype"></i></a>
                                </div>
                            </div>
                            <h3><a href="#" title="Máy giặt Panasonic NA-F100A1WRV">Máy giặt Samsung 9 kg WA90J5710SG/SV</a></h3>
                            <div class="productPrice">
                                <del>7.990.000₫</del>
                                <span>6.190.000₫</span>
                            </div>
                            <form class="actions clearfix" method="post" action="#">
                                <a href="#" class="button"><i class="hoverButton"></i>Chọn sản phẩm</a>
                            </form>
                        </div>
                    </div>
                    <!--End Item-->
                    <!-- Item -->
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                        <div class="productGrid">
                            <div class="productSale"><span>-37%</span></div>
                            <div class="productImg">
                                <a href="#" title="Máy giặt Panasonic NA-F100A1WRV">
                                    <img src="Content/images/sanpham-5.jpg" data-original="images/sanpham-5.jpg" class="img-fix" alt="Máy giặt Samsung 9 kg WA90J5710SG/SV" style="display: inline;">
                                </a>
                                <div class="hoverButtons">
                                    <span data-toggle="modal" data-target="#999"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Xem nhanh"><i class="fa fa-search"></i></a></span>
                                    <a href="#" class="button skype" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tư vấn qua Skype"><i class="fa fa-skype"></i></a>
                                </div>
                            </div>
                            <h3><a href="#" title="Máy giặt Panasonic NA-F100A1WRV">Máy giặt Samsung 9 kg WA90J5710SG/SV</a></h3>
                            <div class="productPrice">
                                <del>7.990.000₫</del>
                                <span>6.190.000₫</span>
                            </div>
                            <form class="actions clearfix" method="post" action="#">
                                <a href="#" class="button"><i class="hoverButton"></i>Chọn sản phẩm</a>
                            </form>
                        </div>
                    </div>
                    <!--End Item-->
                    <!-- Item -->
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                        <div class="productGrid">
                            <!-- <div class="productSale"><span>-23%</span></div> -->
                            <div class="productImg">
                                <a href="#" title="Máy giặt Panasonic NA-F100A1WRV">
                                    <img src="Content/images/sanpham-6.jpg" data-original="images/sanpham-6.jpg" class="img-fix" alt="Máy giặt Samsung 9 kg WA90J5710SG/SV" style="display: inline;">
                                </a>
                                <div class="hoverButtons">
                                    <span data-toggle="modal" data-target="#999"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Xem nhanh"><i class="fa fa-search"></i></a></span>
                                    <a href="#" class="button skype" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tư vấn qua Skype"><i class="fa fa-skype"></i></a>
                                </div>
                            </div>
                            <h3><a href="#" title="Máy giặt Panasonic NA-F100A1WRV">Máy giặt Samsung 9 kg WA90J5710SG/SV</a></h3>
                            <div class="productPrice">
                                <del>7.990.000₫</del>
                                <span>6.190.000₫</span>
                            </div>
                            <form class="actions clearfix" method="post" action="#">
                                <a href="#" class="button"><i class="hoverButton"></i>Chọn sản phẩm</a>
                            </form>
                        </div>
                    </div>
                    <!--End Item-->
                    <!-- Item -->
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                        <div class="productGrid">
                            <!-- <div class="productSale"><span>-23%</span></div> -->
                            <div class="productImg">
                                <a href="#" title="Máy giặt Panasonic NA-F100A1WRV">
                                    <img src="Content/images/sanpham-7.jpg" data-original="images/sanpham-7.jpg" class="img-fix" alt="Máy giặt Samsung 9 kg WA90J5710SG/SV" style="display: inline;">
                                </a>
                                <div class="hoverButtons">
                                    <span data-toggle="modal" data-target="#999"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Xem nhanh"><i class="fa fa-search"></i></a></span>
                                    <a href="#" class="button skype" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tư vấn qua Skype"><i class="fa fa-skype"></i></a>
                                </div>
                            </div>
                            <h3><a href="#" title="Máy giặt Panasonic NA-F100A1WRV">Máy giặt Samsung 9 kg WA90J5710SG/SV</a></h3>
                            <div class="productPrice">
                                <del>7.990.000₫</del>
                                <span>6.190.000₫</span>
                            </div>
                            <form class="actions clearfix" method="post" action="#">
                                <a href="#" class="button"><i class="hoverButton"></i>Chọn sản phẩm</a>
                            </form>
                        </div>
                    </div>
                    <!--End Item-->
                    <!-- Item -->
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                        <div class="productGrid">
                            <div class="productSale"><span>-13%</span></div>
                            <div class="productImg">
                                <a href="#" title="Máy giặt Panasonic NA-F100A1WRV">
                                    <img src="Content/images/sanpham-8.jpg" data-original="images/sanpham-8.jpg" class="img-fix" alt="Máy giặt Samsung 9 kg WA90J5710SG/SV" style="display: inline;">
                                </a>
                                <div class="hoverButtons">
                                    <span data-toggle="modal" data-target="#999"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Xem nhanh"><i class="fa fa-search"></i></a></span>
                                    <a href="#" class="button skype" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tư vấn qua Skype"><i class="fa fa-skype"></i></a>
                                </div>
                            </div>
                            <h3><a href="#" title="Máy giặt Panasonic NA-F100A1WRV">Máy giặt Samsung 9 kg WA90J5710SG/SV</a></h3>
                            <div class="productPrice">
                                <del>7.990.000₫</del>
                                <span>6.190.000₫</span>
                            </div>
                            <form class="actions clearfix" method="post" action="#">
                                <a href="#" class="button"><i class="hoverButton"></i>Chọn sản phẩm</a>
                            </form>
                        </div>
                    </div>
                    <!--End Item-->

                </div>
                <div class="tab-pane fade in" id="taba2" role="tabpanel"></div>
                <div class="tab-pane fade in" id="taba3" role="tabpanel"></div>
                <div class="tab-pane fade in" id="taba4" role="tabpanel"></div>
                <div class="tab-pane fade in" id="taba5" role="tabpanel"></div>
                <div class="tab-pane fade in" id="taba6" role="tabpanel"></div>
                <div class="tab-pane fade in" id="taba7" role="tabpanel"></div>
            </div>
        </div>
        <!--  tabContentWrapper -->
    </div>
    <!-- End s1 -->

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
