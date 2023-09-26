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
    public partial class StoricoPagamenti : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["ConnectionDB"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connection);

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select dipendenti.Nome, dipendenti.Cognome, pagamenti.PeriodoPagamento,pagamenti.Pagamento,pagamenti.AccontoOStipendio from Dipendenti right join Pagamenti on dipendenti.IdDipendente=pagamenti.IdDipendente order by pagamenti.PeriodoPagamento" , conn);
                SqlDataReader reader = cmd.ExecuteReader();

                List<Paga> listaPagamenti= new List<Paga>();

                while (reader.Read())
                {
                   Paga p = new Paga();
                    p.Nome = reader["Nome"].ToString();
                    p.Cognome = reader["Cognome"].ToString();
                    p.PeriodoPagamento = Convert.ToDateTime(reader["PeriodoPagamento"]);
                    p.Pagamento = Convert.ToDouble(reader["Pagamento"]);
                    p.AccontoOStipendio = Convert.ToBoolean(reader["AccontoOStipendio"]);
                      
                    listaPagamenti.Add(p);
                }

                GridView1.DataSource = listaPagamenti;
                GridView1.DataBind();



            }
            catch (Exception)
            {

            }
            finally { conn.Close(); }
        }

        protected void Archivia_Click(object sender, EventArgs e)
        {
            GridView1.Columns.Clear();
        }
    }
    public class Paga
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Cognome { get; set; }
        public DateTime PeriodoPagamento{ get; set; }
        public double Pagamento { get; set; }
        public bool AccontoOStipendio { get; set; }

        
    }
}