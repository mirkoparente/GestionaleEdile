using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestionaleEdile.Admin
{
    public partial class ModificaDipendente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                mess.Visible = false;
                string connection = ConfigurationManager.ConnectionStrings["ConnectionDB"].ConnectionString.ToString();
                SqlConnection conn = new SqlConnection(connection);

                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("select * from Dipendenti where IdDipendente=@Id ", conn);
                    cmd.Parameters.AddWithValue("Id", Convert.ToInt32(Request.QueryString["IdDipendente"]));
                    SqlDataReader reader = cmd.ExecuteReader();


                    while (reader.Read())
                    {
                        TextBox1.Text = reader["Nome"].ToString();
                        TextBox2.Text = reader["Cognome"].ToString();
                        TextBox3.Text = reader["Indirizzo"].ToString();
                        TextBox4.Text = reader["CodiceFiscale"].ToString();
                        CheckBox1.Checked = Convert.ToBoolean(reader["Coniugato"].ToString());
                        TextBox5.Text = reader["NumFigli"].ToString();
                        TextBox6.Text = reader["Mansione"].ToString();

                    }

                }
                catch (Exception)
                {

                }
                finally
                {
                    conn.Close();
                }
            }
        }



        protected void Modifica_Click(object sender, EventArgs e)
        {

            string connection = ConfigurationManager.ConnectionStrings["ConnectionDB"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connection);

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Update Dipendenti set Nome=@Nome,Cognome=@Cognome,Indirizzo=@Indirizzo,CodiceFiscale=@CodiceFiscale,Coniugato=@Coniugato,NumFigli=@NumFigli,Mansione=@Mansione where IdDipendente=@Id", conn);
                cmd.Parameters.AddWithValue("Id", Convert.ToInt32(Request.QueryString["IdDipendente"]));
                cmd.Parameters.AddWithValue("Nome", TextBox1.Text);
                cmd.Parameters.AddWithValue("Cognome", TextBox2.Text);
                cmd.Parameters.AddWithValue("Indirizzo", TextBox3.Text);
                cmd.Parameters.AddWithValue("CodiceFiscale", TextBox4.Text);
                cmd.Parameters.AddWithValue("Coniugato", Convert.ToBoolean(CheckBox1.Checked));
                cmd.Parameters.AddWithValue("NumFigli", Convert.ToInt32( TextBox5.Text));
                cmd.Parameters.AddWithValue("Mansione", TextBox6.Text);

                if (cmd.ExecuteNonQuery() > 0)
                {
                    mess.Visible = true;

                    Response.AppendHeader("Refresh","3;url=ListaDipendenti.aspx");
                }


            }
            catch (Exception)
            {

            }
            finally { conn.Close(); }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["ConnectionDB"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connection);

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("delete  from Dipendenti where IdDipendente=@Id", conn);
                cmd.Parameters.AddWithValue("Id", Request.QueryString["IdDipendente"]);
                if (cmd.ExecuteNonQuery() > 0)
                {

                    Response.Redirect("ListaDipendenti.aspx");
                }
            }
            catch (Exception)
            {

            }
            finally
            {
                conn.Close();
            }
        }
    }
}