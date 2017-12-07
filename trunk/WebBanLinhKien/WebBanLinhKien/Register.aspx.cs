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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string user = txtUserName.Text;
            string email = emailLogin.Text;
            string pass = passLogin.Text;
            string fullName = txtFullName.Text;
            string address = txtAddressUser.Text;
            string phone = txtPhone.Text;

            ConnectDB db = new ConnectDB();

            // Kiểm tra username or email có tồn tại chưa


            if (!db.CheckUser(user, email))
            {
                db.addNewUser(user, pass, fullName, email, address, phone);
                Response.Redirect("Login.aspx");
            }
            else
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Bạn đăng ký không thành công. (Tên người dùng hoặc email đã tồn tại trong hệ thống.)";
                txtUserName.Text = "";
                txtFullName.Text = "";
                emailLogin.Text = "";
                txtAddressUser.Text = "";
                txtPhone.Text = "";
            }
        }

    }
}