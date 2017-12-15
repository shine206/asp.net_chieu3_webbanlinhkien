<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="WebBanLinhKien.Admin.Categories" MasterPageFile="~/Admin/Admin.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div class="row">
        <div class="col-md-12">
            <asp:Panel runat="server" ID="pnTable">
                <div class="col-md-8">
                    <div class="table-users">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <strong>Danh sách sản phẩm</strong>
                                <div class="pull-right">
                                    <a href="Categories.aspx?action=add" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span>Thêm danh mục</a>
                                    <%--<asp:LinkButton Text="" runat="server" CssClass="btn btn-success"><span class="glyphicon glyphicon-plus"></span> Thêm danh mục</asp:LinkButton>--%>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="panel-body">
                                <%--<div class="form-group clearfix">
                                <label class="control-label">Nhóm danh mục:</label>
                                <asp:ListBox runat="server" CssClass="form-control" ID="lbNhomDanhMuc" Rows="7">
                                </asp:ListBox>
                            </div>
                            <hr />--%>
                                <table class='table table-hover' id='task-table'>
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Tên danh mục</th>
                                            <th>Danh mục cha</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <asp:PlaceHolder runat="server" ID="tableContent" />
                                </table>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <strong>Nhóm danh mục</strong>
                            <div class="clearfix"></div>
                        </div>
                        <div class="panel-body">
                            <div class="form-group clearfix">
                                <asp:ListBox runat="server" CssClass="form-control" ID="lbNhomDanhMuc" Rows="10" AutoPostBack="true"></asp:ListBox>
                            </div>

                            <div class="form-group clearfix">
                                <asp:Button Text="Sửa" CssClass="btn btn-success" ID="btnSuaNhomDanhMuc" runat="server" OnClick="btnSuaNhomDanhMuc_Click" />
                                <asp:Button Text="Xóa" CssClass="btn btn-danger" ID="btnXoaNhomDanhMuc" runat="server" OnClick="btnXoaNhomDanhMuc_Click" />
                            </div>
                        </div>
                    </div>
                </div>

            </asp:Panel>

            <asp:Panel runat="server" ID="pnAddNew" Visible="False">
                <div class="content-box-large">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <asp:Label Text="Thêm danh mục" ID="lblTieuDe" runat="server" />
                        </div>
                    </div>
                    <div class="panel-body">
                        <asp:Panel runat="server" ID="pnMessage" Visible="False">
                            <div class="alert alert-success" id="myMessage">
                                <strong>Success!</strong>
                                <asp:Label Text="" runat="server" ID="lblMessage" />
                            </div>
                        </asp:Panel>
                        <div class="form-group clearfix">
                            <label class="col-sm-2 control-label">Danh mục cha:</label>
                            <div class="col-sm-8">
                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlDanhMucSanPham" AutoPostBack="true">
                                    <asp:ListItem Text="Danh mục gốc" Value="0" />
                                </asp:DropDownList>
                            </div>

                        </div>
                        <div class="form-group clearfix">
                            <label class="col-sm-2 control-label">Tên danh mục:</label>
                            <div class="col-sm-8">
                                <asp:TextBox runat="server" ID="txtTenDanhMuc" CssClass="form-control"/>
                            </div>
                            <div class="col-sm-2">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="err-message" ControlToValidate="txtTenDanhMuc" runat="server" ErrorMessage="Chưa có tên danh mục !" Font-Bold="True" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group clearfix">
                            <div class="col-sm-offset-2 col-sm-10">
                                <asp:Button Text="Thêm danh mục mới" runat="server" CssClass="btn btn-success" ID="btnThemDanhMuc" OnClick="btnThemDanhMuc_Click" />
                                <asp:Button Text="Cập nhật danh mục mới" runat="server" CssClass="btn btn-success" ID="btnCapNhatDanhMuc" OnClick="btnCapNhatDanhMuc_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
