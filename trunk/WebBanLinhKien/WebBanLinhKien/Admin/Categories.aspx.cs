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
    public partial class Categories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadListCateegoriesToTable();
        }

        private void LoadListCateegoriesToTable()
        {
            ConnectDB db = new ConnectDB();
            DataTable dt = db.getAllCategories();

            StringBuilder html = new StringBuilder();
            foreach (DataRow row in dt.Rows)
            {
                html.Append("<tr>");
                html.Append("<td>" + row["id_category"] + "</td>");
                html.Append("<td>" + row["category"] + "</td>");
                html.Append("<td>" + row["group_category"] + "</td>");
                html.Append("<td>");
                html.Append("<a href='Categories.aspx?action=edit&id=" + row["id_category"] + "' class='btn btn-primary btn-sm'>Sửa</a><span style='margin-left:10px;'></span>");
                html.Append("<a href='Categories.aspx?action=delete&id=" + row["id_category"] + "' class='btn btn-danger btn-sm'>Xóa</a>");
                html.Append("</td>");
                html.Append("</tr>");
            }

            tableContent.Controls.Add(new Literal { Text = html.ToString() });
        }

    }
}