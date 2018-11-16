<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZadanieRekrutacyjne._Default" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
  </style>
</head>
<body>



<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Tutaj ustalamy ile będzie "kropek" do zmiany zdjęcie w Carousel -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Dodajemy zdjęcia do Carousel i podpisy -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
          <img src="Files/pobrane.png" />
        <div class="carousel-caption">
          <h3>Zaplanuj z nami swoje wymarzone wesele</h3>
          <p>Całkowicie darmowy portal</p>
        </div>      
      </div>
        
      <div class="item">
          <img src="Files/pobrane%20(1).png" />
        <div class="carousel-caption">
          <h3>Jedyny taki dzień w życiu</h3>
          <p>Dopilnuj by wszystko było zapięte na ostatni guzik</p>
        </div>      
      </div>
    </div>

    <!-- Przyciski do przewijania i cofania w Carousel -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>

<div class="container text-center">    
  <h3>Zaplanuj swoje wesele</h3><br>
  <div class="row">
    <div class="col-sm-4">
        <img src="Files/venues_1524045490_8804_9735.jpg" class="img-responsive" style="width:100%">
        <telerik:RadButton ID="RadButton1" runat="server" Text="Wybierz salę weselną" OnClick="RadButton1_Click"></telerik:RadButton>
</div>
    <div class="col-sm-4"> 
        <img src="Files/wedding-songs-download-1.jpg" class="img-responsive" style="width:100%">
      <telerik:RadButton ID="RadButton2" runat="server" Text="Stwórz listę gości" OnClick="RadButton2_Click" ></telerik:RadButton>
    </div>
      <div class="col-sm-4"> 
          <img src="Files/preview-small.jpg" class="img-responsive" style="width:100%">
      <telerik:RadButton ID="RadButton3" runat="server" Text="Zaprojektuj własne zaproszenia" OnClick="RadButton3_Click" ></telerik:RadButton>
    </div>
  </div>
</div><br>
    <footer class="container-fluid text-center">
        <div>
        <telerik:RadMediaPlayer RenderMode="Lightweight" ID="RadMediaPlayer1" runat="server"
            Height="550px" EnableViewState="False" Width="1100px" Source="https://www.youtube.com/watch?v=lp-EO5I60KA" Title="Propozycja Piosenki Na pierwszy taniec">
        </telerik:RadMediaPlayer>
            <br />
  <p>Jeśli masz pytania
      </p>
        <p>Skontaktuj się ze mną
      </p>
        <p>E-Mail: <a href="mailto:kosinski_konrad@wp.pl">kosinski_konrad@wp.pl</a>
  </p>
        <p>Tel:+48692598247
  </p>
            </div>
</footer>
</body>
</html>

  

        
    </div>

  

        
</asp:Content>
