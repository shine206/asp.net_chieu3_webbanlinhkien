<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="WebBanLinhKien.Admin.Orders" MasterPageFile="~/Admin/Admin.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div class="row">
        <div class="col-md-6">
            <div class="table-users">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <strong>Danh sách đơn đặt hàng (<asp:Label Text="0" ID="lblCountOrder" runat="server" />)</strong>
                        <%--        <div class="pull-right">
                        <a href="Users.aspx?action=add" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span> Thêm thành viên</a>
                            
                        </div>--%>
                        <div class="clearfix"></div>
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>#STT</th>
                                    <th>Mã đơn hàng</th>
                                    <th>Số lượng sản phẩm</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater runat="server" ID="rptOrders">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("stt") %></td>
                                            <td><a href="Orders.aspx?action=detail&id=<%# Eval("id_order") %>">DHSM_<%# Eval("id_order") %></a></td>
                                            <td><%# Eval("count_order") %></td>
                                            <td>
                                                <a href="Orders.aspx?action=delete&id=<%# Eval("id_order") %>" style="margin: 0 5px;" class="btn btn-danger">Xóa</a>
                                                <a href="Orders.aspx?action=confirm&id=<%# Eval("id_order") %>" style="margin: 0 5px;" class="btn btn-success">Duyệt</a>
                                                <a href="Orders.aspx?action=detail&id=<%# Eval("id_order") %>" style="margin: 0 5px;" class="btn btn-primary">Chi tiết</a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>

        <asp:Panel runat="server" ID="pnDetail" Visible="False">
            <div class="col-md-6">
                <div class="table-users">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <strong>Chi tiết đơn hàng (<asp:Label Text="0" ID="lblDetailOrder" runat="server" />)</strong>
                            <div class="clearfix"></div>
                        </div>
                        <div class="panel-body">
                            <table class="table table-striped">
                                <tbody>
                                    <asp:Repeater runat="server" ID="rptDetail" OnItemDataBound="rptDetail_ItemDataBound">
                                        <ItemTemplate>
                                            <tr>
                                                <td>Mã đơn hàng</td>
                                                <td>DHSM_<%# Eval("id_order") %></td>
                                            </tr>
                                            <tr>
                                                <td>Họ tên khách hàng</td>
                                                <td><%# Eval("fullname_customer") %></td>
                                            </tr>
                                            <tr>
                                                <td>Địa chỉ email khách hàng</td>
                                                <td><%# Eval("email_customer") %></td>
                                            </tr>
                                            <tr>
                                                <td>Số điện thoại</td>
                                                <td><%# Eval("phone_customer") %></td>
                                            </tr>
                                            <tr>
                                                <td>Địa chỉ nhận hàng</td>
                                                <td><%# Eval("address_customer") %></td>
                                            </tr>
                                            <tr>
                                                <td>Ngày đặt hàng</td>
                                                <td><%# Eval("created_at") %></td>
                                            </tr>

                                            <tr>
                                                <td>Sản phẩm</td>
                                                <td>
                                                    <table class="table table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th>Tên sản phẩm</th>
                                                                <th>Số lượng</th>
                                                                <th>Thành tiền</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:PlaceHolder runat="server" ID="productsContent" />
                                                            
                                                        </tbody>
                                                    </table>
                                                    
                                                </td>

                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </asp:Panel>

    </div>
</asp:Content>
