using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace WebBanLinhKien.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        ConnectDB db = new ConnectDB();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dt = db.getAllAdminUsers();
                // Tạo phân trang
            }
            LoadListUsersToTable();
        }

        private void LoadListUsersToTable()
        {
            StringBuilder html = new StringBuilder();
            html.Append("<table class='table table-hover' id='task-table'>");
            html.Append("<thead><tr>");
            foreach (DataColumn item in dt.Columns)
            {
                html.Append("<th>");
                html.Append(item.ColumnName);
                html.Append("</th>");
            }
            html.Append("<th>");
            html.Append("Hành động");
            html.Append("</th></tr></thead>");

            foreach (DataRow row in dt.Rows)
            {
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");
                }
                html.Append("<td>");
                html.Append("<a href='Users.aspx?action=edit&id=" + row["ID"] + "' class='btn btn-primary btn-sm'>Sửa</a><span style='margin-left:10px;'></span>");
                html.Append("<a href='Users.aspx?action=delete&id=" + row["ID"] + "' class='btn btn-danger btn-sm'>Xóa</a>");
                html.Append("</td>");
                html.Append("</tr>");
            }
            html.Append("</table>");

            tableContent.Controls.Add(new Literal { Text = html.ToString() });
        }
    }
}