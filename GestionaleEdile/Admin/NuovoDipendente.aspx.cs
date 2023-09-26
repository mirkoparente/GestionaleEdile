using System;
using System.Configuration;
using System.Data.SqlClient;

namespace GestionaleEdile.Admin
{
    public partial class NuovoDipendente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mess.Visible = false;
        }

        protected void Insert_Click(object sender, EventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["ConnectionDB"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connection);

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("insert into Dipendenti values(@Nome,@Cognome,@Indirizzo,@CodiceFiscale,@Coniugato,@NumFigli,@Mansione)", conn);
                cmd.Parameters.AddWithValue("Nome", TextBox1.Text);
                cmd.Parameters.AddWithValue("Cognome", TextBox2.Text);
                cmd.Parameters.AddWithValue("Indirizzo", TextBox3.Text);
                cmd.Parameters.AddWithValue("CodiceFiscale", TextBox4.Text);
                cmd.Parameters.AddWithValue("Coniugato", CheckBox1.Checked);
                cmd.Parameters.AddWithValue("NumFigli", TextBox5.Text);
                cmd.Parameters.AddWithValue("Mansione", TextBox6.Text);

                if (cmd.ExecuteNonQuery() > 0)
                {
                    mess.Visible=true;
                    Response.Redirect("ListaDipendenti.aspx");
                }


            }
            catch (Exception)
            {

            }
            finally { conn.Close(); }
        }
    }
}