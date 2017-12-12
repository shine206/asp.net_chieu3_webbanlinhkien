using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;


namespace WebBanLinhKien
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //HttpCookie cookie = new HttpCookie("user_login");
               
            }

            if (Request.QueryString["action"] != null)
            {
                if (Request.QueryString["action"].ToString() == "logout")
                {
                    Response.Cookies["User_Login"].Expires = DateTime.Now.AddDays(-1);
                    Response.Redirect(Request.UrlReferrer.ToString());
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
                    Response.Redirect(Request.UrlReferrer.ToString());     
                }
                else {
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Đăng nhập không thành công!!!";
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