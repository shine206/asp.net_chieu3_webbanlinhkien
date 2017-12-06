using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Globalization;

namespace WebBanLinhKien
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            loadLeftMenu();
            
            //Login - Cookie
            if (!IsPostBack)
            {
                loadPromotionProduct();
                HttpCookie ck = Request.Cookies["User_Login"];
                string saveCk;
                if (ck != null)
                {
                    saveCk = ck.Values["Username"];
                }
            }

        }

        protected void loadPromotionProduct()
        {
            CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"

            DataTable dt = (new ConnectDB()).getAllPromotionProducts();
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
            rptPromotionContent.DataSource = dt;
            rptPromotionContent.DataBind();
        }

        protected void loadLeftMenu()
        {
            ConnectDB dbGroupCat = new ConnectDB();
            DataTable dtGroupCats = dbGroupCat.getAllGroupCategories();
            ConnectDB dbCats = new ConnectDB();
            DataTable dtCats = dbCats.getAllCategories();
            StringBuilder html = new StringBuilder();
            foreach (DataRow gCat in dtGroupCats.Rows)
            {
                html.Append("<li class='hasSubListCate'><i class='fa fa-angle-right'></i>");
                html.Append("<a href='Search.aspx?group_cat=" + gCat["id_group_category"] + "'>" + gCat["name"] + "</a>");
                html.Append("<div class='subListCate'>");
                foreach (DataRow cat in dtCats.Rows)
                {
                    if (cat["id_group"].ToString() == gCat["id_group_category"].ToString())
                        html.Append("<a href='Search.aspx?group_cat=" + gCat["id_group_category"] + "&cat=" + cat["id_category"] + "'>" + cat["category"] + "</a>");
                }
                html.Append("</div></li>");
            }
            liContent.Controls.Add(new Literal { Text = html.ToString() });

            // Load danh mục sản phẩm
            html.Clear();
            int count = 1;
            Function fn = new Function();
            foreach (DataRow gCat in dtGroupCats.Rows)
            {
                string expand = "false";
                if (count <= 1)
                {
                    expand = "true";
                    html.Append("<li role='presentation' class='active'>");
                }
                else
                {
                    html.Append("<li role='presentation'>");
                }
                html.Append("<a href='#taba" + count.ToString() + "' data-collection='" + fn.convertToUnSign3(gCat["name"].ToString()) + "' role='tab' data-toggle='tab' aria-expanded='"+ expand +"'>" + gCat["name"] + "</a>");
                html.Append("<a href='#' class='readMore' data-toggle='tooltip' title='' data-original-title='Xem thêm sản phẩm khác'>+</a></li>");
                StringBuilder htmlTabContent = loadTabContent(count, Convert.ToInt32(gCat["id_group_category"]));
                tabContent.Controls.Add(new Literal { Text = htmlTabContent.ToString() });
                count++;
            }
            tabAJAXProductsContent.Controls.Add(new Literal { Text = html.ToString() });
        }

        protected StringBuilder loadTabContent(int indexTab, int id_group_cat)
        {
            StringBuilder html = new StringBuilder();
            string fadeIn = "";
            if (indexTab <= 1)
                fadeIn = " in active";

            html.Append("<div class='tab-pane-custom tab-pane fade" + fadeIn + "' id='taba" + indexTab.ToString() + "' role='tabpanel'>");
            Function fn = new Function();
            DataTable dtGroupCats = (new ConnectDB()).getAllProductsByGroupCategory(id_group_cat);
            int count = 0;
            foreach (DataRow row in dtGroupCats.Rows)
            {
                string giaGiam = "";
                string promotion = "";
                if (row["promotion"] != null && row["promotion"].ToString() != "")
                {
                    promotion = row["promotion"].ToString();
                    int giaTien = Convert.ToInt32(row["price"]);
                    giaGiam = (giaTien - (Convert.ToInt32(promotion) * giaTien / 100)).ToString();
                }
                if (promotion != "")
                {
                    promotion = "<div class='productSale'><span>-" + promotion + "%</span></div>";
                    giaGiam = string.Format("{0:0,0} đ", giaGiam);
                }

                string nameProduct = row["name"].ToString();
                string price = string.Format("{0:0,0} đ", row["price"]);
                DataTable dtImages = (new ConnectDB()).getImagesByIdProduct(Convert.ToInt32(row["id_product"]));
                string link_image = "";
                if (dtImages.Rows.Count > 0)
                {
                    link_image = dtImages.Rows[0]["link_image"].ToString();
                }
                
                html.Append("<div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'><div class='productGrid'>" + promotion);
                html.Append("<div class='productImg'><a href='#' title='" + nameProduct + "'><img src='" + link_image + "' data-original='" + link_image + "' class='img-fix' alt='" + nameProduct + "' style='display: inline;'></a>");
                html.Append("<div class='hoverButtons'><span data-toggle='modal' data-target='#999'><a class='button quickview-btn' data-toggle='tooltip' data-placement='top' title='' data-countdown='null' data-alias='" + fn.convertToUnSign3(nameProduct) + "' data-original-title='Xem nhanh'><i class='fa fa-search'></i></a></span>");
                html.Append("<a href='#' class='button skype' data-toggle='tooltip' data-placement='top' title='' data-original-title='Tư vấn qua Skype'><i class='fa fa-skype'></i></a></div></div>");
                html.Append("<h3><a href='#' title='" + nameProduct + "'>" + nameProduct + "</a></h3><div class='productPrice'><del>" + giaGiam + "</del><span>" + price + "</span></div>");
                html.Append("<div class='actions clearfix'><a href='#' class='button'><i class='hoverButton'></i>Chọn sản phẩm</a></div></div></div>");
                count++;
                if (count >= 8)
                {
                    break;
                }
            }
            html.Append("</div>");
            return html;
        }
    }
}