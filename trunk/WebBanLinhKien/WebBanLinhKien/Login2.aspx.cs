using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanLinhKien
{
    public partial class Login2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //if(!IsPostBack)
            //{
            //    HttpCookie cookie = new HttpCookie("User_Login");
            //    if(cookie != null)
            //    {
            //        Response.Redirect("Home.aspx");
            //    }
            //}

        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = new HttpCookie("User_Login");
            cookie["Username"] = username.Text;
            //cookie.Expires = DateTime.Now.AddHours(3);
            Response.Cookies.Add(cookie);
            Response.Redirect("Home.aspx");

            //Response.Write(username.Text);

        }
    }
}