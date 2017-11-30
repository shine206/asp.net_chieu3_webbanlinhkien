using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.IO;

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
                    pnAddNew.Visible = true;
                    pnTable.Visible = false;
                    LoadCategories();
                    return;
                }
                else if (action == "delete")
                {
                    int id = Convert.ToInt32(Request.QueryString["id"].ToString());
                    deleteProduct(id);
                    Response.Redirect("Products.aspx");
                }
            }
            LoadListProductsToTable();

        }

        private void LoadCategories()
        {
            ConnectDB db = new ConnectDB();
            DataTable dt = db.getAllCategories();
            ddlDanhMucSanPham.Items.Clear();
            foreach (DataRow row in dt.Rows)
            {
                ddlDanhMucSanPham.Items.Add(new ListItem(row["category"].ToString(), row["id_category"].ToString()));
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
                html.Append("<td>" + row["name"] + "</td><td>");
                DataTable dtImages = getImagesByIdProduct(Convert.ToInt32(row["id_product"]));
                foreach (DataRow image in dtImages.Rows)
                {
                    html.Append("<img src='/" + image["link_image"].ToString().Replace("\\", "/") + "' alt='" + row["name"] + "' width='70' height='70' />");
                }
                html.Append("</td><td>" + row["price"] + "</td>");
                html.Append("<td>" + row["status"] + "</td>");
                html.Append("<td>" + row["tag"] + "</td>");
                html.Append("<td>" + row["promotion"] + "</td>");
                html.Append("<td>" + row["details"] + "</td>");
                html.Append("<td>" + row["description"] + "</td>");
                html.Append("<td>" + row["content"] + "</td>");
                html.Append("<td>");
                html.Append("<a href='Products.aspx?action=edit&id=" + row["id_product"] + "' class='btn btn-primary btn-sm'>Sửa</a><span style='margin-left:10px;'></span>");
                html.Append("<br><a href='Products.aspx?action=delete&id=" + row["id_product"] + "' class='btn btn-danger btn-sm'>Xóa</a>");
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
            string images = "";
            foreach (HttpPostedFile file in FileUpload1.PostedFiles)
            {
                //System.IO.File.Copy(Server.MapPath(file.FileName), Server.MapPath("/Content/" + file.FileName));
                string fileName = Path.GetFileNameWithoutExtension(file.FileName) + "_" + GetTimestamp(DateTime.Now) + Path.GetExtension(file.FileName);
                string saveLocation = Server.MapPath("\\Content\\images\\" + fileName);
                file.SaveAs(saveLocation);
                images += "Content\\images\\" + fileName + ";";
            }
            Response.Write(images);
            bool isSuccess = db.addNewProduct(id, name, price, status, promotion, tag, details, desc, content);
            string[] arrayImages = images.Split(new char[] { ';' });
            foreach (string image in arrayImages)
            {
                if (!string.IsNullOrWhiteSpace(image) && string.IsNullOrEmpty(image))
                {
                    ConnectDB dbUpload = new ConnectDB();
                    dbUpload.uploadImages(image);
                }
            }

            if (isSuccess)
            {
                showmessage("Thêm sản phẩm thành công");
            }
        }

        private static String GetTimestamp(DateTime value)
        {
            return value.ToString("yyyyMMddHHmmssffff");
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

        private DataTable getImagesByIdProduct(int id_product)
        {
            ConnectDB db = new ConnectDB();
            return db.getImagesByIdProduct(id_product);
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
    }
}