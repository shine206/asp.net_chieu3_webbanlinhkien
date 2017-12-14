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
        ///     getAllProductsByGroupCategory
        ///     getAllProductsByCategory
        ///     getAllProductsByCategoryAndGroup
        ///     loginWithUser
        ///     loginWithUserAmin
        ///     getImagesByIdProduct
        ///     getProductById
        ///     getAllPromotionProducts
        ///     getCategoryById
        ///     getInfoUserById
        /// POST:
        ///     addNewProduct
        ///     addNewCategory
        ///     deleteCategory
        ///     deleteProduct
        ///     deleteImageById
        ///     updateProduct
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

        /// <summary>
        /// Upload hình ảnh
        /// </summary>
        /// <param name="image">Link hình</param>
        /// <param name="id_product">id của sản phẩm, nếu id = -1 sẽ tự động thêm vào sản phẩm cuối cùng</param>
        public void uploadImages(string image, int id_product = -1)
        {

            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("uploadImage", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_product", id_product);
                cmd.Parameters.AddWithValue("@link_image", image);
                cmd.Parameters.AddWithValue("@created_at", DateTime.Now);
                cmd.Parameters.AddWithValue("@updated_at", DateTime.Now);
                cmd.ExecuteNonQuery();
            }
            finally
            {
                disconnect();
            }
        }


        /// <summary>
        /// Đăng nhập với tài khoản người dùng
        /// </summary>
        /// <param name="username">Tài khoản</param>
        /// <param name="password">Mật khẩu</param>
        /// <returns>Thành viên, nếu đăng nhập thành công</returns>
        public DataTable loginWithUser(string username, string password)
        {
            DataTable result = new DataTable();
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("loginByUser", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);
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
        /// Lấy tất cả sản phẩm được lọc bằng nhóm sản phẩm
        /// </summary>
        /// <param name="group_category_id">id của nhóm sản phẩm</param>
        /// <returns>Danh sách sản phẩm</returns>
        public DataTable getAllProductsByGroupCategory(int group_category_id)
        {
            DataTable result = new DataTable();
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("getProductsByGroupCategory", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@group_category_id", group_category_id);
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
        /// Lấy tất cả sản phẩm được lọc bằng đanh mục
        /// </summary>
        /// <param name="category_id">id danh mục sản phẩm</param>
        /// <returns>Danh sách sản phẩm</returns>
        public DataTable getAllProductsByCategory(int category_id)
        {
            DataTable result = new DataTable();
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("getProductsByCategory", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@category_id", category_id);
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
        /// Lấy danh sách sản phẩm bằng nhóm sản phẩm và danh mục
        /// </summary>
        /// <param name="category_id">id danh mục</param>
        /// <param name="group_category_id">id nhóm danh mục</param>
        /// <returns></returns>
        public DataTable getAllProductsByCategoryAndGroup(int category_id, int group_category_id)
        {
            DataTable result = new DataTable();
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("getProductsByCategoryAndGroup", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@category_id", category_id);
                cmd.Parameters.AddWithValue("@group_category_id", group_category_id);
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
        /// Lấy sản phẩm bằng id của sản phẩm
        /// </summary>
        /// <param name="id_product">id sản phẩm</param>
        /// <returns>Danh sách sản phẩm</returns>
        public DataTable getProductById(int id_product)
        {
            DataTable result = new DataTable();
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("getProductById", conn);
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

        /// <summary>
        /// Xóa hình ảnh
        /// </summary>
        /// <param name="id_image">id của ảnh</param>
        /// <returns></returns>
        public bool deleteImageById(int id_image)
        {
            bool result = false;
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("deleteImageById", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_image", id_image);
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
        /// Cập nhật sản phẩm
        /// </summary>
        /// <param name="id_product">id của sản phẩm cần cập nhật</param>
        /// <param name="id_category">id danh mục</param>
        /// <param name="name">tên sản phẩm</param>
        /// <param name="price">giá sản phẩm</param>
        /// <param name="status">trạng thái sản phẩm</param>
        /// <param name="promotion">giảm giá %</param>
        /// <param name="tags">tags</param>
        /// <param name="details"></param>
        /// <param name="description"></param>
        /// <param name="content"></param>
        /// <returns></returns>
        public bool updateProduct(int id_product, int id_category, string name, int price, int status, string promotion, string tags, string details, string description, string content)
        {
            bool result = false;
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("updateProduct", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_product", id_product);
                cmd.Parameters.AddWithValue("@id_category", id_category);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@price", price);
                cmd.Parameters.AddWithValue("@status", status);
                cmd.Parameters.AddWithValue("@promotion", promotion);
                cmd.Parameters.AddWithValue("@tags", tags);
                cmd.Parameters.AddWithValue("@details", details);
                cmd.Parameters.AddWithValue("@description", description);
                cmd.Parameters.AddWithValue("@content", content);
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
        /// Thêm người dùng mới
        /// </summary>
        /// <param name="name">username</param>
        /// <param name="password">password</param>
        /// <param name="fullname">fullname</param>
        /// <param name="email">email</param>
        /// <param name="address">address</param>
        /// <param name="phone">phone</param>
        /// <returns></returns>
        public bool addNewUser(string name, string password, string fullname, string email, string address, string phone)
        {
            bool result = false;
            try
            {
                connect();
                conn.Open();
                SqlCommand cmd = new SqlCommand("addNewUser", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@username", name);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@fullname", fullname);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@address", address);
                cmd.Parameters.AddWithValue("@phone", phone);
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
        /// Kiểm tra xem username or email có tồn tại chưa
        /// </summary>
        /// <param name="userName">username</param>
        /// <param name="email">email</param>
        /// <returns></returns>
        public bool CheckUser(string userName, string email)
        {
            bool result = false;
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("select username from Users where username = @userName OR email = @email", conn);
                cmd.Parameters.AddWithValue("@username", userName);
                cmd.Parameters.AddWithValue("@email", email);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    result = true;

                }
            }
            finally
            {
                disconnect();
            }

            return result;
        }

        /// <summary>
        /// Lấy tất cả sản phẩm có khuyến mãi
        /// </summary>
        /// <returns></returns>
        public DataTable getAllPromotionProducts()
        {
            DataTable result = new DataTable();
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("getAllPromotionProducts", conn);
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
        /// Xác nhận mail để lấy password
        /// </summary>
        /// <returns></returns>
        /// 

        public bool sendMail(string email)
        {
            bool result = false;
            string username = string.Empty;
            string password = string.Empty;

            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("SELECT username, [password] FROM Users WHERE email = @email", conn);
                cmd.Parameters.AddWithValue("@Email", email.Trim());


                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    username = sdr["username"].ToString();
                    password = sdr["password"].ToString();
                    result = true;
                }

            }
            finally
            {
                disconnect();
            }
            return result;
        }

        /// <summary>
        /// Lấy tất cả sản phẩm liên quan của một sản phẩm
        /// </summary>
        /// <param name="id_product">id của sản phẩm chính</param>
        /// <returns>Danh sách sản phẩm liên quan</returns>
        public DataTable getRelatedProductsById(int id_product)
        {
            DataTable result = new DataTable();
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("getRelatedProducts", conn);
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

        /// <summary>
        /// Đăng nhập vào trang quản trị
        /// </summary>
        /// <param name="username">Tên đăng nhâp</param>
        /// <param name="password">Mật khẩu đăng nhập</param>
        /// <returns></returns>
        public DataTable loginWithUserAmin(string username, string password)
        {
            DataTable result = new DataTable();
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("loginByUserAdmin", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);
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

        //getCategoryById
        public DataTable getCategoryById(int id_category)
        {
            DataTable result = new DataTable();
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("getCategoryById", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_category", id_category);
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
        /// Cập nhật danh mục
        /// </summary>
        /// <param name="id_category">id danh muc</param>
        /// <param name="id_group">id danh mục cha</param>
        /// <param name="name">tên danh mục</param>
        /// <returns></returns>
        public bool updateCategory(int id_category, int id_group, string name)
        {
            bool result = false;
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("updateCategory", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_category", id_category);
                cmd.Parameters.AddWithValue("@id_group", id_group);
                cmd.Parameters.AddWithValue("@name", name);
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
        /// Lấy thông tin khách hàng từ ID
        /// </summary>
        /// <param name="id">id khách hàng</param>
        /// <returns></returns>
        public DataTable getInfoUserById(int id)
        {
            DataTable result = new DataTable();
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("getInfoUserById", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
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
        /// Thêm đơn đặt hàng vào db
        /// </summary>
        /// <param name="id_product"></param>
        /// <param name="id_user"></param>
        /// <param name="quantity"></param>
        /// <param name="price"></param>
        /// <returns></returns>
        public bool addNewOrder(int id_order, int id_product, int id_user, int quantity, int price, string fullname = "", string email = "", string address = "", string phone = "", string description = "")
        {
            bool result = false;
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("addNewOrder", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_order", id_order);
                cmd.Parameters.AddWithValue("@id_product", id_product);
                cmd.Parameters.AddWithValue("@id_user", id_user);
                cmd.Parameters.AddWithValue("@quantity", quantity);
                cmd.Parameters.AddWithValue("@price", price);
                cmd.Parameters.AddWithValue("@fullname", fullname);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@address", address);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@description", description);
                cmd.Parameters.AddWithValue("@created_at", DateTime.Now);
                cmd.Parameters.AddWithValue("@updated_at", DateTime.Now);
                Console.Write(cmd);
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
        /// Lấy tất cả các đơn hàng
        /// </summary>
        /// <returns></returns>
        public DataTable getAllOrders()
        {
            DataTable result = new DataTable();
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("getAllOrders", conn);
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


        public DataTable getOrderDetailByIdOrder(int id_order, int top = 1)
        {
            DataTable result = new DataTable();
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("getOrderDetailByIdOrder", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_order", id_order);
                cmd.Parameters.AddWithValue("@top", top);
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

        public bool confirmOrder(int id_order)
        {
            bool result = false;
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("confirmOrder", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_order", id_order);
                cmd.Parameters.AddWithValue("@updated_at", DateTime.Now);
                Console.Write(cmd);
                if (cmd.ExecuteNonQuery() == 1)
                    result = true;
            }
            finally
            {
                disconnect();
            }
            return result;
        }

        public bool deleteOrder(int id_order)
        {
            bool result = false;
            try
            {
                connect();
                SqlCommand cmd = new SqlCommand("deleteOrder", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_order", id_order);
                Console.Write(cmd);
                if (cmd.ExecuteNonQuery() == 1)
                    result = true;
            }
            finally
            {
                disconnect();
            }
            return result;
        }
    }
}