using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Globalization;

namespace WebBanLinhKien
{
    public partial class SearchViewList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["action"] != null)
            {
                string action = Request.QueryString["action"].ToString();
                if (action == "search")
                {
                    string type = Request.QueryString["type"].ToString();
                    if (type == "name")
                    {
                        string q = Request.QueryString["q"].ToString();
                        LoadItemsSearch(q);
                    }
                    else if (type == "price")
                    {
                        int min = Convert.ToInt32(Request.QueryString["min"].ToString());
                        int max = Convert.ToInt32(Request.QueryString["max"].ToString());
                        SearchItemByPrice(min, max);
                    }

                }
            }
        }
            //Connect and Load products in database when search by name
        private void LoadItemsSearch(string q)
        {
            ConnectDB db = new ConnectDB();
            DataTable dt = db.getAllProductsInSearch(q);
            grdContentList.Controls.Add(new Literal { Text = ""});
            StringBuilder html = new StringBuilder();
            foreach (DataRow row in dt.Rows)
            {
                CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"
                string tien = double.Parse(row["price"].ToString()).ToString("#,### VNĐ", cul.NumberFormat);
                html.Append("<div class='item-2'><div class='productList QuickAddToCart clearfix'><div class='productListImg'>");
                html.Append("<a href='#'><img src='" + row["link_image"] + "' data-original='" + row["link_image"] + "' class='img-responsive lazy imgQuickAddToCart' alt='" + row["name"] + "'></a></div>");
                html.Append("<div class='productListInfo'>");
                html.Append("<h3><a href='#'>" + row["name"] + "</a></h3>");
                html.Append("<div class='productListPrice priceQuickAddToCart'><span>"+ tien +"</span></div>");
                html.Append("<span class='line'></span>");
                html.Append("<div class='productListDesc'>" + row["description"] + "</div>");
                html.Append("<form action='#' method='post' class='formQuickAddToCart productListForm'>");
                html.Append("<input type='hidden' name='variantId' value='9363959'>");
                html.Append("<button class='button buttonProductList quickAddToCart' data-toggle='tooltip' title='' data-original-title='Cho vào giỏ hàng'><i class='fa fa-shopping-cart'></i> Cho vào giỏ hàng</button>");
                html.Append("<a href='#' class='button skype' data-toggle='tooltip' title='' data-original-title='Chat qua Skype'><i class='fa fa-skype'></i></a></form></div></div></div>");
            }

            grdContentList.Controls.Add(new Literal { Text = html.ToString() });
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
            Response.Redirect("SearchViewList.aspx?action=search&type=price&min=" + min.ToString() + "&max=" + max.ToString());
            
            // Response.Write(min.ToString() + "\t" + max.ToString());
        }


        //Connect and Load products filter

        private void SearchItemByPrice(int min, int max)
        {
            ConnectDB db = new ConnectDB();
            DataTable dt = db.getProductsByPrice(min, max);
            grdContentList.Controls.Add(new Literal { Text = "" });
            StringBuilder html = new StringBuilder();
            foreach (DataRow row in dt.Rows)
            {
                CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"
                string tien = double.Parse(row["price"].ToString()).ToString("#,### VNĐ", cul.NumberFormat);
                html.Append("<div class='item-2'><div class='productList QuickAddToCart clearfix'><div class='productListImg'>");
                html.Append("<a href='#'><img src='" + row["link_image"] + "' data-original='" + row["link_image"] + "' class='img-responsive lazy imgQuickAddToCart' alt='" + row["name"] + "'></a></div>");
                html.Append("<div class='productListInfo'>");
                html.Append("<h3><a href='#'>" + row["name"] + "</a></h3>");
                html.Append("<div class='productListPrice priceQuickAddToCart'><span>" + tien + "</span></div>");
                html.Append("<span class='line'></span>");
                html.Append("<div class='productListDesc'>" + row["description"] + "</div>");
                html.Append("<form action='#' method='post' class='formQuickAddToCart productListForm'>");
                html.Append("<input type='hidden' name='variantId' value='9363959'>");
                html.Append("<button class='button buttonProductList quickAddToCart' data-toggle='tooltip' title='' data-original-title='Cho vào giỏ hàng'><i class='fa fa-shopping-cart'></i> Cho vào giỏ hàng</button>");
                html.Append("<a href='#' class='button skype' data-toggle='tooltip' title='' data-original-title='Chat qua Skype'><i class='fa fa-skype'></i></a></form></div></div></div>");
            }

            grdContentList.Controls.Add(new Literal { Text = html.ToString() });
        }
    }
}