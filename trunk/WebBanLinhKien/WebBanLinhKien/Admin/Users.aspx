<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="WebBanLinhKien.Admin.Users" MasterPageFile="~/Admin/Admin.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div class="row">
        <div class="col-md-12">
            <div class="table-users">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <strong>Danh sách thành viên</strong>
                        <div class="pull-right">
                        <a href="Users.aspx?action=add" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span> Thêm thành viên</a>
                            
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <%--<div class="col-md-3">
                                <div class="input-group">
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Number" Text="10" />
                                    <span class="input-group-addon">dòng cho mỗi trang</span>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="input-group">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" />
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary" id="btnSearch">Tìm kiếm</button>
                                    </span>

                                </div>
                            </div>

                            <div class="col-md-3">
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Sắp xếp theo tên" />
                                    <asp:ListItem Text="Sắp xếp theo ID" />
                                </asp:DropDownList>

                            </div>--%>

                            <div class="col-md-3">
                                
                            </div>
                        </div>
                        <br />
                        <asp:PlaceHolder runat="server" ID="tableContent" />
                        
                        <%--<table class="table table-hover" id="task-table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Tên đăng nhập</th>
                                    <th>Họ và Tên</th>
                                    <th>Email</th>
                                    <th>Địa chỉ</th>
                                    <th>SĐT</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>Site Wireframes</td>
                                    <td>John Smith</td>
                                    <td>in progress</td>
                                    <td>in progress</td>
                                    <td>in progress</td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>--%>
                        <%--<div class="row">
                            <div class="col-md-6 pull-left">
                                <ul class="pagination pull-left" style="margin:0;">
                                    <li><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                </ul>
                            </div>
                        </div>--%>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
