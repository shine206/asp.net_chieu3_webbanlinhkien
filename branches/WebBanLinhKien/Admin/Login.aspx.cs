using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace WebBanLinhKien.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["action"] != null)
            {
                string action = Request.QueryString["action"].ToString();
                if (action == "logout")
                {
                    Response.Cookies["login_admin"].Expires = DateTime.Now.AddDays(-1);
                    Response.Redirect("Login.aspx");
                    return;
                }
            }

            if (Request.Cookies["login_admin"] != null)
            {
                Response.Redirect("Products.aspx");
            }
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;
            DataTable dt = (new ConnectDB()).loginWithUserAmin(username, password);
            if (dt.Rows.Count > 0)
            {
                HttpCookie cookie = new HttpCookie("login_admin");
                cookie["username"] = username;
                cookie.Expires = DateTime.Now.AddDays(1);
                Response.Cookies.Add(cookie);
                Response.Redirect("Products.aspx");
            }
            else
            {
                pnError.Visible = true;
                lblErrorMessage.Text = "Đăng nhập thất bại !!!";
            }
        }
    }
}
