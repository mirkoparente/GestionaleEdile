using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace GestionaleEdile.Admin
{
    public partial class Pagamenti : System.Web.UI.Page
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
                    SqlCommand cmd = new SqlCommand("select IdDipendente, nome, cognome from Dipendenti", conn);

                    SqlDataReader reader = cmd.ExecuteReader();
                    List<Dipendenti> list = new List<Dipendenti>();
                    while (reader.Read())
                    {
                        Dipendenti d = new Dipendenti();
                        d.Id = Convert.ToInt32(reader["IdDipendente"]);
                        d.Nome = reader["Nome"].ToString();
                        d.Cognome = reader["Cognome"].ToString();

                        list.Add(d);
                    }
                    foreach(Dipendenti d in list)
                    {
                        ListItem item = new ListItem();
                        item.Text =$" {d.Nome} {d.Cognome}"; 
                        item.Value=d.Id.ToString();
                        DropDownList2.Items.Add(item);
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

        protected void Button1_Click(object sender, EventArgs e)
        {

            string connection = ConfigurationManager.ConnectionStrings["ConnectionDB"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connection);

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("insert into Pagamenti values(@PeriodoPagamento,@Pagamento,@AccontoOStipendio,@IdDipendente)", conn);
                cmd.Parameters.AddWithValue("PeriodoPagamento", TextBox2.Text);
                cmd.Parameters.AddWithValue("Pagamento", TextBox1.Text);
                cmd.Parameters.AddWithValue("AccontoOStipendio", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("IdDipendente", DropDownList2.SelectedItem.Value);

                if (cmd.ExecuteNonQuery() > 0)
                {
                    mess.Visible = true;
                    Response.Redirect("StoricoPagamenti.aspx");

                }



            }
            catch (Exception)
            {

            }
            finally { conn.Close(); }
        }
    }

}