<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="WebBanLinhKien.Search" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="ProductContent">
        <div class="breadcrumb">
        <div class="container">
            <ol class="list-unstyled list-inline">
                <li>
                    <a href="index.html" itemprop="item"><i class="fa fa-home"></i> <span>Trang chủ</span></a>
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
                            <label for="">Sắp xếp</label>
                            <span class="boxSelectDown"><i class="fa fa-angle-down"></i></span>
                            <select name="sortBy" id="sortBy">
                                <option value="default" selected="selected">Mặc định</option>
                                <option value="alpha-asc">A → Z</option>
                                <option value="alpha-desc">Z → A</option>
                                <option value="price-asc">Giá tăng dần</option>
                                <option value="price-desc">Giá giảm dần</option>
                                <option value="created-desc">Hàng mới nhất</option>
                                <option value="created-asc">Hàng cũ nhất</option>
                            </select>
                        </div>
                        <a href="product.html" class="switchView active viewCollection" data-view="grid" data-toggle="tooltip" title="" data-original-title="Xem dạng lưới"><i class="fa fa-th"></i></a>

                        <a href="productSingle.html" class="switchView viewCollection" data-view="list" data-toggle="tooltip" title="" data-original-title="Xem dạng danh sách"><i class="fa fa-th-list"></i></a>
                    </div>
                    <div class="collectionDisplay">
                        <div class="collectionResultProducts" id="sp-1">
                            <asp:PlaceHolder runat="server" id="grdContent"/>
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
    </section><!-- End BlogPage -->
</asp:Content>