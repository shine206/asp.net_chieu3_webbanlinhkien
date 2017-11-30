using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

namespace WebBanLinhKien
{
    public class ConnectDB
    {
        /// <summary>
        /// Danh sách hàm:
        /// GET:
        ///     getAllAdminUsers
        ///     getAllProducts
        ///     getAllCategories
        ///     getAllGroupCategories
        ///     getAllProductsInSearch
        /// POST:
        ///     addNewProduct
        ///     addNewCategory
        ///     deleteCategory
        ///     deleteProduct
        /// </summary>
     
        SqlConnection conn;

        public ConnectDB() { }

        /// <summary>
        /// Kết nối đến db
        /// </summary>
        public void connect()
        {
            if (conn == null)
            {
                conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
            }
        }

        /// <summary>
        /// Đóng kết nối với db hiện tại
        /// </summary>
        public void disconnect()
        {
            if ((conn != null) && (conn.State == ConnectionState.Open))
            {
                conn.Close();
            }
        }

        /// <summary>
        /// Lấy tất cả user thuộc nhóm admin
        /// </summary>
        /// <returns>Danh sách user</returns>
        public DataTable getAllAdminUsers()
        {

            DataTable result = new DataTable();
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("getAllAdminUsers", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rd = cmd.ExecuteReader();
                result.Load(rd);
            }
            finally
            {
                result.Dispose();
                disconnect();
            }
            return result;
        }

        /// <summary>
        /// Lấy tất cả sản phẩm
        /// </summary>
        /// <returns>Danh sách sản phẩm</returns>
        public DataTable getAllProducts()
        {

            DataTable result = new DataTable();
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("getAllProducts", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rd = cmd.ExecuteReader();
                result.Load(rd);
            }
            finally
            {
                result.Dispose();
                disconnect();
            }
            return result;
        }

        /// <summary>
        /// Lây tất cả danh mục
        /// </summary>
        /// <returns>Danh sách danh mục</returns>
        public DataTable getAllCategories()
        {

            DataTable result = new DataTable();
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("getAllCategories", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rd = cmd.ExecuteReader();
                result.Load(rd);
            }
            finally
            {
                result.Dispose();
                disconnect();
            }
            return result;
        }

        /// <summary>
        /// Lấy tất cả nhóm danh mục
        /// </summary>
        /// <returns>Danh sách nhóm danh mục</returns>
        public DataTable getAllGroupCategories()
        {

            DataTable result = new DataTable();
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("getAllGroupCategories", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rd = cmd.ExecuteReader();
                result.Load(rd);
            }
            finally
            {
                result.Dispose();
                disconnect();
            }
            return result;
        }

        /// <summary>
        /// Tìm sản phẩm bằng tên
        /// </summary>
        /// <param name="q">Tên sản phẩm cần tìm</param>
        /// <returns>Danh sách sản phẩm</returns>
        public DataTable getAllProductsInSearch(string q)
        {

            DataTable result = new DataTable();
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("getAllProductsInSearch", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@q", q);
                SqlDataReader rd = cmd.ExecuteReader();
                result.Load(rd);
            }
            finally
            {
                result.Dispose();
                disconnect();
            }
            return result;
        }

        /// <summary>
        /// Lấy hình ảnh từ id product
        /// </summary>
        /// <param name="id_product">id của product</param>
        /// <returns>Danh sách ảnh</returns>
        public DataTable getImagesByIdProduct(int id_product)
        {
            DataTable result = new DataTable();
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("getImagesByIdProduct", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_product", id_product);
                SqlDataReader rd = cmd.ExecuteReader();
                result.Load(rd);
            }
            finally
            {
                result.Dispose();
                disconnect();
            }
            return result;
        }

		// Lọc sản phẩm theo giá
        public DataTable getProductsByPrice(int min=0, int max = 500000)
        {
            DataTable result = new DataTable();
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("getProductsByPrice", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@min_price", min);
                cmd.Parameters.AddWithValue("@max_price", max);
                SqlDataReader rd = cmd.ExecuteReader();
                result.Load(rd);
            }
            finally
            {
                result.Dispose();
                disconnect();
            }
            return result;
        }
		
        /// <summary>
        /// Thêm sản phẩm mới
        /// </summary>
        /// <param name="id_category">id của danh mục</param>
        /// <param name="name">Tên sản phẩm</param>
        /// <param name="price">Giá sản phẩm</param>
        /// <param name="status">Trạng thái sản phẩm</param>
        /// <param name="promotion">Khuyến mãi</param>
        /// <param name="tags">Tags</param>
        /// <param name="details">Chi tiết sản phẩm</param>
        /// <param name="description">Mô tả sản phẩm</param>
        /// <param name="content">Nội dung sản phẩm</param>
        /// <returns>True or False</returns>
        public bool addNewProduct(int id_category, string name, int price, int status = 1, string promotion = "", string tags = "", string details = "", string description = "", string content = "")
        {
            bool result = false;
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("addNewProduct", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_category", id_category);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@price", price);
                cmd.Parameters.AddWithValue("@status", status);
                cmd.Parameters.AddWithValue("@promotion", promotion);
                cmd.Parameters.AddWithValue("@tag", tags);
                cmd.Parameters.AddWithValue("@details", details);
                cmd.Parameters.AddWithValue("@description", description);
                cmd.Parameters.AddWithValue("@content", content);
                cmd.Parameters.AddWithValue("@created_at", DateTime.Now);
                cmd.Parameters.AddWithValue("@updated_at", DateTime.Now);
                if (cmd.ExecuteNonQuery() == 1)
                    result = true;
            }
            finally
            {
                disconnect();
            }
            return result;
        }

        /// <summary>
        /// Xóa sản phẩm bằng id sản phẩm
        /// </summary>
        /// <param name="id">id sản phẩm</param>
        /// <returns>True or False</returns>
        public bool deleteProduct(int id)
        {
            bool result = false;
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("deleteProduct", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                if (cmd.ExecuteNonQuery() == 1)
                    result = true;
            }
            finally
            {
                disconnect();
            }
            return result;
        }

        /// <summary>
        /// Thêm mới danh mục sản phẩm
        /// </summary>
        /// <param name="parent">id danh mục cha, nêu id = 0 sẽ thêm vào nhóm danh mục</param>
        /// <param name="name">Tên danh mục</param>
        /// <returns>True or False</returns>
        public bool addNewCategory(int parent, string name)
        {
            bool result = false;
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("addNewCategory", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@parent", parent);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@created_at", DateTime.Now);
                cmd.Parameters.AddWithValue("@updated_at", DateTime.Now);
                if (cmd.ExecuteNonQuery() == 1)
                    result = true;
            }
            finally
            {
                disconnect();
            }
            return result;
        }

        /// <summary>
        /// Xóa danh mục
        /// </summary>
        /// <param name="id">id danh mục</param>
        /// <param name="isRoot">Nếu isRoot = 1 là xóa danh mục con, isRoot = 0 là xóa danh mục cha (nhóm danh mục)</param>
        /// <returns>True or False</returns>
        public bool deleteCategory(int id, int isRoot = 1)
        {
            bool result = false;
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("deleteCategory", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@isRoot", isRoot);
                if (cmd.ExecuteNonQuery() == 1)
                    result = true;
            }
            finally
            {
                disconnect();
            }
            return result;
        }

        public void uploadImages(string images)
        {
            try
            {
                connect();
                string[] arrayImages = images.Split(new char[] { ';' });
                foreach (string image in arrayImages)
                {
                    SqlCommand cmd = new SqlCommand("uploadImage", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@link_image", image);
                    cmd.Parameters.AddWithValue("@created_at", DateTime.Now);
                    cmd.Parameters.AddWithValue("@updated_at", DateTime.Now);
                    cmd.ExecuteNonQuery();
                }
            }
            finally
            {
                disconnect();
            }
        }

    }
}