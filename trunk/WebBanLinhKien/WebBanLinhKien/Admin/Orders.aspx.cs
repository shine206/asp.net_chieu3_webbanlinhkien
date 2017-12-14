using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBanLinhKien.Admin
{
    public partial class Orders : System.Web.UI.Page
    {
        string htmlMainImage = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["action"] != null)
            {
                string action = Request.QueryString["action"].ToString();
                if (action == "detail")
                {
                    pnDetail.Visible = true;
                    int id_order = Convert.ToInt32(Request.QueryString["id"]);
                    loadOrderDetail(id_order);
                }
                else if (action == "confirm")
                {
                    (new ConnectDB()).confirmOrder(Convert.ToInt32(Request.QueryString["id"]));
                }
                else if (action == "delete")
                {
                    (new ConnectDB()).deleteOrder(Convert.ToInt32(Request.QueryString["id"]));
                }
            }
            loadOrders();
        }

        protected void loadOrders()
        {
            DataTable dt = (new ConnectDB()).getAllOrders();
            dt.Columns.Add("stt");
            int stt = 1;
            foreach (DataRow row in dt.Rows)
            {
                row["stt"] = stt;
                stt++;
            }
            lblCountOrder.Text = dt.Rows.Count.ToString();
            rptOrders.DataSource = dt;
            rptOrders.DataBind();
        }

        protected void loadOrderDetail(int id_order)
        {
            DataTable dtInfo = (new ConnectDB()).getOrderDetailByIdOrder(id_order, 1);
            dtInfo.Columns.Add("Sum");
            int sum = 0;
            DataTable dtProducts = (new ConnectDB()).getOrderDetailByIdOrder(id_order, 0);
            foreach (DataRow row in dtProducts.Rows)
            {
                int total = Convert.ToInt32(row["quantity"]) * Convert.ToInt32(row["current_price"]);
                sum += total;
                htmlMainImage += "<tr><th>" + row["name"] + "</th><th>" + row["quantity"] + "</th><th>" + total.ToString("#,### đ") + "</th></tr>";
            }
            htmlMainImage += "<tr><th>Tổng thanh toán</th><th></th><th><strong>" + sum.ToString("#,### đ") + "</strong></th></tr>";
            dtInfo.Rows[0]["Sum"] = sum;
            rptDetail.DataSource = dtInfo;
            rptDetail.DataBind();

            lblDetailOrder.Text = "DHSM_" + id_order.ToString();
        }

        protected void rptDetail_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                PlaceHolder ph = (PlaceHolder)e.Item.FindControl("productsContent");
                ph.Controls.Clear();
                ph.Controls.Add(new Literal { Text = htmlMainImage.ToString() });
            }
        }
    }
}