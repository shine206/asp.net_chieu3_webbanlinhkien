using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Globalization;

namespace WebBanLinhKien
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
            
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            loadLeftMenu();
            loadCartInfo();
            StringBuilder html = new StringBuilder();
            HttpCookie ck = Request.Cookies["User_Login"];
            if (ck != null)
            {
                string userName = ck.Values["Username"].ToString();
                html.Append("<li><strong>" + userName + "</strong><a href='Login.aspx?action=logout'> (Logout)</a></li>");
            }
            else
            {
                html.Append("<li><a href='Register.aspx'>Đăng ký</a></li>");
                html.Append("<li><a href='Login.aspx'>Đăng nhập</a></li>");
            }
             userContent.Controls.Add(new Literal { Text = html.ToString() });
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtQuery.Text))
            {
                Response.Redirect("Search.aspx?action=search&type=name&q=" + txtQuery.Text);
            }
        }

        protected void loadCartInfo()
        {
            StringBuilder html = new StringBuilder();
            if (Session["cart"] != null)
            {
                
                DataTable dtCart = Session["cart"] as DataTable;
                lblCounter.Text = dtCart.Rows.Count.ToString();
                int sum = 0;
                foreach (DataRow row in dtCart.Rows)
                {
                    sum += Convert.ToInt32(row["Price"]) * Convert.ToInt32(row["Quantity"]);
                }
                CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");   // try with "en-US"
                string tien = double.Parse(sum.ToString()).ToString("#,### đ", cul.NumberFormat);
                html.Append("<div class='clearfix bottomMiniCart'><span class='left'>Tổng cộng</span>");
                html.Append("<span class='right totalCart' style='float: right;'>" + tien + "</span></div>");
            }
            else
            {
                html.Append("Không có sản phẩm nào trong giỏ hàng của bạn!");
            }

            CartInfoContent.Controls.Add(new Literal { Text = html.ToString() });
        }

        protected void loadLeftMenu()
        {
            ConnectDB dbGroupCat = new ConnectDB();
            DataTable dtGroupCats = dbGroupCat.getAllGroupCategories();
            ConnectDB dbCats = new ConnectDB();
            DataTable dtCats = dbCats.getAllCategories();
            StringBuilder html = new StringBuilder();
            int subMenu = 1;
            foreach (DataRow gCat in dtGroupCats.Rows)
            {
                html.Append("<li class='has-sub panel'>");
                html.Append("<a href='Search.aspx?group_cat=" + gCat["id_group_category"] + "'>" + gCat["name"] + "</a><em data-parent='#sub-menu-product' data-target='#sub-sub-menu-" + subMenu.ToString() + "' data-toggle='collapse' class='collapsed'><i class='fa fa-angle-down'></i></em>");
                html.Append("<ul class='list-unstyled collapse' id='sub-sub-menu-" + subMenu.ToString() + "'>");
                foreach (DataRow cat in dtCats.Rows)
                {
                    if (cat["id_group"].ToString() == gCat["id_group_category"].ToString())
                        html.Append("<li><a href='Search.aspx?group_cat=" + gCat["id_group_category"] + "&cat=" + cat["id_category"] + "'>" + cat["category"] + "</a></li>");
                }
                html.Append("</ul></li>");
                subMenu++;
            }
            liContent.Controls.Add(new Literal { Text = html.ToString() });

            html.Clear();
            // Load megaMenu
            int count = 0;
            foreach (DataRow gCat in dtGroupCats.Rows)
            {
                html.Append("<div class='col-md-4'>");
                html.Append("<h2 class='titleDecoration'><span class='line'></span><a href='Search.aspx?group_cat=" + gCat["id_group_category"] + "' class='title'>" + gCat["name"] + "</a></h2>");
                html.Append("<ul class='list-unstyled listMenu'>");
                foreach (DataRow cat in dtCats.Rows)
                {
                    if (cat["id_group"].ToString() == gCat["id_group_category"].ToString())
                        html.Append("<li><a href='Search.aspx?group_cat=" + gCat["id_group_category"] + "&cat=" + cat["id_category"] + "'>" + cat["category"] + "</a></li>");
                }
                html.Append("</ul></div>");
                count++;
                if (count >= 3)
                {
                    html.Append("<div class='clearfix'></div>");
                    count = 0;
                }
            }
            megaMenuContent.Controls.Add(new Literal { Text = html.ToString() });

            html.Clear();
            // Load mobile menu 
            subMenu = 1;
            foreach (DataRow gCat in dtGroupCats.Rows)
            {
                html.Append("<li class='hasSubListCate panel'>");
                html.Append("<a href='Search.aspx?group_cat=" + gCat["id_group_category"] + "'>" + gCat["name"] + "</a><em data-parent='#panel-mobile-menu' class='collapsed' data-toggle='collapse' data-target='#sub-menu-" + subMenu.ToString() + "'><i class='fa fa-angle-down'></i></em>");
                html.Append("<ul class='list-unstyled SubListCate collapse' id='sub-menu-"+ subMenu.ToString() +"'>");
                foreach (DataRow cat in dtCats.Rows)
                {
                    if (cat["id_group"].ToString() == gCat["id_group_category"].ToString())
                        html.Append("<li><a href='Search.aspx?group_cat=" + gCat["id_group_category"] + "&cat=" + cat["id_category"] + "'>" + cat["category"] + "</a></li>");
                }
                html.Append("</ul></li>");
                subMenu++;
            }
            mobileMenuContent.Controls.Add(new Literal { Text = html.ToString() });
        }
    }
}