using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Globalization;
using System.Text.RegularExpressions;

namespace WebBanLinhKien
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string viewType = "1";

            if (Request.QueryString["view"] != null)
            {
                viewType = Request.QueryString["view"].ToString();
            }

            if (Request.QueryString["action"] != null)
            {
                string action = Request.QueryString["action"].ToString();
                if (action == "search")
                {
                    string type = Request.QueryString["type"].ToString();
                    if (type == "name")
                    {
                        string q = Request.QueryString["q"].ToString();
                        LoadItemsSearch(q, viewType);
                    }
                    else if (type == "price")
                    {
                        int min = Convert.ToInt32(Request.QueryString["min"].ToString());
                        int max = Convert.ToInt32(Request.QueryString["max"].ToString());
                        SearchItemByPrice(min, max, viewType);
                    }

                }
            }

            // view by category

            if (Request.QueryString["group_cat"] != null && Request.QueryString["cat"] != null)
            {
                string groupCat = Request.QueryString["group_cat"].ToString();
                string cat = Request.QueryString["cat"].ToString();
                loadProductByCategory(Convert.ToInt32(groupCat), Convert.ToInt32(cat), viewType);
            }
            else
            {
                if (Request.QueryString["group_cat"] != null)
                {
                    string groupCat = Request.QueryString["group_cat"].ToString();
                    loadProductByCategory(Convert.ToInt32(groupCat), -1, viewType);
                }
                else if (Request.QueryString["cat"] != null)
                {
                    string cat = Request.QueryString["cat"].ToString();
                    loadProductByCategory(-1, Convert.ToInt32(cat), viewType);
                }
            }

            if (!IsPostBack)
            {
                loadPromotionProducts();
            }

            setCssFor2Button(viewType);
        }

        //Connect and Load products in database when search by name
        private void LoadItemsSearch(string q, string view = "1")
        {
            ConnectDB db = new ConnectDB();
            DataTable dt = db.getAllProductsInSearch(q);
            renderHTML(dt, view);
        }

        //Connect and Load products filter

        private void SearchItemByPrice(int min, int max, string view = "1")
        {
            ConnectDB db = new ConnectDB();
            DataTable dt = db.getProductsByPrice(min, max);
            renderHTML(dt, view);
        }

        // Get item by category
        private void loadProductByCategory(int cat_group = -1, int cat = -1, string view = "1")
        {
            DataTable dt = null;
            ConnectDB db = new ConnectDB();

            if (cat_group >= 0 && cat >= 0)
            {
                dt = db.getAllProductsByCategoryAndGroup(cat, cat_group);
            }
            else
            {
                if (cat_group >= 0)
                {
                    dt = db.getAllProductsByGroupCategory(cat_group);
                }
                else
                {
                    dt = db.getAllProductsByCategory(cat);
                }
            }

            renderHTML(dt, view);
        }

        //Filter button
        protected void btnFilter_Click(object sender, EventArgs e)
        {
            int max = 500000;
            int min = 0;
            if (drlFilterPrice.SelectedIndex == 1)
            {
                min = 500000;
                max = 1000000;
            }
            else if (drlFilterPrice.SelectedIndex == 2)
            {
                min = 1000000;
                max = 3000000;
            }
            else if (drlFilterPrice.SelectedIndex == 3)
            {
                min = 3000000;
                max = 100000000;
            }
            Response.Redirect("Search.aspx?action=search&type=price&min=" + min.ToString() + "&max=" + max.ToString());

            // Response.Write(min.ToString() + "\t" + max.ToString());
        }

        private void loadPromotionProducts()
        {
            DataTable dt = (new ConnectDB()).getAllPromotionProducts();
            int i = dt.Rows.Count - 1;
            while (dt.Rows.Count > 5)
            {
                dt.Rows[i].Delete();
                i--;
            }
            dt.AcceptChanges();

            dt.Columns.Add("link_image", typeof(string));
            dt.Columns.Add("sel_price", typeof(System.Int32));
            foreach (DataRow item in dt.Rows)
            {
                int giaTien = Convert.ToInt32(item["price"]);
                item["sel_price"] = giaTien - (Convert.ToInt32(item["promotion"]) * giaTien / 100);
                DataTable dtImages = (new ConnectDB()).getImagesByIdProduct(Convert.ToInt32(item["id_product"]));
                item["link_image"] = "";
                if (dtImages.Rows.Count > 0)
                {
                    item["link_image"] = dtImages.Rows[0]["link_image"].ToString();
                }

            }

            rptSanPhamKhuyenMai.DataSource = dt;
            rptSanPhamKhuyenMai.DataBind();
        }

        private void renderHTML(DataTable dt, string view = "1")
        {
            StringBuilder html = new StringBuilder();
            if (dt.Rows.Count > 0)
            {
                pnControl.Visible = true;
                foreach (DataRow row in dt.Rows)
                {
                    CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"
                    string tien = double.Parse(row["price"].ToString()).ToString("#,### VNĐ", cul.NumberFormat);
                    string image_link = ""; //getImagesByIdProduct
                    if (dt.Columns.Contains("link_image"))
                    {
                        image_link = row["link_image"].ToString();
                    }
                    else
                    {
                        ConnectDB dbConnect = new ConnectDB();
                        DataTable dtImages = dbConnect.getImagesByIdProduct(Convert.ToInt32(row["id_product"]));
                        if (dtImages.Rows.Count >= 1)
                        {
                            image_link = dtImages.Rows[0]["link_image"].ToString();
                        }
                    }
                    string id_product = row["id_product"].ToString();

                    if (view == "1")
                    {
                        html.Append("<div class='coDownProduct'><div class='productGrid'><div class='countDown' data-end='kmdn_ngay1_thang12_nam2017'>208D : 12H : 38M : 10S</div><div class='productImg'>");
                        html.Append("<a href='#' title='" + row["name"] + "'><img src='" + image_link + "' data-original='" + image_link + "' class='img-fix' alt='" + row["name"] + "' style='display: inline;'></a>");
                        html.Append("<div class='hoverButtons'>");
                        html.Append("<span data-toggle='modal' data-target='Cart.aspx?action=add&id=" + id_product + "'><a href='Cart.aspx?action=add&id=" + id_product + "' class='button quickview-btn' data-toggle='tooltip' data-placement='top' title='' data-countdown='null' data-alias='may-giat-panasonic-10-kg-na-f100a1wrv' data-original-title='Cho vào giỏ hàng'><i class='fa fa-shopping-cart'></i></a></span>");
                        html.Append("<span data-toggle='modal' data-target='ProductDetail.aspx?id=" + id_product + "'><a href='ProductDetail.aspx?id=" + id_product + "' class='button quickview-btn' data-toggle='tooltip' data-placement='top' title='' data-countdown='null' data-alias='may-giat-panasonic-10-kg-na-f100a1wrv' data-original-title='Xem nhanh'><i class='fa fa-search'></i></a></span>");
                        html.Append("<a href='#' class='button skype' data-toggle='tooltip' data-placement='top' title='' data-original-title='Tư vấn qua Skype'><i class='fa fa-skype'></i></a>");
                        html.Append("</div></div><h3><a href='ProductDetail.aspx?id=" + id_product + "' title='" + row["name"] + "'>" + row["name"] + "</a></h3>");
                        html.Append("<div class='productPrice'><span>" + tien + "</span></div></div></div>");
                    }
                    else
                    {
                        html.Append("<div class='item-2'><div class='productList QuickAddToCart clearfix'><div class='productListImg'>");
                        html.Append("<a href='#'><img src='" + image_link + "' data-original='" + image_link + "' class='img-responsive lazy imgQuickAddToCart' alt='" + row["name"] + "'></a></div>");
                        html.Append("<div class='productListInfo'>");
                        html.Append("<h3><a href='#'>" + row["name"] + "</a></h3>");
                        html.Append("<div class='productListPrice priceQuickAddToCart'><span>" + tien + "</span></div>");
                        html.Append("<span class='line'></span>");
                        html.Append("<div class='productListDesc'>" + row["description"] + "</div>");
                        html.Append("<div class='formQuickAddToCart productListForm'>");
                        html.Append("<input type='hidden' name='variantId' value='9363959'>");
                        html.Append("<a href='Cart.aspx?action=add&id=" + id_product + "' class='button buttonProductList quickAddToCart' data-toggle='tooltip' title='' data-original-title='Cho vào giỏ hàng'><i class='fa fa-shopping-cart'></i> Cho vào giỏ hàng</button>");
                        html.Append("<a href='#' class='button skype' data-toggle='tooltip' title='' data-original-title='Chat qua Skype'><i class='fa fa-skype'></i></a></div></div></div></div>");
                    }
                }
            }
            else
            {
                pnControl.Visible = false;
                html.Append("<h2 style='text-align:center;margin: 40px auto;font-size: 2em;'>Không có sản phẩm nào được hiển thị :(</h2>");
            }
            grdContent.Controls.Add(new Literal { Text = "" });
            grdContent.Controls.Add(new Literal { Text = html.ToString() });

        }

        protected void btnViewGrid_Click(object sender, EventArgs e)
        {
            selectGridView("1");
        }

        protected void btnViewList_Click(object sender, EventArgs e)
        {
            selectGridView("2");

        }

        private void selectGridView(string view)
        {
            string path = Request.Url.ToString();
            if (!path.Contains("?")) return;
            if (path.Contains("&view="))
            {
                path = Regex.Replace(path, "view=([0-9])", "view=" + view);
            }
            else
            {
                path += "&view=" + view;
            }
            Response.Redirect(path);
        }

        private void setCssFor2Button(string view = "1")
        {
            if (view.Contains("2"))
            {
                btnViewGird.Attributes["class"] = "switchView viewCollection";
                btnViewList.Attributes["class"] = "switchView active viewCollection";
            }
            else
            {
                btnViewGird.Attributes["class"] = "switchView active viewCollection";
                btnViewList.Attributes["class"] = "switchView viewCollection";
            }
        }
    }
}