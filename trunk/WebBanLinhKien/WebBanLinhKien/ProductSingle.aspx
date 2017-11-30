<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductSingle.aspx.cs" Inherits="WebBanLinhKien.ProductSingle" %>
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
<asp:Content ID="Content6" ContentPlaceHolderID="ProductContent" runat="server">
     <div class="breadcrumb">
        <div class="container">
            <ol class="list-unstyled list-inline">
                <li>
                    <a href="Home.aspx" itemprop="item"><i class="fa fa-home"></i> <span>Trang chủ</span></a>
                </li>
                <li><span class="divide"><i class="fa fa-angle-right"></i></span></li>
                <li>
                    <span class="current" itemprop="item"><b>Tất Cả Sản Phẩm</b></span>
                </li>
            </ol>
        </div>
    </div><!-- End Breadcrumb -->
    <section class="blogPage">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 col-md-push-3 col-lg-push-3">
                    <div class="topImgCollection">
                        <h1 class="titleCollection">Tất cả sản phẩm</h1>
                        <img src="Content/images/bg_collection.jpg" class="img-responsive" alt="Tất cả sản phẩm">
                        <div class="bg"></div>
                    </div>
                    <div class="toolsCollection clearfix">
                        <div class="boxSelect">
                            <%--<label for="">Sắp xếp</label>--%>
                            <asp:Label Text="Sắp xếp" runat="server" Font-Bold="True" />
                            <span class="boxSelectDown"><i class="fa fa-angle-down"></i></span>
                            <%--<select name="sortBy" id="sortBy">
                                <option value="default" selected="selected">Mặc định</option>
                                <option value="alpha-asc">A → Z</option>
                                <option value="alpha-desc">Z → A</option>
                                <option value="price-asc">Giá tăng dần</option>
                                <option value="price-desc">Giá giảm dần</option>
                                <option value="created-desc">Hàng mới nhất</option>
                                <option value="created-asc">Hàng cũ nhất</option>
                            </select>--%>
                            <asp:DropDownList ID="DropDownList1" runat="server" >
                                <asp:ListItem Text="Mặc định" />
                                <asp:ListItem Text="A → Z" />
                                <asp:ListItem Text="Z → A" />
                                <asp:ListItem Text="Giá tăng dần" />
                                <asp:ListItem Text="Giá giảm dần" />
                                <asp:ListItem Text="Hàng mới nhất" />
                                <asp:ListItem Text="Hàng cũ nhất" />
                            </asp:DropDownList>
                        </div>
                        <a href="Product.aspx" class="switchView viewCollection" data-view="grid" data-toggle="tooltip" title="" data-original-title="Xem dạng lưới"><i class="fa fa-th"></i></a>

                        <a href="ProductSingle.aspx" class="switchView active viewCollection" data-view="list" data-toggle="tooltip" title="" data-original-title="Xem dạng danh sách"><i class="fa fa-th-list"></i></a>
                    </div>
                    <div class="collectionDisplay">
                        <div class="collectionResultProducts" id="sp-2">
                            <div class="item-2">
                                <div class="productList QuickAddToCart clearfix">
                                    <div class="productListImg">
                                        <a href="#">
                                            <img src="Content/images/sanpham-1.jpg" data-original="sanpham-1.jpg" class="img-responsive lazy imgQuickAddToCart" alt="Máy hút bụi Electrolux ZAP9940 1900W">
                                        </a>
                                    </div>
                                    <div class="productListInfo">
                                        <h3><a href="#">Máy hút bụi Electrolux ZAP9940 1900W</a></h3>
                                        <div class="productListPrice priceQuickAddToCart">
                                            <span>3.200.000₫</span>   
                                        </div>
                                        <span class="line"></span>
                                        <div class="productListDesc">
                                             Hút bụi nhanh chóng với công suất 1900 W. Máy hút bụi có bộ lọc Hepa kháng khuẩn, làm sạch bụi hiệu quả. Công nghệ hút xoáy Cyclonic giúp việc xử lý bụi dễ...
                                        </div>
                                        <form action="#" method="post" class="formQuickAddToCart productListForm">
                                            <input type="hidden" name="variantId" value="9363959">
                                            <%--<button class="button buttonProductList quickAddToCart" data-toggle="tooltip" title="" data-original-title="Cho vào giỏ hàng"><i class="fa fa-shopping-cart"></i> Cho vào giỏ hàng</button>--%>
                                            <asp:Button Text="Cho vào giỏ hàng" runat="server" />                               
                                            <a href="#" class="button skype" data-toggle="tooltip" title="" data-original-title="Chat qua Skype"><i class="fa fa-skype"></i></a>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="item-2">
                                <div class="productList QuickAddToCart clearfix">
                                    <div class="productListImg">
                                        <a href="#">
                                            <img src="Content/images/sanpham-2.jpg" data-original="sanpham-2.jpg" class="img-responsive lazy imgQuickAddToCart" alt="Máy hút bụi Electrolux ZAP9940 1900W">
                                        </a>
                                    </div>
                                    <div class="productListInfo">
                                        <h3><a href="#">Máy hút bụi Electrolux ZAP9940 1900W</a></h3>
                                        <div class="productListPrice priceQuickAddToCart">
                                            <span>3.200.000₫</span>   
                                        </div>
                                        <span class="line"></span>
                                        <div class="productListDesc">
                                             Hút bụi nhanh chóng với công suất 1900 W. Máy hút bụi có bộ lọc Hepa kháng khuẩn, làm sạch bụi hiệu quả. Công nghệ hút xoáy Cyclonic giúp việc xử lý bụi dễ...
                                        </div>
                                        <form action="#" method="post" class="formQuickAddToCart productListForm">
                                            <input type="hidden" name="variantId" value="9363959">
                                            <button class="button buttonProductList quickAddToCart" data-toggle="tooltip" title="" data-original-title="Cho vào giỏ hàng"><i class="fa fa-shopping-cart"></i> Cho vào giỏ hàng</button>
                                            <a href="#" class="button skype" data-toggle="tooltip" title="" data-original-title="Chat qua Skype"><i class="fa fa-skype"></i></a>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="item-2">
                                <div class="productList QuickAddToCart clearfix">
                                    <div class="productListImg">
                                        <a href="#">
                                            <img src="Content/images/sanpham-3.jpg" data-original="sanpham-3.jpg" class="img-responsive lazy imgQuickAddToCart" alt="Máy hút bụi Electrolux ZAP9940 1900W">
                                        </a>
                                    </div>
                                    <div class="productListInfo">
                                        <h3><a href="#">Máy hút bụi Electrolux ZAP9940 1900W</a></h3>
                                        <div class="productListPrice priceQuickAddToCart">
                                            <span>3.200.000₫</span>   
                                        </div>
                                        <span class="line"></span>
                                        <div class="productListDesc">
                                             Hút bụi nhanh chóng với công suất 1900 W. Máy hút bụi có bộ lọc Hepa kháng khuẩn, làm sạch bụi hiệu quả. Công nghệ hút xoáy Cyclonic giúp việc xử lý bụi dễ...
                                        </div>
                                        <form action="#" method="post" class="formQuickAddToCart productListForm">
                                            <input type="hidden" name="variantId" value="9363959">
                                            <button class="button buttonProductList quickAddToCart" data-toggle="tooltip" title="" data-original-title="Cho vào giỏ hàng"><i class="fa fa-shopping-cart"></i> Cho vào giỏ hàng</button>
                                            <a href="#" class="button skype" data-toggle="tooltip" title="" data-original-title="Chat qua Skype"><i class="fa fa-skype"></i></a>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="item-2">
                                <div class="productList QuickAddToCart clearfix">
                                    <div class="productListImg">
                                        <a href="#">
                                            <img src="Content/images/sanpham-4.jpg" data-original="sanpham-4.jpg" class="img-responsive lazy imgQuickAddToCart" alt="Máy hút bụi Electrolux ZAP9940 1900W">
                                        </a>
                                    </div>
                                    <div class="productListInfo">
                                        <h3><a href="#">Máy hút bụi Electrolux ZAP9940 1900W</a></h3>
                                        <div class="productListPrice priceQuickAddToCart">
                                            <span>3.200.000₫</span>   
                                        </div>
                                        <span class="line"></span>
                                        <div class="productListDesc">
                                             Hút bụi nhanh chóng với công suất 1900 W. Máy hút bụi có bộ lọc Hepa kháng khuẩn, làm sạch bụi hiệu quả. Công nghệ hút xoáy Cyclonic giúp việc xử lý bụi dễ...
                                        </div>
                                        <form action="#" method="post" class="formQuickAddToCart productListForm">
                                            <input type="hidden" name="variantId" value="9363959">
                                            <button class="button buttonProductList quickAddToCart" data-toggle="tooltip" title="" data-original-title="Cho vào giỏ hàng"><i class="fa fa-shopping-cart"></i> Cho vào giỏ hàng</button>
                                            <a href="#" class="button skype" data-toggle="tooltip" title="" data-original-title="Chat qua Skype"><i class="fa fa-skype"></i></a>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="item-2">
                                <div class="productList QuickAddToCart clearfix">
                                    <div class="productListImg">
                                        <a href="#">
                                            <img src="Content/images/sanpham-5.jpg" data-original="sanpham-5.jpg" class="img-responsive lazy imgQuickAddToCart" alt="Máy hút bụi Electrolux ZAP9940 1900W">
                                        </a>
                                    </div>
                                    <div class="productListInfo">
                                        <h3><a href="#">Máy hút bụi Electrolux ZAP9940 1900W</a></h3>
                                        <div class="productListPrice priceQuickAddToCart">
                                            <span>3.200.000₫</span>   
                                        </div>
                                        <span class="line"></span>
                                        <div class="productListDesc">
                                             Hút bụi nhanh chóng với công suất 1900 W. Máy hút bụi có bộ lọc Hepa kháng khuẩn, làm sạch bụi hiệu quả. Công nghệ hút xoáy Cyclonic giúp việc xử lý bụi dễ...
                                        </div>
                                        <form action="#" method="post" class="formQuickAddToCart productListForm">
                                            <input type="hidden" name="variantId" value="9363959">
                                            <button class="button buttonProductList quickAddToCart" data-toggle="tooltip" title="" data-original-title="Cho vào giỏ hàng"><i class="fa fa-shopping-cart"></i> Cho vào giỏ hàng</button>
                                            <a href="#" class="button skype" data-toggle="tooltip" title="" data-original-title="Chat qua Skype"><i class="fa fa-skype"></i></a>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="item-2">
                                <div class="productList QuickAddToCart clearfix">
                                    <div class="productListImg">
                                        <a href="#">
                                            <img src="Content/images/sanpham-6.jpg" data-original="sanpham-6.jpg" class="img-responsive lazy imgQuickAddToCart" alt="Máy hút bụi Electrolux ZAP9940 1900W">
                                        </a>
                                    </div>
                                    <div class="productListInfo">
                                        <h3><a href="#">Máy hút bụi Electrolux ZAP9940 1900W</a></h3>
                                        <div class="productListPrice priceQuickAddToCart">
                                            <span>3.200.000₫</span>   
                                        </div>
                                        <span class="line"></span>
                                        <div class="productListDesc">
                                             Hút bụi nhanh chóng với công suất 1900 W. Máy hút bụi có bộ lọc Hepa kháng khuẩn, làm sạch bụi hiệu quả. Công nghệ hút xoáy Cyclonic giúp việc xử lý bụi dễ...
                                        </div>
                                        <form action="#" method="post" class="formQuickAddToCart productListForm">
                                            <input type="hidden" name="variantId" value="9363959">
                                            <button class="button buttonProductList quickAddToCart" data-toggle="tooltip" title="" data-original-title="Cho vào giỏ hàng"><i class="fa fa-shopping-cart"></i> Cho vào giỏ hàng</button>
                                            <a href="#" class="button skype" data-toggle="tooltip" title="" data-original-title="Chat qua Skype"><i class="fa fa-skype"></i></a>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="pager clearfix">
                            <span class="current" data-toggle="tooltip" data-placement="top" title="" data-original-title="Trang 1">1</span>
                            <a href="#" data-page="2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Trang 2">2</a>
                            <a href="#" data-page="3" data-toggle="tooltip" data-placement="top" title="" data-original-title="Trang 3">3</a>
                            <a href="#" data-page="2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Trang kế tiếp"><i class="fa fa-angle-right"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 col-md-pull-9 col-lg-pull-9">
                   <div class="filter-container">
<%--                        <div class="filtersTool selectedFilter" style="">
                            <h2 class="titleDecoration">
                                <span class="line"></span>
                                <span class="title">Bạn đã chọn</span>
                            </h2>                           
                            <a href="#" id="filterClearAll" class="filterClearAll">Bỏ hết <i class="fa fa-angle-right"></i></a>
                            <div class="selectedFilterList">
                                <ul class="list-unstyled">
                                    <li class="selectedFilterItem">Hitachi <a href="#" data-id="filter-hitachi"><i class="close">(Xóa)</i></a></li>
                                </ul>
                            </div>  
                        </div><!-- End SelectedFilter -->--%>
                        <div class="filtersTool filterRange">
                            <h2 class="titleDecoration">
                                <span class="line"></span>
                                <span class="title">Lọc theo giá</span>
                            </h2>
                            <div class="filterToolGroup">
                                <div id="slider" class="ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content">
                                    <div class="ui-slider-range ui-corner-all ui-widget-header" style="left: 0%; width: 100%;"></div>
                                    <!--<span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: %;"></span>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 100%;"></span>-->
                                </div>
                                <div class="clearfix">
                                    <div id="start" class="left"><input value="0"></div>
                                    <div id="stop" class="right"><input value="20000000"></div>
                                </div>
                                <a id="old-value" href="javascript:;"></a>
                                <a id="filter-value" class="button" href="javascript:void(0);" data-value="(>-1 AND < 20000001)"><i class="hoverButton"></i>Lọc</a>
                                <script>
                                    var maxx = 20000000 / 10;
                                    $('#slider').slider({
                                        min: '0',
                                        max: maxx,
                                        range: true,
                                        values: [0, 20000000],
                                        slide: function (event, ui) {
                                            if (ui.values[0] >= ui.values[1]) {
                                                if (ui.handle == $("#slider a")[0]) {
                                                    $("#slider").slider("values", 1, ui.value);
                                                    ui.values[0] = ui.value;
                                                    ui.values[1] = ui.value;
                                                } else {
                                                    $("#slider").slider("values", 0, ui.value);
                                                    ui.values[0] = ui.value;
                                                    ui.values[1] = ui.value;
                                                }
                                            }
                                            var uimax = ui.values[1] + 1;
                                            $('#start input').val(ui.values[0]);
                                            $('#stop input').val(ui.values[1] + 1);
                                            var uimin = ui.values[0] - 1;
                                            var uimax = ui.values[1] + 2;
                                            $('#filter-value').attr('data-value', '(>' + uimin + ' AND <' + uimax + ')');
                                        }
                                    });
                                    $(document).on('change', '#start', function (e) {
                                        var val = parseInt($('#start input').val()) - 1;
                                        var val2 = parseInt($('#stop input').val()) + 1;

                                        $("#slider").slider("values", 0, parseInt(val));
                                        $('#filter-value').attr('data-value', '(>' + val + ' AND <' + val2 + ')');
                                    });
                                    $(document).on('change', '#stop', function (e) {
                                        var val = parseInt($('#start input').val()) - 1;
                                        var val2 = parseInt($('#stop input').val()) + 1;
                                        $("#slider").slider("values", 1, parseInt(val2));
                                        $('#filter-value').attr('data-value', '(>' + val + ' AND <' + val2 + ')');
                                    });
                                </script>
                            </div>
                        </div><!-- EndFilterRange -->
                        <div class="filtersTool filterColor">
                            <h2 class="titleDecoration"><span class="line"></span>
                                <span class="title">Bộ lọc màu</span>
                            </h2>
                            <div class="filterToolGroup">
                                <ul class="list-unstyled">
                                    <li class="color">                      
                                        <input type="checkbox" id="filter-do" data-group="tag1" data-field="tags" data-text="Đỏ" value="(Đỏ)" data-operator="OR">
                                        <label for="filter-do" style="background-color:red;" data-toggle="tooltip" data-placement="top" title="" data-original-title="Đỏ">Đỏ</label>
                                    </li>
                                    <li class="color">                      
                                        <input type="checkbox" id="filter-xanh" data-group="tag1" data-field="tags" data-text="Xanh" value="(Xanh)" data-operator="OR">
                                        <label for="filter-xanh" style="background-color:#0007ff;" data-toggle="tooltip" data-placement="top" title="" data-original-title="Xanh">Xanh</label>
                                    </li>
                                    <li class="color">                      
                                        <input type="checkbox" id="filter-tim" data-group="tag1" data-field="tags" data-text="Tím" value="(Tím)" data-operator="OR">
                                        <label for="filter-tim" style="background-color:#b409f3;" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tím">Tím</label>
                                    </li>
                                    <li class="color">                      
                                        <input type="checkbox" id="filter-cam" data-group="tag1" data-field="tags" data-text="Cam" value="(Cam)" data-operator="OR">
                                        <label for="filter-cam" style="background-color:#ff5300;" data-toggle="tooltip" data-placement="top" title="" data-original-title="Cam">Cam</label>
                                    </li>
                                    <li class="color">                      
                                        <input type="checkbox" id="filter-trang" data-group="tag1" data-field="tags" data-text="Trắng" value="(Trắng)" data-operator="OR">
                                        <label for="filter-trang" style="background-color:#fff;border:2px solid #ebebeb;" data-toggle="tooltip" data-placement="top" title="" data-original-title="Trắng">Trắng</label>
                                    </li>
                                </ul>
                            </div>
                        </div><!-- End filterColor -->
                        <div class="filtersTool filterCheckbox">
                            <h2 class="titleDecoration"><span class="line"></span>
                                <span class="title">Lọc theo thương hiệu</span>
                            </h2>
                            <div class="filterToolGroup">
                                <ul class="list-unstyled clearfix">
                                    <li class="checkbox clearfix">
                                        <input type="checkbox" id="filter-elextrolux" data-group="Hãng" data-field="vendor" data-text="Elextrolux" value="(Elextrolux)" data-operator="OR">
                                        <label for="filter-elextrolux"><i class="fa fa-check"></i>Elextrolux</label>
                                        <span>Elextrolux</span>
                                    </li>
                                    <li class="checkbox clearfix">
                                        <input type="checkbox" id="filter-hitachi" data-group="Hãng" data-field="vendor" data-text="Hitachi" value="(Hitachi)" data-operator="OR">
                                        <label for="filter-hitachi"><i class="fa fa-check"></i>Hitachi</label>
                                        <span>Hitachi</span>
                                    </li>
                                    <li class="checkbox clearfix">
                                        <input type="checkbox" id="filter-lg" data-group="Hãng" data-field="vendor" data-text="LG" value="(LG)" data-operator="OR">
                                        <label for="filter-lg"><i class="fa fa-check"></i>LG</label>
                                        <span>LG</span>
                                    </li>
                                    <li class="checkbox clearfix">
                                        <input type="checkbox" id="filter-midea" data-group="Hãng" data-field="vendor" data-text="Midea" value="(Midea)" data-operator="OR">
                                        <label for="filter-midea"><i class="fa fa-check"></i>Midea</label>
                                        <span>Midea</span>
                                    </li>
                                    <li class="checkbox clearfix">
                                        <input type="checkbox" id="filter-panasonic" data-group="Hãng" data-field="vendor" data-text="Panasonic" value="(Panasonic)" data-operator="OR">
                                        <label for="filter-panasonic"><i class="fa fa-check"></i>Panasonic</label>
                                        <span>Panasonic</span>
                                    </li>
                                    <li class="checkbox clearfix">
                                        <input type="checkbox" id="filter-samsung" data-group="Hãng" data-field="vendor" data-text="Samsung" value="(Samsung)" data-operator="OR">
                                        <label for="filter-samsung"><i class="fa fa-check"></i>Samsung</label>
                                        <span>Samsung</span>
                                    </li>
                                    <li class="checkbox clearfix">
                                        <input type="checkbox" id="filter-sanaky" data-group="Hãng" data-field="vendor" data-text="Sanaky" value="(Sanaky)" data-operator="OR">
                                        <label for="filter-sanaky"><i class="fa fa-check"></i>Sanaky</label>
                                        <span>Sanaky</span>
                                    </li>
                                    <li class="checkbox clearfix">
                                        <input type="checkbox" id="filter-sharp" data-group="Hãng" data-field="vendor" data-text="Sharp" value="(Sharp)" data-operator="OR">
                                        <label for="filter-sharp"><i class="fa fa-check"></i>Sharp</label>
                                        <span>Sharp</span>
                                    </li>
                                    <li class="checkbox clearfix">
                                        <input type="checkbox" id="filter-sunhouse" data-group="Hãng" data-field="vendor" data-text="Sunhouse" value="(Sunhouse)" data-operator="OR">
                                        <label for="filter-sunhouse"><i class="fa fa-check"></i>Sunhouse</label>
                                        <span>Sunhouse</span>
                                    </li>
                                    <li class="checkbox clearfix">
                                        <input type="checkbox" id="filter-toshiba" data-group="Hãng" data-field="vendor" data-text="Toshiba" value="(Toshiba)" data-operator="OR">
                                        <label for="filter-toshiba"><i class="fa fa-check"></i>Toshiba</label>
                                        <span>Toshiba</span>
                                    </li>
                                </ul>
                            </div>
                        </div><!-- End FilterCheckbox -->
                    </div><!-- End Filter Container -->
                    <div class="listProductsWrapper">
                        <h2 class="titleDecoration"><span class="line"></span><span class="title">Sản phẩm khuyến mại</span></h2>
                        <ul class="list-unstyled listProducts">                       
                            <li class="clearfix">
                                <img src="Content/images/15239577.jpg" class="listsProductsImg" alt="Máy hút bụi Hitachi BM16 1600 W">                        
                                <div class="listsProductsInfo">
                                    <h3><a href="#">Máy hút bụi Hitachi BM16 1600 W</a></h3>
                                    <div class="listsProductsPrice">
                                        <span>1.440.000₫</span>
                                    </div>
                                </div>
                            </li>
                            <li class="clearfix">
                                <img src="Content/images/1600232-noi-ap-suat-dien-da-nang-sunhouse-5-lit-sh-1650.jpg" class="listsProductsImg" alt="Nồi áp suất điện Sunhouse SHD-1552 5.0 lít">
                                                                
                                <div class="listsProductsInfo">
                                    <h3><a href="#">Nồi áp suất điện Sunhouse SHD-1552 5.0 lít</a></h3>
                                    <div class="listsProductsPrice">
                                        <span>800.000₫</span>
                                        <del>1.200.000₫</del>
                                    </div>
                                </div>
                            </li>
                            <li class="clearfix">
                                <img src="/images/big-165330-bep-hong-ngoai-midea-mir-t2015dc.jpg" class="listsProductsImg" alt="Bếp hồng ngoại Midea MIR-T2015DC">                    
                                <div class="listsProductsInfo">
                                    <h3><a href="#">Bếp hồng ngoại Midea MIR-T2015DC</a></h3>
                                    <div class="listsProductsPrice">
                                        <span>900.000₫</span>
                                        <del>1.300.000₫</del>
                                    </div>
                                </div>
                            </li>
                            <li class="clearfix">
                                <img src="Content/images/bep-hong-ngoai-sunhouse-shd6017-kem-vi-nuong.jpg" class="listsProductsImg" alt="Bếp hồng ngoại Sunhouse SHD 6017"> 
                                <div class="listsProductsInfo">
                                    <h3><a href="#">Bếp hồng ngoại Sunhouse SHD 6017</a></h3>
                                    <div class="listsProductsPrice">
                                        <span>700.000₫</span>
                                        <del>1.000.000₫</del>
                                    </div>
                                </div>
                            </li>
                            <li class="clearfix">
                                <img src="Content/images/may-giat-toshiba-aw-b1000gv-wl-tim-5862-3154811-1.jpg" class="listsProductsImg" alt="Máy giặt Toshiba 8.2kg AW-MF920LV WK">                  
                                <div class="listsProductsInfo">
                                    <h3><a href="#">Máy giặt Toshiba 8.2kg AW-MF920LV WK</a></h3>
                                    <div class="listsProductsPrice">
                                        <span>5.690.000₫</span>
                                        <del>6.200.000₫</del>
                                    </div>
                                </div>
                            </li>
                            
                        </ul>              
                    </div><!-- End ListProductsWrapper -->
                    <div class="sidebarBlogDefault">
                        <div class="listProductsWrapper recentlyProducts">
                            <h2 class="titleDecoration"><span class="line"></span><span class="title">Sản phẩm đã xem</span></h2>
                            <ul class="list-unstyled listProducts" id="recently-viewed-products">    
                                <li class="clearfix">
                                    <img src="Content/images/1600232-noi-ap-suat-dien-da-nang-sunhouse-5-lit-sh-1650.jpg" class="listsProductsImg" alt="Nồi áp suất điện Sunhouse SHD-1552 5.0 lít">
                                    <div class="listsProductsInfo">
                                        <h3 title="Nồi áp suất điện Sunhouse SHD-1552 5.0 lít"><a href="#">Nồi áp suất điện Sunhouse SHD-1552 5.0 lít</a></h3>     <div class="listsProductsPrice">
                                            <span>800.000 VND</span>
                                            <del>1.200.000 VND</del>
                                        </div>
                                    </div>
                                </li>
                                 <li class="clearfix">
                                    <img src="Content/images/1600232-noi-ap-suat-dien-da-nang-sunhouse-5-lit-sh-1650.jpg" class="listsProductsImg" alt="Nồi áp suất điện Sunhouse SHD-1552 5.0 lít">
                                    <div class="listsProductsInfo">
                                        <h3 title="Nồi áp suất điện Sunhouse SHD-1552 5.0 lít"><a href="#">Nồi áp suất điện Sunhouse SHD-1552 5.0 lít</a></h3>     <div class="listsProductsPrice">
                                            <span>800.000 VND</span>
                                            <del>1.200.000 VND</del>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div><!-- End SidebarBlogDefault -->
                    <div class="sidebarPorductGroup">
                        <a href="#">
                            <img src="Content/images/banner_blog_page.jpg" class="img-responsive lazy" alt="Galaxy S6">
                        </a>
                    </div><!-- End SidebarPorductGroup -->
                </div>
            </div>
        </div>
     </section>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="BrandContent" runat="server">
</asp:Content>
