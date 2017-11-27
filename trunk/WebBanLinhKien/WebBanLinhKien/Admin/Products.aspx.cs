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
            if (Request.QueryString["action"] != null)
            {
                string action = Request.QueryString["action"].ToString();
                if (action == "add")
                {
                    //ShowMessage("OK", "Success");
                    pnAddNew.Visible = true;
                    pnTable.Visible = false;
                    LoadCategories();
                    return;
                }
                else if (action == "delete")
                {
                    int id = Convert.ToInt32(Request.QueryString["id"].ToString());
                    deleteProduct(id);
                }
            }
            LoadListProductsToTable();

        }

        private void LoadCategories()
        {
            ConnectDB db = new ConnectDB();
            DataTable dt = db.getAllCategories();
            foreach (DataRow row in dt.Rows)
            {
                ddlDanhMucSanPham.Items.Add(new ListItem(row["name"].ToString(), row["id_category"].ToString()));
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
                html.Append("<td>" + row["category"] + "</td>");
                html.Append("<td>" + row["name"] + "</td>");
                html.Append("<td>" + row["price"] + "</td>");
                html.Append("<td>" + row["status"] + "</td>");
                html.Append("<td>" + row["tag"] + "</td>");
                html.Append("<td>" + row["promotion"] + "</td>");
                html.Append("<td>" + row["details"] + "</td>");
                html.Append("<td>" + row["description"] + "</td>");
                html.Append("<td>" + row["content"] + "</td>");
                html.Append("<td>");
                html.Append("<a href='Products.aspx?action=edit&id=" + row["id_product"] + "' class='btn btn-primary btn-sm'>Sửa</a><span style='margin-left:10px;'></span>");
                html.Append("<a href='Products.aspx?action=delete&id=" + row["id_product"] + "' class='btn btn-danger btn-sm'>Xóa</a>");
                html.Append("</td>");
                html.Append("</tr>");
            }

            tableContent.Controls.Add(new Literal { Text = html.ToString() });
        }

        private void addNewProduct()
        {
            ConnectDB db = new ConnectDB();
            int id = Convert.ToInt32(ddlDanhMucSanPham.SelectedValue);
            string name = txtTenSp.Text.ToString();
            int price = Convert.ToInt32(txtGiaSp.Text);
            int status = 1;
            if (txtTrangThaiSp.Text != "")
                status = Convert.ToInt32(txtTrangThaiSp.Text);
            string promotion = txtKhuyenMai.Text;
            string tag = txtTags.Text;
            string details = txtChiTietSp.Text;
            string desc = txtMoTaSp.Text;
            string content = txtNoiDungSp.Text;
            bool isSuccess = db.addNewProduct(id, name, price, status, promotion, tag, details, desc, content);
            if (isSuccess)
            {
                showmessage("Thêm sản phẩm thành công");
            }
        }

        private void deleteProduct(int id)
        {
            ConnectDB db = new ConnectDB();
            bool isSuccess = db.deleteProduct(id);
            if (isSuccess)
            {
                lblMessage.Text = "Xóa sản phẩm thành công";
            }
            else
            {
                lblMessage.Text = "Xóa sản phẩm thất bại";
            }
        }

        protected void btnThemSanPham_Click(object sender, EventArgs e)
        {
            addNewProduct();
        }

        private void showmessage(string message)
        {
            pnMessage.Visible = true;
            lblMessage.Text = message;
        }

        protected void btnTest_Click(object sender, EventArgs e)
        {
        }
    }
}