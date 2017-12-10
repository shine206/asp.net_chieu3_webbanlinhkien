<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="WebBanLinhKien.Admin.Products" MasterPageFile="~/Admin/Admin.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div class="products">
        <div class="row">
            <div class="col-md-12">
                <asp:Panel runat="server" ID="pnTable">
                    <div class="table-users">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <strong>Danh sách sản phẩm</strong>
                                <div class="pull-right">
                                    <%-- href="Products.aspx?action=add"--%>
                                    <a href="Products.aspx?action=add" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span>Thêm sản phẩm</a>
                                </div>
                                <div class="clearfix"></div>
                            </div>

                            <div class="panel-body">
                                <table class='table table-hover' id='task-table'>
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Danh mục</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Hình ảnh</th>
                                            <th>Giá</th>
                                            <th>Trạng thái</th>
                                            <th>Tags</th>
                                            <th>Khuyến mãi</th>
                                            <th>Mô tả</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <asp:PlaceHolder runat="server" ID="tableContent" />
                                </table>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel runat="server" ID="pnAddNew" Visible="False">
                    <div class="content-box-large">
                        <div class="panel-heading">
                            <div class="panel-title" id="pnTitle" runat="server">Thêm sản phẩm mới</div>
                        </div>
                        <div class="panel-body">
                            <asp:Panel runat="server" ID="pnMessage" Visible="False">
                                <div class="alert alert-success" id="myMessage">
                                    <strong>Success!</strong>
                                    <asp:Label Text="" runat="server" ID="lblMessage" />
                                </div>
                            </asp:Panel>
                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Danh mục sản phẩm:</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlDanhMucSanPham" OnSelectedIndexChanged="ddlDanhMucSanPham_SelectedIndexChanged" AutoPostBack="true">
                                        <%--<asp:ListItem Text="Danh mục gốc" Value="root" />--%>
                                    </asp:DropDownList>
                                </div>

                            </div>
                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Tên sản phẩm:</label>
                                <div class="col-sm-8">
                                    <asp:TextBox runat="server" ID="txtTenSp" CssClass="form-control" />
                                </div>
                                <div class="col-sm-2">
                                    <asp:RequiredFieldValidator CssClass="err-message" ControlToValidate="txtTenSp" runat="server" ErrorMessage="Chưa có tên sản phẩm !" Font-Bold="True" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Giá sản phẩm:</label>
                                <div class="col-sm-8">
                                    <asp:TextBox runat="server" ID="txtGiaSp" CssClass="form-control" TextMode="Number" />
                                </div>
                                <div class="col-sm-2">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="err-message" ControlToValidate="txtGiaSp" runat="server" ErrorMessage="Chưa có giá sản phẩm !" Font-Bold="True" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Trạng thái:</label>
                                <div class="col-sm-8">
                                    <asp:TextBox runat="server" ID="txtTrangThaiSp" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Tags:</label>
                                <div class="col-sm-8">
                                    <asp:TextBox runat="server" ID="txtTags" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Khuyến mãi:</label>
                                <div class="col-sm-8">
                                    <asp:TextBox runat="server" ID="txtKhuyenMai" CssClass="form-control" />
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Chi tiết sản phẩm:</label>
                                <div class="col-sm-8">
                                    <asp:TextBox runat="server" ID="txtChiTietSp" TextMode="MultiLine" CssClass="form-control" />
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Mô tả sản phẩm:</label>
                                <div class="col-sm-8">
                                    <asp:TextBox runat="server" ID="txtMoTaSp" TextMode="MultiLine" CssClass="form-control" />
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Nội dung sản phẩm:</label>
                                <div class="col-sm-8">
                                    <asp:TextBox runat="server" ID="txtNoiDungSp" TextMode="MultiLine" CssClass="form-control" />
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Hình ảnh:</label>
                                <div class="col-sm-4">
                                    <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" ValidateRequestMode="Inherit" />
                                </div>
                                <div class="col-sm-8" style="margin-top: 20px;">
                                </div>

                            </div>

                            <%--<div class="form-group clearfix">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <asp:CheckBox Text="Tiếp tục thêm sản phẩm" runat="server" />
                                </div>
                            </div>--%>
                            <div class="form-group clearfix">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <asp:Button Text="Cập nhật sản phẩm" runat="server" CssClass="btn btn-success" ID="btnCapNhatSanPham" OnClick="btnCapNhatSanPham_Click"/>
                                    <asp:Button Text="Thêm sản phẩm mới" runat="server" CssClass="btn btn-success" ID="btnThemSanPham" OnClick="btnThemSanPham_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel runat="server" ID="pnAllImages" Visible="False">
                    <div class="content-box-large">
                        <div class="panel-heading">
                            <div class="panel-title" id="Div1" runat="server">Hình ảnh sản phẩm</div>
                        </div>
                        <div class="panel-body">

                            <div class="images_group">
                                <asp:Repeater runat="server" ID="rptImageContent">
                                    <ItemTemplate>
                                        <div class="image_box" style="margin: 0 5px; display: inline-block; position: relative;">
                                            <img src="/<%#Eval("link_image") %>" width="140" height="140" />
                                            <a class="btn btn-danger" href="Products.aspx?action=delete_image&id=<%#Eval("id_image") %>" style="top: 0px; right: 0px; position: absolute;"><span class="glyphicon glyphicon-remove"></span></a>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
