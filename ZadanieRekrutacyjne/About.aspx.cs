using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ZadanieRekrutacyjne
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(
            this.GetType(), "OpenWindow", "window.open('https://www.golebiewski.pl/bialystok/','_newtab');", true); //Naciśnięcie linku spowudje przejście do serwisu o podanym adresie
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(
            this.GetType(), "OpenWindow", "window.open('https://www.weselaniagara.pl/','_newtab');", true);
        }
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(
            this.GetType(), "OpenWindow", "window.open('http://sosnowezacisze.pl/','_newtab');", true);
        }
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(
            this.GetType(), "OpenWindow", "window.open('http://www.maciejowka.eu/','_newtab');", true);
        }
    }
}