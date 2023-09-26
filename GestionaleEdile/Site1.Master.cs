using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestionaleEdile
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            nav.Visible=false;
            if (Request.Cookies[".ASPXAUTH"]!=null)
            {
                nav.Visible = true;
                ben.InnerText = $"Benvenuto { HttpContext.Current.User.Identity.Name}";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Request.Cookies[".ASPXAUTH"] != null)
            {
                HttpCookie cookie = new HttpCookie(".ASPXAUTH");
                cookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(cookie);
                Response.Redirect("Default.aspx");
            }
        }
    }
}