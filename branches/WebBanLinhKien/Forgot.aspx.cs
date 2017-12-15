using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Drawing;
using System.Configuration;
using System.Data.SqlClient;

namespace WebBanLinhKien
{
    public partial class Forgot : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            ConnectDB db = new ConnectDB();


            if (db.sendMail(txtEmailVerify.Text))
            {
                string username = string.Empty;
                string password = string.Empty;

                MailMessage mm = new MailMessage("sender@gmail.com", txtEmailVerify.Text.Trim());
                mm.Subject = "Password Recovery";
                mm.Body = string.Format("Xin chào {0},<br /><br />Mật khẩu mới là {1}.<br /><br />Cảm ơn bạn đã quan tâm.", username, password);
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential();
                NetworkCred.UserName = "sender@gmail.com";
                NetworkCred.Password = "<Password>";
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                //smtp.Send(mm);
                lblEmail.ForeColor = Color.Green;
                lblEmail.Text = "Mật khẩu mới sẽ được gửi tới mail của bạn.!!!";
            }
            else
            {
                lblEmail.ForeColor = Color.Red;
                lblEmail.Text = "Địa chỉ email này không khớp với hồ sơ của chúng tôi.";
            }
        }

    }
}