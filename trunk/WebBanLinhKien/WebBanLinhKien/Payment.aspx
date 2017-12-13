<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="WebBanLinhKien.Payment" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="ProductContent" ID="PaymentContent">
    <div class="container">
        <div class="row">
            <asp:Panel runat="server" ID="pnThanhToan">
                <div class="col-md-7">
                    <div class="content-box-large">
                        <div class="panel-heading">
                            <div class="panel-title" id="pnTitle" runat="server">
                                <h1>Thanh toán</h1>
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
                                <label class="col-sm-2 control-label">Email:</label>
                                <div class="col-sm-8">
                                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" />
                                </div>
                                <div class="col-sm-2">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="err-message" ControlToValidate="txtEmail" runat="server" ErrorMessage="Bạn phải nhập địa chỉ mail" Font-Bold="True" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Họ tên:</label>
                                <div class="col-sm-8">
                                    <asp:TextBox runat="server" ID="txtHoTen" CssClass="form-control" />
                                </div>
                                <div class="col-sm-2">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="err-message" ControlToValidate="txtHoTen" runat="server" ErrorMessage="Chưa có tên sản phẩm !" Font-Bold="True" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Địa chỉ:</label>
                                <div class="col-sm-8">
                                    <asp:TextBox runat="server" ID="txtDiaChi" CssClass="form-control" />
                                </div>
                                <div class="col-sm-2">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="err-message" ControlToValidate="txtDiaChi" runat="server" ErrorMessage="Chưa có giá sản phẩm !" Font-Bold="True" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Số điện thoại:</label>
                                <div class="col-sm-8">
                                    <asp:TextBox runat="server" ID="txtSoDienThoai" CssClass="form-control" TextMode="Number" />
                                </div>
                                <div class="col-sm-2">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="err-message" ControlToValidate="txtSoDienThoai" runat="server" ErrorMessage="Chưa có giá sản phẩm !" Font-Bold="True" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Ghi chú:</label>
                                <div class="col-sm-8">
                                    <asp:TextBox runat="server" ID="txtGhiChu" CssClass="form-control" Rows="5" TextMode="MultiLine" />
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <asp:Button Text="Tiến hành thanh toán" CssClass="btn btn-primary" runat="server" ID="btnThanhToan" OnClick="btnThanhToan_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-5">
                    <h1>Danh sách sản phẩm thanh toán</h1>
                    <br />
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Tên sản phẩm</th>
                                <th>Hình ảnh</th>
                                <th>Thành tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater runat="server" ID="rptSanPham">
                                <ItemTemplate>
                                    <tr>
                                        <td><strong><%# Eval("Name") %> (<%# Eval("Quantity") %>)</strong></td>
                                        <td>
                                            <img src="<%# Eval("Image") %>" alt="<%# Eval("Name") %>" width="90" height="90" /></td>
                                        <td><%# String.Format("{0:0,0} đ",Convert.ToInt32(Eval("Total"))) %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                        </tbody>
                    </table>
                </div>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnTrangThai" Visible="False">
                <asp:Label Text="" ID="lblTrangThai" runat="server" />
            </asp:Panel>
        </div>

    </div>
</asp:Content>
