<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="WebBanLinhKien.Admin.Categories" MasterPageFile="~/Admin/Admin.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div class="row">
        <div class="col-md-12">
            <div class="table-users">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <strong>Danh sách sản phẩm</strong>
                        <div class="pull-right">
                            <%--<a href="Users.aspx?action=add" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span>Thêm thành viên</a>--%>
                            <asp:LinkButton Text="" runat="server" CssClass="btn btn-success" OnClick="Unnamed2_Click" ><span class="glyphicon glyphicon-plus"></span> Thêm danh mục</asp:LinkButton>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="panel-body">
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
    </div>
</asp:Content>
