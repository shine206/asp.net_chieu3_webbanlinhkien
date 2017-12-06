<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="WebBanLinhKien.Search" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="ProductContent">
    <div class="breadcrumb">
        <div class="container">
            <ol class="list-unstyled list-inline">
                <li>
                    <a href="Home.aspx" itemprop="item"><i class="fa fa-home"></i><span>Trang chủ</span></a>
                </li>
                <li><span class="divide"><i class="fa fa-angle-right"></i></span></li>
                <li>
                    <span class="current" itemprop="item"><b>Tất Cả Sản Phẩm</b></span>
                </li>
            </ol>
        </div>
    </div>
    <!-- End Breadcrumb -->
    <section class="blogPage">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 col-md-push-3 col-lg-push-3">
                    <div class="topImgCollection">
                        <h1 class="titleCollection">Tất cả sản phẩm</h1>
                        <img src="Content/images/bg_collection.jpg" class="img-responsive" alt="Tất cả sản phẩm">
                        <div class="bg"></div>
                    </div>
                    <asp:Panel runat="server" ID="pnControl">
                        <div class="toolsCollection clearfix">
                            <div class="boxSelect">
                                <label for="">Sắp xếp</label>
                                <span class="boxSelectDown"><i class="fa fa-angle-down"></i></span>
                                <asp:DropDownList runat="server" ID="ddlSapXep">
                                    <asp:ListItem Text="Mặc định" Value="default" />
                                    <asp:ListItem Text="A → Z" Value="alpha-asc" />
                                    <asp:ListItem Text="Z → A" Value="alpha-desc" />
                                    <asp:ListItem Text="Giá tăng dần" Value="price-asc" />
                                    <asp:ListItem Text="Giá giảm dần" Value="price-desc" />
                                    <asp:ListItem Text="Hàng mới nhất" Value="created-desc" />
                                    <asp:ListItem Text="Hàng cũ nhất" Value="created-asc" />
                                </asp:DropDownList>
                                <%--<select name="sortBy" id="sortBy">
                                    <option value="default" selected="selected">Mặc định</option>
                                    <option value="alpha-asc">A → Z</option>
                                    <option value="alpha-desc">Z → A</option>
                                    <option value="price-asc">Giá tăng dần</option>
                                    <option value="price-desc">Giá giảm dần</option>
                                    <option value="created-desc">Hàng mới nhất</option>
                                    <option value="created-asc">Hàng cũ nhất</option>
                                </select>--%>
                            </div>

                            <asp:LinkButton ID="btnViewList" runat="server" class="switchView viewCollection" OnClick="btnViewList_Click" data-view="list" data-toggle="tooltip" title="" data-original-title="Xem dạng danh sách"><i class="fa fa-th-list"></i></asp:LinkButton>
                            <asp:LinkButton ID="btnViewGird" runat="server" class="switchView active viewCollection" OnClick="btnViewGrid_Click" data-view="grid" data-toggle="tooltip" title="" data-original-title="Xem dạng lưới"><i class="fa fa-th"></i></asp:LinkButton>
                        </div>
                    </asp:Panel>
                    <div class="collectionDisplay">
                        <div class="collectionResultProducts" id="sp-1">
                            <asp:PlaceHolder runat="server" ID="grdContent" />

                        </div>
                        <div class="pager clearfix">
                            <asp:Repeater runat="server" ID="rptPhanTrang">
                                <ItemTemplate>
                                    <a href="#" class="current" data-page="2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Trang 2">2</a>
                                </ItemTemplate>
                            </asp:Repeater>
                            <%--<span class="current" data-toggle="tooltip" data-placement="top" title="" data-original-title="Trang 1">1</span>
                            <a href="#" data-page="2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Trang 2">2</a>
                            <a href="#" data-page="3" data-toggle="tooltip" data-placement="top" title="" data-original-title="Trang 3">3</a>
                            <a href="#" data-page="2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Trang kế tiếp"><i class="fa fa-angle-right"></i></a>--%>
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
                        </div>
                        <!-- End FilterCheckbox -->

                        <div class="filtersTool filterRange">
                            <h2 class="titleDecoration">
                                <span class="line"></span>
                                <span class="title">Lọc theo giá</span>
                            </h2>
                            <div class="filterToolGroup">
                                <asp:DropDownList ID="drlFilterPrice" CssClass="filterDRLPrice" runat="server">
                                    <asp:ListItem Text="Dưới 500.000" />
                                    <asp:ListItem Text="Từ 500.000 đến 1.000.000" />
                                    <asp:ListItem Text="Từ 1.000.000 đến 3.000.000" />
                                    <asp:ListItem Text="Trên 3.000.000" />
                                </asp:DropDownList>
                                <asp:LinkButton ID="btnFilter" CssClass="button" runat="server" Text="Lọc" OnClick="btnFilter_Click"><i class="hoverButton"></i>Lọc</asp:LinkButton>
                            </div>
                        </div>
                        <!-- EndFilterRange -->


                    </div>
                    <!-- End Filter Container -->
                    <div class="listProductsWrapper">
                        <h2 class="titleDecoration"><span class="line"></span><span class="title">Sản phẩm khuyến mại</span></h2>
                        <ul class="list-unstyled listProducts">
                            <asp:Repeater runat="server" ID="rptSanPhamKhuyenMai">
                                <ItemTemplate>
                                    <li class="clearfix">
                                        <img src="<%#Eval("link_image") %>" class="listsProductsImg" alt="<%#Eval("name") %>">

                                        <div class="listsProductsInfo">
                                            <h3><a href="#"><%#Eval("name") %></a></h3>
                                            <div class="listsProductsPrice">
                                                <span><%# Eval("price", "{0:0,0} đ") %></span>
                                                <del><%# Eval("sel_price", "{0:0,0} đ") %></del>
                                            </div>
                                        </div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>

                        </ul>
                    </div>
                    <!-- End ListProductsWrapper -->
                    <!-- End SidebarBlogDefault -->
                    <div class="sidebarPorductGroup">
                        <a href="#">
                            <img src="Content/images/banner_blog_page.jpg" class="img-responsive lazy" alt="Galaxy S6">
                        </a>
                    </div>
                    <!-- End SidebarPorductGroup -->
                </div>
            </div>
        </div>
    </section>
    <!-- End BlogPage -->
</asp:Content>
