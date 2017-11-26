using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

namespace WebBanLinhKien.Admin
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadListProductsToTable();
            }
        }

        private void LoadListProductsToTable()
        {
            ConnectDB db = new ConnectDB();
            DataTable dt = db.getAllProducts();

            StringBuilder html = new StringBuilder();
            foreach (DataRow row in dt.Rows)
            {
                html.Append("<tr>");
                html.Append("<td>" + row["id_product"] + "</td>");
                html.Append("<td>" + row["id_category"] + "</td>");
                html.Append("<td>" + row["name"] + "</td>");
                html.Append("<td>" + row["price"] + "</td>");
                html.Append("<td>" + row["status"] + "</td>");
                html.Append("<td>" + row["promotion"] + "</td>");
                html.Append("<td>" + row["details"] + "</td>");
                html.Append("<td>" + row["description"] + "</td>");
                html.Append("<td>" + row["content"] + "</td>");
                html.Append("<td>");
                html.Append("<a href='Users.aspx?action=edit&id=" + row["ID"] + "' class='btn btn-primary btn-sm'>Sửa</a><span style='margin-left:10px;'></span>");
                html.Append("<a href='Users.aspx?action=delete&id=" + row["ID"] + "' class='btn btn-danger btn-sm'>Xóa</a>");
                html.Append("</td>");
                html.Append("</tr>");
            }

            tableContent.Controls.Add(new Literal { Text = html.ToString() });
        }
    }
}