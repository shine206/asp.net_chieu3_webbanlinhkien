using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanLinhKien.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["login_admin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string username = Request.Cookies["login_admin"].Values["username"].ToString();
                lblDisplayUsername.Text = username;
            }
        }
    }
}