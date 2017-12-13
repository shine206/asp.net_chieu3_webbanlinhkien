using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBanLinhKien
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie ck = Request.Cookies["User_Login"];
            if (ck != null)
            {
                string userName = ck.Values["Username"].ToString();
                string id = ck.Values["ID"].ToString();
                DataTable dt = (new ConnectDB()).getInfoUserById(Convert.ToInt32(id));
                if (dt.Rows.Count > 0)
                {
                    txtEmail.Text = dt.Rows[0]["email"].ToString();
                    txtDiaChi.Text = dt.Rows[0]["address"].ToString();
                    txtHoTen.Text = dt.Rows[0]["fullname"].ToString();
                    txtSoDienThoai.Text = dt.Rows[0]["phone"].ToString();
                }
            }
            loadProductFromCart();
        }

        protected void loadProductFromCart()
        {

            if (Session["cart"] != null)
            {
                pnThanhToan.Visible = true;
                pnTrangThai.Visible = false;
                DataTable cart = new DataTable();
                cart = Session["cart"] as DataTable;
                rptSanPham.DataSource = cart;
                rptSanPham.DataBind();
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void btnThanhToan_Click(object sender, EventArgs e)
        {
             DataTable cart = new DataTable();
             cart = Session["cart"] as DataTable;
             int id_user = Convert.ToInt32(Request.Cookies["User_Login"].Values["ID"]);
             int id_order = (new Random()).Next(1111, 9999);
             foreach (DataRow row in cart.Rows)
             {
                 int id_product = Convert.ToInt32(row["ID"]);
                 int quantity = Convert.ToInt32(row["Quantity"]);
                 int price = Convert.ToInt32(row["Price"]);
                 (new ConnectDB()).addNewOrder(id_order, id_product, id_user, quantity, price);
                 //Response.Write(isSuccess.ToString());
             }
             pnTrangThai.Visible = true;
             pnThanhToan.Visible = false;
             lblTrangThai.Text = "Đơn hàng của bạn sẽ được vận chuyển từ 1-3 ngày (tùy khối lượng). Click vào <a href='Home.aspx'>đây</a> để tiếp tục mua hàng.";
             Session.Clear();
             Session["cart"] = null;
        }
    }
}