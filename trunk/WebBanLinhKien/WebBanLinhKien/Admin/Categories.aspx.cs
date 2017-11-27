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
            if (Request.QueryString["action"] != null)
            {
                string action = Request.QueryString["action"].ToString();
                if (action == "add")
                {
                    pnAddNew.Visible = true;
                    pnTable.Visible = false;
                    LoadCategories();
                    return;
                }
                else if (action == "delete")
                {
                    int id = Convert.ToInt32(Request.QueryString["id"].ToString());
                    deleteCategory(id);
                }
            }
            LoadListCateegoriesToTable();
        }

        private void addNewCategory()
        {
            ConnectDB db = new ConnectDB();
            int id = Convert.ToInt32(ddlDanhMucSanPham.SelectedItem.Value);
            //Response.Write();
            string name = txtTenDanhMuc.Text.ToString();
            bool isSuccess = db.addNewCategory(id, name);
            if (isSuccess)
            {
                showmessage("Thêm sản phẩm thành công");
            }
            else
            {
                showmessage("Thất bại");
            }
        }

        private void deleteCategory(int id)
        {
            ConnectDB db = new ConnectDB();
            bool isSuccess = db.deleteCategory(id);
            if (isSuccess)
            {
                lblMessage.Text = "Xóa sản phẩm thành công";
            }
            else
            {
                lblMessage.Text = "Xóa sản phẩm thất bại";
            }
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

            ConnectDB db1 = new ConnectDB();
            DataTable dt1 = db1.getAllGroupCategories();
            lbNhomDanhMuc.Items.Clear();
            foreach (DataRow row in dt1.Rows)
            {
                lbNhomDanhMuc.Items.Add(new ListItem(row["name"].ToString(), row["id_group_category"].ToString()));
            }
        }

        private void LoadCategories()
        {
            ConnectDB db = new ConnectDB();
            DataTable dt = db.getAllGroupCategories();
            ddlDanhMucSanPham.Items.Clear();
            ddlDanhMucSanPham.Items.Add(new ListItem("Danh mục gốc", "0"));
            foreach (DataRow row in dt.Rows)
            {
                ddlDanhMucSanPham.Items.Add(new ListItem(row["name"].ToString(), row["id_group_category"].ToString()));
            }
        }

        private void showmessage(string message)
        {
            pnMessage.Visible = true;
            lblMessage.Text = message;
        }

        protected void btnThemDanhMuc_Click(object sender, EventArgs e)
        {
            addNewCategory();
        }

    }
}