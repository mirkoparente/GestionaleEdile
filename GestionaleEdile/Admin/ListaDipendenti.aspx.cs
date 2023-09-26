using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace GestionaleEdile.Admin
{
    public partial class ListaDipendenti : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connection = ConfigurationManager.ConnectionStrings["ConnectionDB"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connection);

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from Dipendenti ", conn);
                SqlDataReader reader = cmd.ExecuteReader();

                List<Dipendenti> ListaDipendenti = new List<Dipendenti>();

                while (reader.Read())
                {
                    Dipendenti dip = new Dipendenti();
                    dip.Id = Convert.ToInt32(reader["IdDipendente"].ToString());
                    dip.Nome = reader["Nome"].ToString();
                    dip.Cognome = reader["Cognome"].ToString();
                    dip.Indirizzo = reader["Indirizzo"].ToString();
                    dip.CF = reader["CodiceFiscale"].ToString();
                    dip.Sposato = Convert.ToBoolean(reader["Coniugato"].ToString());
                    dip.NFigli = Convert.ToInt32(reader["NumFigli"].ToString());
                    dip.Mansione = reader["Mansione"].ToString();

                    ListaDipendenti.Add(dip);
                }

                GridView1.DataSource = ListaDipendenti;
                GridView1.DataBind();



            }
            catch (Exception)
            {

            }
            finally { conn.Close(); 
            }
        }

       
    }





    public class Dipendenti
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Cognome { get; set; }
        public string Indirizzo { get; set; }
        public string CF { get; set; }
        public bool Sposato { get; set; }

        public int NFigli { get; set; }
        public string Mansione { get; set; }
    }
}




