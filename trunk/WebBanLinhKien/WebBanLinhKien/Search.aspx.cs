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
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["action"] != null)
            {
                string action = Request.QueryString["action"].ToString();
                string q = Request.QueryString["q"].ToString();
                ConnectDB db = new ConnectDB();
                DataTable dt = db.getAllProductsInSearch(q);
                
                StringBuilder html = new StringBuilder();
                foreach(DataRow row in dt.Rows)
                {
                    CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"
                    string tien = double.Parse(row["price"].ToString()).ToString("#,### VNĐ", cul.NumberFormat);
                    //string tien = string.Format("{ 0:0,000 } vnđ", row["price"].ToString());
                    html.Append("<div class='coDownProduct'><div class='productGrid'><div class='countDown' data-end='kmdn_ngay1_thang12_nam2017'>208D : 12H : 38M : 10S</div><div class='productImg'>");
                    html.Append("<a href='#' title='"+row["name"]+ "'><img src='" + row["link_image"] + "' data-original='" + row["link_image"] + "' class='img-fix' alt='" + row["name"] + "' style='display: inline;'></a>");
                    html.Append("<div class='hoverButtons'>");
                    html.Append("<span data-toggle='modal' data-target='#998'><a class='button quickview-btn' data-toggle='tooltip' data-placement='top' title='' data-countdown='null' data-alias='may-giat-panasonic-10-kg-na-f100a1wrv' data-original-title='Cho vào giỏ hàng'><i class='fa fa-shopping-cart'></i></a></span>");
                    html.Append("<span data-toggle='modal' data-target='#999'><a class='button quickview-btn' data-toggle='tooltip' data-placement='top' title='' data-countdown='null' data-alias='may-giat-panasonic-10-kg-na-f100a1wrv' data-original-title='Xem nhanh'><i class='fa fa-search'></i></a></span>");
                    html.Append("<a href='#' class='button skype' data-toggle='tooltip' data-placement='top' title='' data-original-title='Tư vấn qua Skype'><i class='fa fa-skype'></i></a>");
                    html.Append("</div></div><h3><a href='#' title='" + row["name"] + "'>" + row["name"] + "</a></h3>");
                    html.Append("<div class='productPrice'><del>7.990.000₫</del><span>&nbsp;&nbsp;" + tien + "</span></div></div></div>");

                }

                grdContent.Controls.Add(new Literal { Text = html.ToString() });
                //Response.Write(q);
                //Search.aspx?action=Search&q=asdjashdkh
            }
            
        }
    }
}