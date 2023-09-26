using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestionaleEdile
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            error.Visible = false; 
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            string username = Username.Text;
            string password = Password.Text;

            string user = "";
            string pwd = "";

            string connection = ConfigurationManager.ConnectionStrings["ConnectionDB"].ConnectionString.ToString();
            SqlConnection conn= new SqlConnection(connection);

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from Admin where username=@username", conn);
                cmd.Parameters.AddWithValue("username", username);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    user = reader["Username"].ToString();
                    pwd = reader["Password"].ToString();
                }
                if(username==user && password==pwd)
                {
                    Response.Write("ok");
                    FormsAuthentication.SetAuthCookie(username, false);

                    Response.Redirect("Admin/ListaDipendenti.aspx");
                }
                else
                {
                    error.Visible=true;
                }

            }catch (Exception)
            {

            }finally { conn.Close(); }
        }
    }
}