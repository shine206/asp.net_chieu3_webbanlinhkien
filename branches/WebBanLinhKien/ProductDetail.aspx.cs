using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebBanLinhKien
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        string htmlMainImage = "";
        string htmlSubImage = "";
        int idProduct;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    idProduct = Convert.ToInt32(Request.QueryString["id"]);
                    getProduct(idProduct);
                    loadRelatedProducts(idProduct, rptRelatedProducts);
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
        }

        private void getProduct(int id)
        {
            DataTable dt = (new ConnectDB()).getProductById(id);
            if (dt.Rows.Count >= 1)
            {
                DataTable dtImages = (new ConnectDB()).getImagesByIdProduct(id);
                dt.Columns.Add("sel_price", typeof(System.Int32));
                if (dt.Rows[0]["promotion"] != null && dt.Rows[0]["promotion"].ToString() != "")
                {
                    int giaTien = Convert.ToInt32(dt.Rows[0]["price"]);
                    dt.Rows[0]["sel_price"] = giaTien - (Convert.ToInt32(dt.Rows[0]["promotion"]) * giaTien / 100);
                }
                else
                {
                    dt.Rows[0]["sel_price"] = 0;
                }
                int index = 1;
                foreach (DataRow image in dtImages.Rows)
                {
                    string link_image = image["link_image"].ToString().Replace("\\", "/");
                    htmlMainImage += "<div class='item' data-hash='sp" + index.ToString() + "'><img src='/" + link_image + "' class='img-responsive' alt='Ảnh sản phẩm'></div>";
                    htmlSubImage += "<div class='sub-item'><a href='#sp" + index.ToString() + "'><img src='/" + link_image + "'></a></div>";
                    //"<img src='/" + image["link_image"].ToString().Replace("\\", "/") + "' alt='" + row["name"] + "' width='70' height='70' />");
                    index++;
                }
                rptProdutDetail.DataSource = dt;
                rptProdutDetail.DataBind();
            }
        }

        protected void loadRelatedProducts(int id, Repeater rptData)
        {
            DataTable dtRelatedProducts = (new ConnectDB()).getRelatedProductsById(id);
            dtRelatedProducts.Columns.Add("image_link");
            dtRelatedProducts.Columns.Add("del_price");
            foreach (DataRow row in dtRelatedProducts.Rows)
            {
                DataTable dtImages = (new ConnectDB()).getImagesByIdProduct(Convert.ToInt32(row["id_product"]));
                if (dtImages.Rows.Count > 0)
                {
                    if (row["promotion"] != null && row["promotion"].ToString() != "")
                    {
                        int giaTien = Convert.ToInt32(row["price"]);
                        row["del_price"] = giaTien - (Convert.ToInt32(row["promotion"]) * giaTien / 100);
                    }
                    else
                    {
                        row["del_price"] = 0;
                    }
                    row["image_link"] = dtImages.Rows[0]["link_image"].ToString();
                }
            }
            rptData.DataSource = dtRelatedProducts;
            rptData.DataBind();
        }

        protected void rptProdutDetail_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                PlaceHolder phMainImage = (PlaceHolder)e.Item.FindControl("mainImageContent");
                phMainImage.Controls.Clear();
                phMainImage.Controls.Add(new Literal { Text = htmlMainImage.ToString() });
                PlaceHolder phSubImage = (PlaceHolder)e.Item.FindControl("subImageContent");
                phSubImage.Controls.Clear();
                phSubImage.Controls.Add(new Literal { Text = htmlSubImage.ToString() });

                //loadRelatedProducts(idProduct, (Repeater)e.Item.FindControl("rptRelatedProducts"));
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            string quantity = Request.Form["quantity"];
            Response.Write(quantity);
        }
    }
}