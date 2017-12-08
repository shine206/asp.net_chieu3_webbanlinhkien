<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="WebBanLinhKien.ProductDetail" MasterPageFile="~/Site.Master" %>

<asp:Content ContentPlaceHolderID="ProductContent" ID="productDetailContent" runat="server">

    <section class="blogPage">
        <div class="container">
            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">

                    <div class="row">
                        <asp:Repeater runat="server" ID="rptProdutDetail" OnItemDataBound="rptProdutDetail_ItemDataBound">
                            <ItemTemplate>
                                <div class="clearfix prodDetailQuickAddCartWrapper">
                                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                        <div class="quickViewImg">
                                            <div class="quickViewFeaturedImg">
                                                <div class="slideshow-product owl-carousel owl-theme">
                                                    <asp:PlaceHolder runat="server" ID="mainImageContent" />
                                                    <%--<div class="item" data-hash="sp1">
                                                        <img src="images/sp1.jpg" class="img-responsive" alt="Ảnh sản phẩm">
                                                    </div>
                                                    <div class="item" data-hash="sp2"><img src="images/sp2.jpg" class="img-responsive" alt="Ảnh sản phẩm"></div>
                                                    <div class="item" data-hash="sp3">
                                                        <img src="images/sp3.jpg" class="img-responsive" alt="Ảnh sản phẩm">
                                                    </div>
                                                    <div class="item" data-hash="sp4">
                                                        <img src="images/sp4.jpg" class="img-responsive" alt="Ảnh sản phẩm">
                                                    </div>
                                                    <div class="item" data-hash="sp5">
                                                        <img src="images/sp5.jpg" class="img-responsive" alt="Ảnh sản phẩm">
                                                    </div>--%>
                                                </div>
                                            </div>
                                            <div class="quickViewThumbImg owl-carousel owl-theme">
                                                <asp:PlaceHolder runat="server" ID="subImageContent" />
                                                <%--<div class="sub-item">
                                                    <a href="#sp1">
                                                        <img src="images/sub-1.jpg"></a>
                                                </div>
                                                <div class="sub-item"><a href="#sp2"><img src="images/sub-2.jpg"></a></div>
                                                <div class="sub-item">
                                                    <a href="#sp3">
                                                        <img src="images/sub-3.jpg"></a>
                                                </div>
                                                <div class="sub-item">
                                                    <a href="#sp4">
                                                        <img src="images/sub-4.jpg"></a>
                                                </div>
                                                <div class="sub-item">
                                                    <a href="#sp5">
                                                        <img src="images/sub-5.jpg"></a>
                                                </div>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                        <div class="quickViewProduct">
                                            <div class="quickViewProductTitle"><a href="#"><%#Eval("name") %></a></div>
                                            <div class="quickViewProductMeta clearfix">
                                                <div class="quickViewProductVendor">NSX: <b>Midea</b></div>
                                                <div class="quickViewProductBrand">Loại: <b>Bếp điện</b></div>
                                                <div class="quickViewProductsku" style="display: none;"></div>
                                                <div class="quickViewProductBarcode">Mã SP: <b>T2015DC</b></div>
                                            </div>
                                            <div class="quickViewProductPrice hasMarginTop">
                                                <span><%# Eval("price", "{0:0,0} đ") %></span>
                                                <del><%# Eval("sel_price", "{0:0,0} đ") %></del>

                                            </div>
                                            <div class="quickViewProductActions clearfix">
                                                <div class="quickViewProductVariants" id="product-actions-5868449">
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
                                                </div>
                                            </div>
                                            <a href="tel:0868155456" class="boxHotline"><i class="fa fa-volume-control-phone"></i>0868.155.456</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix prodDetailTabs">
                                    <ul class="nav nav-tabs clearfix" role="tablist">
                                        <li role="presentation" class="active">
                                            <a href="#tab0" aria-controls="tab1" role="tab" data-toggle="tab" aria-expanded="false">Thông tin sản phẩm</a>
                                        </li>
                                        <li role="presentation" class=""><a href="#tab1" role="tab" data-toggle="tab" aria-expanded="false">Chính sách đổi trả</a></li>
                                    </ul>
                                    <div class="prodDetailTabsContent tab-content">


                                        <div class="tab-pane fade active in" id="tab0" role="tabpanel">
                                            <p></p>
                                            <p class="grp"><strong>Đặc tính sản phẩm</strong></p>
                                            <ul class="specs">
                                                <li>
                                                    <span class="specname">Loại bếp:</span>
                                                    <span class="specval">Bếp hồng ngoại</span>
                                                </li>
                                                <li>
                                                    <span class="specname">Công suất:</span>
                                                    <span class="specval">2000 W</span>
                                                </li>
                                                <li>
                                                    <span class="specname">Số lượng bếp:</span>
                                                    <span class="specval">Bếp đơn</span>
                                                </li>
                                                <li>
                                                    <span class="specname">Chất liệu mặt bếp:</span>
                                                    <span class="specval">Kính chịu nhiệt</span>
                                                </li>
                                                <li>
                                                    <span class="specname">Chế độ nấu tự động:</span>
                                                    <span class="specval">Xào, Lẩu, Chiên, Nấu canh, Nướng, Hấp</span>
                                                </li>
                                                <li>
                                                    <span class="specname">Bảng điều khiển:</span>
                                                    <span class="specval">Cảm ứng</span>
                                                </li>
                                                <li>
                                                    <span class="specname">Loại nồi nấu:</span>
                                                    <span class="specval">Tất cả loại nồi</span>
                                                </li>
                                                <li>
                                                    <span class="specname">Chế độ an toàn:</span>
                                                    <span class="specval">Khoá bảng điều khiển, Đèn báo mặt bếp còn nóng, Tự ngắt khi bếp nóng quá tải</span>
                                                </li>
                                                <li>
                                                    <span class="specname">Hẹn giờ:</span>
                                                    <span class="specval">Có hẹn giờ</span>
                                                </li>
                                                <li>
                                                    <span class="specname">Tiện ích khác:</span>
                                                    <span class="specval">Chống thấm nước vào bảng điều khiển</span>
                                                </li>
                                                <li>
                                                    <span class="specname">Kích thước:</span>
                                                    <span class="specval">Ngang 28 cm - Dọc 36 cm - Cao 5 cm</span>
                                                </li>
                                                <li>
                                                    <span class="specname">Khối lượng:</span>
                                                    <span class="specval">Đang cập nhật</span>
                                                </li>
                                                <li>
                                                    <span class="specname">Thương hiệu của:</span>
                                                    <span class="specval">Trung Quốc</span>
                                                </li>
                                                <li>
                                                    <span class="specname">Sản xuất tại:</span>
                                                    <span class="specval">Việt Nam</span>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="tab-pane fade" id="tab1" role="tabpanel">
                                            <div style="line-height: 24px">
                                                <b>1. Đổi trả theo nhu cầu khách hàng (đổi trả hàng vì không ưng ý)</b>
                                                <br>
                                                Tất cả mặt hàng đã mua đều có thể hoàn trả trong vòng 30 ngày kể từ ngày nhận hàng (trừ khi có quy định gì khác). Chúng tôi chỉ chấp nhận đổi trả cho các sản phẩm còn nguyên điều kiện ban đầu, còn hóa đơn mua hàng &amp; sản phẩm chưa qua sử dụng, bao gồm:
                                        <br>
                                                - Còn nguyên đóng gói và bao bì không bị móp rách
                                        <br>
                                                - Đầy đủ các chi tiết, phụ kiện
                                        <br>
                                                - Tem / phiếu bảo hành, tem thương hiệu, hướng dẫn kỹ thuật và các quà tặng kèm theo (nếu có) v.v… phải còn đầy đủ và nguyên vẹn
                                        <br>
                                                - Không bị dơ bẩn, trầy xước, hư hỏng, có mùi lạ hoặc có dấu hiệu đã qua qua sử dụng
                                        <br>
                                                <b>2. Đổi trả không vì lý do chủ quan từ khách hàng</b>
                                                <br>
                                                2.1. Hàng giao không mới, không nguyên vẹn, sai nội dung hoặc bị thiếu
                                        <br>
                                                Chúng tôi khuyến khích quý khách hàng phải kiểm tra tình trạng bên ngoài của thùng hàng và sản phẩm trước khi thanh toán để đảm bảo rằng hàng hóa được giao đúng chủng loại, số lượng, màu sắc theo đơn đặt hàng và tình trạng bên ngoài không bị tác động.
                                        <br>
                                                Nếu gặp trường hợp này, Quý khách vui lòng từ chối nhận hàng và/hoặc báo ngay cho bộ phận hỗ trợ khách hàng để chúng tôi có phương án xử lí kịp thời. (Xin lưu ý những bước kiểm tra sâu hơn như dùng thử sản phẩm chỉ có thể được chấp nhận sau khi đơn hàng được thanh toán đầy đủ).
                                        <br>
                                                Trong trường hợp khách hàng đã thanh toán, nhận hàng và sau đó phát hiện hàng hóa không còn mới nguyên vẹn, sai nội dung hoặc thiếu hàng, xin vui lòng chụp ảnh sản phẩm gửi về hộp thư của chúng tôi để được chúng tôi hỗ trợ các bước tiếp theo như đổi/trả hàng hoặc gửi sản phẩm còn thiếu đến quý khách…
                                        <br>
                                                Sau 48h kể từ ngày quý khách nhận hàng, chúng tôi có quyền từ chối hỗ trợ cho những khiếu nại theo nội dung như trên.
                                        <br>
                                                2.2. Hàng giao bị lỗi
                                        <br>
                                                Khi quý khách gặp trục trặc với sản phẩm đặt mua của chúng tôi, vui lòng thực hiện các bước sau đây:
                                        <br>
                                                - Bước 1: Kiểm tra lại sự nguyên vẹn của sản phẩm, chụp lại ảnh sản phẩm xuất hiện lỗi
                                        <br>
                                                - Bước 2: Quý khách liên hệ với trung tâm chăm sóc khách hàng của chúng tôi để được xác nhận
                                        <br>
                                                - Bước 3: Trong vòng 30 ngày kể từ ngày nhận hàng, nếu quý khách được xác nhận từ trung tâm chăm sóc khách hàng rằng sản phẩm bị lỗi kỹ thuật, quý khách vui lòng truy cập ngay Hướng dẫn đổi trả hàng để bắt đầu quy trình đổi trả hàng
                                        <br>
                                                <b>3. Phương thức hoàn tiền</b>
                                                <br>
                                                Tùy theo lí do hoàn trả sản phẩm kết quả đánh giá chất lượng tại kho, chúng tôi sẽ có những phương thức hoàn tiền với chi tiết như sau:
                                        <br>
                                                - Hoàn tiền bằng mã tiền điện tử dùng để mua sản phẩm mới
                                        <br>
                                                - Đổi sản phẩm mới cùng loại
                                        <br>
                                                - Chuyển khoản qua ngân hàng theo thông tin của quý khách cung cấp
                                        <br>
                                                - Riêng đối với các đơn hàng thanh toán qua thẻ tín dụng quốc tế, chúng tôi sẽ áp dụng hình thức hoàn tiền vào tài khoản thanh toán của chủ thẻ
                                        <br>
                                                - Hoàn tiền mặt trực tiếp tại văn phòng
                                        <br>
                                                Mọi chi tiết hoặc thắc mắc quý khách vui lòng liên hệ với chúng tôi qua số điện thoại hỗ trợ hoặc để lại lời nhắn tại website. Xin chân thành cảm ơn.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <div class="clearfix relatedProdDetailWrapper">
                            <h2 class="titleDecoration fz18">
                                <span class="line"></span>
                                <span class="title">Sản phẩm liên quan</span>
                            </h2>
                            <div class="relatedProdDetail owl-carousel owl-theme" id="relatedProdDetail">
                                <asp:Repeater runat="server" ID="rptRelatedProducts">
                                    <ItemTemplate>
                                        <div class="item">
                                            <div class="productGrid">
                                                <!-- <div class="productSale"><span>-23%</span></div> -->
                                                <!-- <div class="countDown" data-end="kmdn_ngay1_thang12_nam2017">208D : 12H : 38M : 10S</div> -->
                                                <div class="productImg">
                                                    <a href="ProductDetail.aspx?id=<%#Eval("id_product") %>" title="<%#Eval("name") %>">
                                                        <img src="<%#Eval("image_link") %>" data-original="<%#Eval("image_link") %>" class="img-fix" alt="<%#Eval("name") %>" style="display: inline;">
                                                    </a>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="hoverButtons">
                                                        <span data-toggle="modal" data-target="#998"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Cho vào giỏ hàng"><i class="fa fa-shopping-cart"></i></a></span>

                                                        <span data-toggle="modal" data-target="#999"><a class="button quickview-btn" data-toggle="tooltip" data-placement="top" title="" data-countdown="null" data-alias="may-giat-panasonic-10-kg-na-f100a1wrv" data-original-title="Xem nhanh"><i class="fa fa-search"></i></a></span>

                                                        <a href="#" class="button skype" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tư vấn qua Skype"><i class="fa fa-skype"></i></a>
                                                    </div>
                                                </div>
                                                <h3><a href="ProductDetail.aspx?id=<%#Eval("id_product") %>" title="<%#Eval("name") %>"><%#Eval("name") %></a></h3>
                                                <div class="productPrice">
                                                    <del><%# Eval("del_price", "{0:0,0} đ") %></del>
                                                    <span><%# Eval("price", "{0:0,0} đ") %></span>
                                                </div>

                                                <div class="actions clearfix">
                                                    <a href="#" class="button"><i class="hoverButton"></i>Chọn sản phẩm</a>
                                                </div>

                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                    <div class="sidebarBlog">
                        <div class="sidebarBlogGroup">
                            <a href="#policyWrapper" class="dropDownButton" aria-expanded="true" data-toggle="collapse">Chính Sách <i class="fa fa-angle-up"></i></a>
                            <div class="policyWrapper collapse in" id="policyWrapper">
                                <div class="policy">
                                    <i class="ico icoPolicy1"></i>
                                    <h4>Miễn phí vận chuyển </h4>
                                    <p>Dành cho đơn hàng trong nội thành Hà Nội</p>
                                </div>
                                <div class="policy">
                                    <i class="ico icoPolicy2"></i>
                                    <h4>Hỗ trợ 24/7</h4>
                                    <p>Hỗ trợ mọi lúc mọi nơi, hãy gọi ngay cho chúng tôi để được tư vấn</p>
                                </div>
                                <div class="policy">
                                    <i class="ico icoPolicy3"></i>
                                    <h4>Thanh toán khi nhận hàng</h4>
                                    <p>Bạn có thể nhận hàng xong mới trả tiền cho chúng tôi nhằm đảm bảo quyền lợi khách hàng.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End SideBarBlog -->
                    <div class="sidebarBlog">
                        <div class="sidebarBlogGroup">
                            <a href="#complainForm" class="dropDownButton collapsed" data-toggle="collapse">Khiếu nại <i class="fa fa-angle-up"></i></a>
                            <div class="complainForm dropList collapse" id="complainForm">
                                <form action="#" class="AJAXFormContact">
                                    <div class="AJAXFormContactLoading" style="display: none">
                                        <div class="loading-pulse"></div>
                                    </div>
                                    <div class="AJAXFormContactInput">
                                        <input name="FormType" type="hidden" value="contact">
                                        <input name="utf8" type="hidden" value="true">
                                        <input type="text" name="contact[Name]" value="" placeholder="Họ và tên..." class="input-control" required="">
                                        <input type="email" name="contact[email]" required="" value="" placeholder="Email của bạn..." class="input-control">
                                        <input type="tel" name="contact[Phone]" minlength="8" maxlength="11" placeholder="Số điện thoại..." class="input-control" required="">
                                        <textarea name="contact[Body]" placeholder="Nội dung..." class="input-control" required=""></textarea>
                                        <button class="button">Gửi</button>
                                        <i class="complainFormNote AJAXFormContactNote">Hãy điền đầy đủ để chúng tôi có thể giải quyết nhanh nhất.</i>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- End SideBarBlog -->
                    <div class="sidebarBlog">
                        <div class="sidebarBlogGroup">
                            <a href="#teleSalesWraper" class="dropDownButton collapsed" data-toggle="collapse">Hỗ trợ online<i class="fa fa-angle-up"></i></a>
                            <div class="teleSalesWraper collapse" id="teleSalesWraper">
                                <div class="teleSale clearfix">
                                    <a href="#" class="teleSaleSkype"><i class="fa fa-skype"></i></a>
                                    <div class="teleSaleInfo">
                                        <h4 class="teleSaleName">Đoàn Vương</h4>
                                        <a href="tel:0868155456" class="teleSalePhone">0868.155.456</a>
                                    </div>
                                </div>
                                <div class="teleSale clearfix">
                                    <a href="#" class="teleSaleSkype"><i class="fa fa-skype"></i></a>
                                    <div class="teleSaleInfo">
                                        <h4 class="teleSaleName">Đoàn Vương</h4>
                                        <a href="tel:08681554567" class="teleSalePhone">0868.155.4567</a>
                                    </div>
                                </div>
                                <div class="teleSale clearfix">
                                    <a href="#" class="teleSaleSkype"><i class="fa fa-skype"></i></a>
                                    <div class="teleSaleInfo">
                                        <h4 class="teleSaleName">Đoàn Vương</h4>
                                        <a href="tel:086815545678" class="teleSalePhone">0868.155.45678</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End SideBarBlog -->

                </div>
            </div>
        </div>
    </section>
    <!-- End BlogPage -->


</asp:Content>
