using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

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
                HttpCookie ck = Request.Cookies["User_Login"];
                string s;
                if (ck != null)
                {
                    s = ck.Values["Username"];
                }
            }

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
                if (count <= 1)
                {
                    html.Append("<li role='presentation' class='active'>");
                }
                else
                {
                    html.Append("<li role='presentation'>");
                }
                html.Append("<a href='#taba"+ count.ToString() +"' data-collection='" + fn.convertToUnSign3(gCat["name"].ToString()) + "' role='tab' data-toggle='tab'>" + gCat["name"] + "</a>");
                html.Append("<a href='#' class='readMore' data-toggle='tooltip' title='' data-original-title='Xem thêm sản phẩm khác'>+</a></li>");
                count++;
            }
            tabAJAXProductsContent.Controls.Add(new Literal { Text = html.ToString() });
        }
    }
}