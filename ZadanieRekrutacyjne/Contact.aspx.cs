using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace ZadanieRekrutacyjne
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid(); //Wyświetlanie danych w tabeli po włączeniu lub odświeżeniu strony
            }
        }
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString; //ustalamy połączenie z bazą danych
            string query = "SELECT * FROM ListaGosci";      // Polecenie do wczytania danych z tabeli ListaGosci
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind(); //Wypełnienie pobranymi danymi naszego Gridview
                    }
                }
            }
        }

        protected void Insert(object sender, EventArgs e) //metoda do dodawania pojedynczych danych do tabeli, wpisywanych na sztywno przez usera
        {
            string Imie = textImie.Text;
            string Nazwisko = textNazwisko.Text;
            textImie.Text = "";
            textNazwisko.Text = "";
            string query = "INSERT INTO ListaGosci VALUES(@Imie, @Nazwisko)"; //polecenie SQL do wpisania danych do tabeli ListaGosci
            string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@Imie", Imie); //parametr z pierwszego textboxa
                    cmd.Parameters.AddWithValue("@Nazwisko", Nazwisko); // parametr z drugiego textboxa
                    cmd.Connection = con;
                    con.Open();//włączenie połączenia z bazą
                    cmd.ExecuteNonQuery(); // wykonanie polecenia SQL
                    con.Close();//zamknięcie połączenia z bazą
                }
            }
            this.BindGrid();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e) //metoda pozwalająca na edytowanie poszczególnych danych w Gridview
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e) //metoda aktualizująca dane po wprowadzonej edycjy w gridview
        {
            GridViewRow row = GridView1.Rows[e.RowIndex]; 
            int Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);//zczytanie ID danej linijki danych z tabeli i konwersja do Inta
            string Imie = (row.FindControl("txtImie") as TextBox).Text;//zczytanie danych z textboxa 1
            string Nazwisko = (row.FindControl("txtNazwisko") as TextBox).Text;//zczytanie danych z textboxa 2
            string query = "UPDATE ListaGosci SET Imie=@Imie, Nazwisko=@Nazwisko WHERE Id=@Id"; //Polecenie SQL do zaktualizwoania danych w tabeli
            string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Parameters.AddWithValue("@Imie", Imie);
                    cmd.Parameters.AddWithValue("@Nazwisko", Nazwisko);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)//metoda służąca do anulowania wprowadzania edycji w danych w gridview
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)//metoda do usuwania danych linijek danych z gridview
        {
            int Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string query = "DELETE FROM ListaGosci WHERE Id=@Id";//Polecenie SQL do usuwania konkretnej linijki z gridview
            string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            this.BindGrid();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)//metoda dzięki której user jest pytany czy na pewno chce usunąć dany wiersz z gridview
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                (e.Row.Cells[2].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)//metoda pozwalająca zmieniać strony w gridview
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void Upload(object sender, EventArgs e)//Przycisk powodujący załadowanie wybranego wcześniej pliku do importu danych w tabeli
        {
            
            string csvPath = Server.MapPath("~/Files/") + Path.GetFileName(FileUpload1.PostedFile.FileName);//pobranie pliku z danej lokalizacji
            FileUpload1.SaveAs(csvPath);
            //Poniżej wypełnianie tabeli w bazie danymi z pliku który importujemy
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Id", typeof(int)),
            new DataColumn("Imie", typeof(string)),
            new DataColumn("Nazwisko",typeof(string)) });


            string csvData = File.ReadAllText(csvPath);
            foreach (string row in csvData.Split('\n'))
            {
                if (!string.IsNullOrEmpty(row))
                {
                    dt.Rows.Add();
                    int i = 0;
                    foreach (string cell in row.Split(','))
                    {
                        dt.Rows[dt.Rows.Count - 1][i] = cell;
                        i++;
                    }
                }
            }

            string consString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(consString))
            {
                using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                {
                    //Set the database table name.
                    sqlBulkCopy.DestinationTableName = "dbo.ListaGosci";
                    con.Open();
                    sqlBulkCopy.WriteToServer(dt);
                    con.Close();
                    BindGrid();
                }
            }
        }
    }
}