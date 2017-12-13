using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;

namespace WebBanLinhKien
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable cart = new DataTable();
            if (Session["cart"] == null)
            {
                cart.Columns.Add("ID");
                cart.Columns.Add("Name");
                cart.Columns.Add("Price");
                cart.Columns.Add("Image");
                cart.Columns.Add("Quantity");
                cart.Columns.Add("Total");
                Session["cart"] = cart;
                pnNoItem.Visible = true;
                pnTableCart.Visible = false;
            }
            else
            {
                cart = Session["cart"] as DataTable;
                if (cart.Rows.Count > 0)
                {
                    pnNoItem.Visible = false;
                    pnTableCart.Visible = true;
                }
                else
                {
                    pnNoItem.Visible = true;
                    pnTableCart.Visible = false;
                }

            }

            if (!String.IsNullOrEmpty(Request.QueryString["action"]))
            {
                if (Request.QueryString["action"] == "delete")
                {
                    if (!IsPostBack)
                    {
                        string id = Request.QueryString["id"].ToString();
                        foreach (DataRow row in cart.Rows)
                        {
                            if (row["ID"].ToString() == id)
                            {
                                row.Delete();
                                break;
                            }
                        }
                        cart.AcceptChanges();
                        Session["cart"] = cart;
                        Response.Redirect("Cart.aspx");
                    }
                }
                else if (Request.QueryString["action"] == "add")
                {
                    string id = Request.QueryString["id"].ToString();
                    bool isExisted = false;
                    int nQ = 1;
                    if (Request.QueryString["Quantity"] != null)
                        nQ = Convert.ToInt32(Request.QueryString["Quantity"]);
                    foreach (DataRow row in cart.Rows)
                    {
                        if (row["ID"].ToString() == id)
                        {
                            int quantity = Convert.ToInt32(row["Quantity"]) + nQ;
                            row["Quantity"] = quantity;
                            row["Total"] = quantity * Convert.ToInt32(row["Price"]);
                            isExisted = true;
                            break;
                        }
                    }

                    if (!isExisted)
                    {
                        DataTable dtProduct = (new ConnectDB()).getProductById(Convert.ToInt32(id));
                        DataTable dtImage = (new ConnectDB()).getImagesByIdProduct(Convert.ToInt32(id));
                        string image_link = "";
                        if (dtImage.Rows.Count > 0)
                        {
                            image_link = dtImage.Rows[0]["link_image"].ToString();
                        }

                        if (dtProduct.Rows.Count > 0)
                        {
                            string name = dtProduct.Rows[0]["name"].ToString();
                            string price = dtProduct.Rows[0]["price"].ToString();
                            DataRow dr = cart.NewRow();
                            dr["ID"] = id;
                            dr["Name"] = name;
                            dr["Price"] = price;
                            dr["Image"] = image_link;
                            dr["Quantity"] = nQ;
                            dr["Total"] = price;
                            cart.Rows.Add(dr);
                        }
                    }

                    Session["cart"] = cart;
                    if (Request.QueryString["Quantity"] != null)
                    {
                        Response.Redirect("Cart.aspx");
                    }
                    else
                    {
                        if (Request.UrlReferrer != null)
                            Response.Redirect(Request.UrlReferrer.ToString());
                        else
                            Response.Redirect("Home.aspx");
                    }
                }
            }
            loadCartToView(cart);

        }

        protected void loadCartToView(DataTable cart)
        {
            int sum = 0;
            foreach (DataRow row in cart.Rows)
            {
                sum += Convert.ToInt32(row["Price"]) * Convert.ToInt32(row["Quantity"]);
            }
            lblSum.Text = sum.ToString("#,### đ");
            rptCart.DataSource = cart;
            rptCart.DataBind();
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        [WebMethod(EnableSession = true)]
        public static string changeQuantity(string id, string op)
        {
            int quantity = 1;
            int total = -1;
            //Session["cart"]
            if (HttpContext.Current.Session["cart"] != null)
            {
                DataTable dtCart = HttpContext.Current.Session["cart"] as DataTable;
                foreach (DataRow row in dtCart.Rows)
                {
                    if (row["ID"].ToString() == id)
                    {

                        if (op == "1")
                            quantity = Convert.ToInt32(row["Quantity"]) + 1;
                        else
                        {
                            if (Convert.ToInt32(row["Quantity"]) > 1)
                            {
                                quantity = Convert.ToInt32(row["Quantity"]) - 1;
                            }
                        }
                        total = quantity * Convert.ToInt32(row["Price"]);
                        row["Total"] = total;
                        row["Quantity"] = quantity;
                        break;
                    }
                }
                HttpContext.Current.Session["cart"] = dtCart;

                // Get sum of among in cart
                int sum = 0;
                foreach (DataRow row in dtCart.Rows)
                {
                    sum += Convert.ToInt32(row["Price"]) * Convert.ToInt32(row["Quantity"]);
                }
                return "{\"Quantity\": " + quantity.ToString() + ", \"Total\": " + total.ToString() + ", \"Sum\": " + sum.ToString() + "}";
            }
            return "";
        }




    }
}