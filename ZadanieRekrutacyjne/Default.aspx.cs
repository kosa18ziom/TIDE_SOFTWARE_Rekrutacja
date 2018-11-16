using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ZadanieRekrutacyjne
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("About.aspx"); //Naciśnięcie przycisku powoduje przejście do zakładki About.aspx
        }

        protected void RadButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contact.aspx"); //Naciśnięcie przycisku powoduje przejście do zakładki Contact.aspx
        }

        protected void RadButton3_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(
            this.GetType(), "OpenWindow", "window.open('https://www.greetingsisland.com/invitations/wedding','_newtab');", true);
            //Naciśnięcie przycisku powoduje przejście do zewnętrznego serwisu o adresie jw.
        }
    }
}