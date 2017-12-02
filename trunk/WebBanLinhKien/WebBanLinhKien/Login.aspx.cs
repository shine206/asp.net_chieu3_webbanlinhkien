using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using System.Data;
using System.Configuration;


namespace WebBanLinhKien
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ConnectDB db = new ConnectDB();
            //DataTable dt = db.getUser();

            
        }

        protected void btnSend_Click1(object sender, EventArgs e)
        {
            Response.Write("jkdfjkds");
            
        }

        private void login()
        {
            
        }
    }
}