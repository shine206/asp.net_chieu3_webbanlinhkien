<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="WebBanLinhKien.Admin.Categories" MasterPageFile="~/Admin/Admin.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div class="row">
        <div class="col-md-12">
            <div class="table-users">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <strong>Danh sách sản phẩm</strong>
                        <div class="pull-right">
                            <a href="Users.aspx?action=add" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span>Thêm thành viên</a>

                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="panel-body">
                        <table class='table table-hover' id='task-table'>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên danh mục</th>
                                    <th>Tên sản phẩm</th>
                                </tr>
                            </thead>
                            <asp:PlaceHolder runat="server" ID="tableContent" />
                        </table>
                        
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
