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
                    btnCapNhatDanhMuc.Visible = false;
                    btnThemDanhMuc.Visible = true;
                    if (!IsPostBack)
                        LoadCategories();

                    return;
                }
                else if (action == "delete")
                {
                    int id = Convert.ToInt32(Request.QueryString["id"].ToString());
                    deleteCategory(id);
                }
                else if (action == "edit")
                {
                    if (Request.QueryString["id"] != null && Request.QueryString["pID"] != null && !IsPostBack)
                    {
                        string id = Request.QueryString["id"].ToString();
                        string pID = Request.QueryString["pID"].ToString();
                        pnAddNew.Visible = true;
                        pnTable.Visible = false;
                        if (!IsPostBack)
                            LoadCategories();
                        ddlDanhMucSanPham.ClearSelection();
                        ddlDanhMucSanPham.Items.FindByValue(pID).Selected = true;
                        btnCapNhatDanhMuc.Visible = true;
                        btnThemDanhMuc.Visible = false;
                        DataTable dtDanhMuc = (new ConnectDB()).getCategoryById(Convert.ToInt32(id));
                        txtTenDanhMuc.Text = dtDanhMuc.Rows[0]["name"].ToString();
                        lblTieuDe.Text = "Cập nhật danh mục (ID: " + id + ")";
                        return;
                    }
                }
            }
            LoadListCateegoriesToTable();
        }

        private void addNewCategory()
        {
            ConnectDB db = new ConnectDB();
            int id = Convert.ToInt32(ddlDanhMucSanPham.SelectedItem.Value);
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
                html.Append("<a href='Categories.aspx?action=edit&id=" + row["id_category"] + "&pID=" + row["id_group"] + "' class='btn btn-primary btn-sm'>Sửa</a><span style='margin-left:10px;'></span>");
                html.Append("<a href='Categories.aspx?action=delete&id=" + row["id_category"] + "' class='btn btn-danger btn-sm'>Xóa</a>");
                html.Append("</td>");
                html.Append("</tr>");
            }

            tableContent.Controls.Add(new Literal { Text = html.ToString() });


            if (!IsPostBack)
            {
                ConnectDB db1 = new ConnectDB();
                DataTable dt1 = db1.getAllGroupCategories();
                lbNhomDanhMuc.Items.Clear();
                foreach (DataRow row in dt1.Rows)
                {
                    lbNhomDanhMuc.Items.Add(new ListItem(row["name"].ToString(), row["id_group_category"].ToString()));
                }
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

        protected void btnXoaNhomDanhMuc_Click(object sender, EventArgs e)
        {
            foreach (ListItem li in lbNhomDanhMuc.Items)
            {
                if (li.Selected == true)
                {
                    bool isSuccess = (new ConnectDB()).deleteCategory(Convert.ToInt32(li.Value), 0);
                    Response.Redirect("Categories.aspx");
                    break;
                }
            }
        }

        protected void btnSuaNhomDanhMuc_Click(object sender, EventArgs e)
        {
            foreach (ListItem li in lbNhomDanhMuc.Items)
            {
                if (li.Selected == true)
                {
                    Response.Redirect("Categories.aspx?action=edit&id=" + li.Value);
                    break;
                }
            }
        }

        protected void btnCapNhatDanhMuc_Click(object sender, EventArgs e)
        {
            int id_cat = Convert.ToInt32(Request.QueryString["id"]);
            int id_group = Convert.ToInt32(ddlDanhMucSanPham.SelectedValue);
            string name = txtTenDanhMuc.Text;
            bool isSuccess = (new ConnectDB()).updateCategory(id_cat, id_group, name);
            if (isSuccess)
            {
                pnMessage.Visible = true;
                lblMessage.Text = "Cập nhật danh mục thành công";
            }
        }

    }
}