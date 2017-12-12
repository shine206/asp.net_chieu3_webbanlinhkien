using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.IO;
using System.Globalization;

namespace WebBanLinhKien.Admin
{
    public partial class Products : System.Web.UI.Page
    {
        private int IdSelectedDanhMuc;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["action"] != null)
            {
                string action = Request.QueryString["action"].ToString();
                if (action == "add")
                {
                    pnAddNew.Visible = true;
                    pnAllImages.Visible = false;
                    pnTable.Visible = false;
                    if (!IsPostBack)
                    {
                        btnCapNhatSanPham.Visible = false;
                        btnThemSanPham.Visible = true;
                        pnTitle.InnerText = "Thêm sản phẩm mới";
                        LoadCategories();
                    }
                    return;
                }
                else if (action == "delete")
                {
                    if (Request.QueryString["id"] != null)
                    {
                        int id = Convert.ToInt32(Request.QueryString["id"].ToString());
                        deleteProduct(id);
                        Response.Redirect("Products.aspx");
                    }
                }
                else if (action == "edit")
                {
                    if (Request.QueryString["id"] != null)
                    {
                        pnAddNew.Visible = true;
                        pnAllImages.Visible = true;
                        pnTable.Visible = false;
                        if (!IsPostBack)
                        {
                            int id = Convert.ToInt32(Request.QueryString["id"].ToString());
                            loadUpdateProduct(id);
                            btnCapNhatSanPham.Visible = true;
                            btnThemSanPham.Visible = false;
                            pnTitle.InnerText = "Cập nhật sản phẩm (ID: "+ id.ToString() +")";
                        }
                        return;
                    }
                }
                else if (action == "delete_image")
                {
                    if (Request.QueryString["id"] != null)
                    {
                        int id = Convert.ToInt32(Request.QueryString["id"].ToString());
                        bool isDeleted = (new ConnectDB()).deleteImageById(id);
                        string referer = Request.UrlReferrer.ToString();
                        //Response.Redirect(referer);
                        //Response.Write(referer);
                    }
                }
            }
            LoadListProductsToTable();

        }

        private void LoadCategories()
        {
            ConnectDB db = new ConnectDB();
            DataTable dt = db.getAllCategories();
            ddlDanhMucSanPham.Items.Clear();
            if (dt.Rows.Count > 0) IdSelectedDanhMuc = Convert.ToInt32(dt.Rows[0]["id_category"]);
            foreach (DataRow row in dt.Rows)
            {
                ddlDanhMucSanPham.Items.Add(new ListItem(row["category"].ToString(), row["id_category"].ToString()));
            }
        }

        private void loadUpdateProduct(int id_product)
        {
            ConnectDB db = new ConnectDB();
            DataTable dt = db.getProductById(id_product);
            if (dt.Rows.Count > 0)
            {
                if (!IsPostBack)
                    LoadCategories();
                ddlDanhMucSanPham.ClearSelection();
                ddlDanhMucSanPham.Items.FindByValue(dt.Rows[0]["id_category"].ToString()).Selected = true;
                txtTenSp.Text = dt.Rows[0]["name"].ToString();
                txtGiaSp.Text = dt.Rows[0]["price"].ToString();
                txtTrangThaiSp.Text = dt.Rows[0]["status"].ToString();
                txtTags.Text = dt.Rows[0]["tag"].ToString();
                txtKhuyenMai.Text = dt.Rows[0]["promotion"].ToString();
                txtChiTietSp.Text = dt.Rows[0]["details"].ToString();
                txtMoTaSp.Text = dt.Rows[0]["description"].ToString();
                txtNoiDungSp.Text = dt.Rows[0]["content"].ToString();
            }
            DataTable dtImages = (new ConnectDB()).getImagesByIdProduct(id_product);
            rptImageContent.DataSource = dtImages;
            rptImageContent.DataBind();
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
                CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"
                string tien = double.Parse(row["price"].ToString()).ToString("#,### VNĐ", cul.NumberFormat);
                html.Append("</td><td>" + tien + "</td>");
                html.Append("<td>" + row["status"] + "</td>");
                html.Append("<td>" + row["tag"] + "</td>");
                html.Append("<td>" + row["promotion"] + "</td>");
                html.Append("<td>" + row["description"] + "</td>");
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
                string fileName = Path.GetFileNameWithoutExtension(file.FileName) + "_" + GetTimestamp(DateTime.Now) + Path.GetExtension(file.FileName);
                string saveLocation = Server.MapPath("\\Content\\images\\" + fileName);
                file.SaveAs(saveLocation);
                images += "Content\\images\\" + fileName + ";";
            }

            bool isSuccess = db.addNewProduct(id, name, price, status, promotion, tag, details, desc, content);
            string[] arrayImages = images.Split(new char[] { ';' });

            foreach (string image in arrayImages)
            {
                if (!string.IsNullOrWhiteSpace(image) && !string.IsNullOrEmpty(image))
                {
                    ConnectDB dbUpload = new ConnectDB();
                    dbUpload.uploadImages(image);
                    //Response.Write("Updated " + image + "\r\n");
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

        protected void ddlDanhMucSanPham_SelectedIndexChanged(object sender, EventArgs e)
        {
            IdSelectedDanhMuc = Convert.ToInt32(ddlDanhMucSanPham.SelectedValue);
            Response.Write(IdSelectedDanhMuc.ToString());
        }

        protected void btnCapNhatSanPham_Click(object sender, EventArgs e)
        {
            ConnectDB db = new ConnectDB();
            int id_product = Convert.ToInt32(Request.QueryString["id"]);
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
            //string images = "";
            bool isSuccess = db.updateProduct(id_product, id, name, price, status, promotion, tag, details, desc, content);

            foreach (HttpPostedFile file in FileUpload1.PostedFiles)
            {
                if (Path.GetFileNameWithoutExtension(file.FileName) != "")
                {
                    string fileName = Path.GetFileNameWithoutExtension(file.FileName) + "_" + GetTimestamp(DateTime.Now) + Path.GetExtension(file.FileName);
                    string saveLocation = Server.MapPath("\\Content\\images\\" + fileName);
                    file.SaveAs(saveLocation);
                    //images += "Content\\images\\" + fileName + ";";
                    ConnectDB dbUpload = new ConnectDB();
                    dbUpload.uploadImages("Content\\images\\" + fileName, id_product);
                    Response.Write("Updated " + "Content\\images\\" + fileName + "\r\n");
                }
            }

            if (isSuccess)
            {
                showmessage("Cập nhật sản phẩm thành công");
            }
        }
    }
}