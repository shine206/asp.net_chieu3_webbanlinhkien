using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBanLinhKien
{
    public partial class Login2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (!IsPostBack)
            //{
            //    HttpCookie cookie = new HttpCookie("User_Login");
            //    if (cookie != null)
            //    {
            //        Response.Redirect("Home.aspx");
            //    }
            //}

        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            string txtName = username.Text;
            string txtPass = passLogin.Text;
            ConnectDB db = new ConnectDB();
            DataTable dt = db.loginWithUser(txtName, txtPass);

            Response.Write(dt.Rows.Count.ToString());

            if (dt.Rows.Count > 0)
            {
                HttpCookie cookie = new HttpCookie("User_Login");
                cookie["Username"] = txtName;
                cookie.Expires = DateTime.Now.AddHours(3);
                Response.Cookies.Add(cookie);
                Response.Redirect("Home.aspx");

            }
            else {
                Response.Redirect("Login2.aspx");
                //username.Text = "Username or password incorrect. Please try again!";

                
            }

        }
    }
}