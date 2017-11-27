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
        SqlConnection conn;

        public ConnectDB() { }

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

        public void disconnect()
        {
            if ((conn != null) && (conn.State == ConnectionState.Open))
            {
                conn.Close();
            }
        }

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
    }
}