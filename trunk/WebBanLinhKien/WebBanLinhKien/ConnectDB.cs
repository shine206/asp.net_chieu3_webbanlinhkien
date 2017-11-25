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
    }
}