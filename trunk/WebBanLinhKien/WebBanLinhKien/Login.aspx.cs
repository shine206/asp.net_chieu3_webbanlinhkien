using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Windows;

namespace WebBanLinhKien
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                HttpCookie cookie = new HttpCookie("user_login");
                if (cookie != null)
                {
                    Response.Redirect("home.aspx");
                }
            }
        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            string txtName = username.Text;
            string txtPass = passLogin.Text;
            try
            {
                ConnectDB db = new ConnectDB();
                DataTable dt = db.loginWithUser(txtName, txtPass);

                if (dt.Rows.Count > 0)
                {
                    HttpCookie cookie = new HttpCookie("User_Login");
                    cookie["Username"] = txtName;
                    cookie.Expires = DateTime.Now.AddDays(1);
                    Response.Cookies.Add(cookie);
                    Response.Redirect("Home.aspx");
                }
                else {
                    username.Text = "";
                    passLogin.Text = "";
                    username.Focus();
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: ", ex.Message);
            }
            
        }

    }
}