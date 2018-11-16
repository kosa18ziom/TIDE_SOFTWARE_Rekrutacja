<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ZadanieRekrutacyjne.About" %>

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
  </style>
</head>
<body>

<div id="myCarousel" class="carousel slide" data-ride="carousel">

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
          <img src="Files/image%20(2).jpg" />
        <div class="carousel-caption">
          <h3>Sale Weselne w regionie</h3>
          <p>Pomożemy ci wybrać najlepszą salę w regionie</p>
        </div>      
      </div>
    </div>
</div>
  
<div class="container-fluid bg-3 text-center">    
  <h3>Najlepsze sale weselne w regionie</h3><br>
  <div class="row">
    <div class="col-sm-3">
      <p>Hotel Gołębiewski</p>
          <p>ul. Pałacowa 7, 15-064 Białystok</p>
          <p>tel. (+48 85) 678 25 00</p>
         <p><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">https://www.golebiewski.pl/bialystok/</asp:LinkButton></p> 
        <img src="Files/logo-13.gif" class="img-responsive" style="width:100%">
    </div>
    <div class="col-sm-3"> 
      <p>BANKIETOWE CENTRUM NIAGARA</p>
          <p>ul. Paderewskiego 8a, 15-349 Białystok</p>
          <p>tel. (+48 85) 678 25 00</p>
        <p><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">http://www.weselaniagara.pl/</asp:LinkButton></p> 
        <img src="Files/163_logo.gif" class="img-responsive" style="width:100%">
    </div>
    <div class="col-sm-3"> 
      <p>SOSNOWE ZACISZE</p>
          <p>ul. Leśna 20, 16-001 Kleosin</p>
          <p>tel. 85 710 22 54</p>
        <p><asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">http://sosnowezacisze.pl/</asp:LinkButton></p> 
        <img src="Files/174_logo.jpg" class="img-responsive" style="width:100%">
    </div>
    <div class="col-sm-3">
      <p>Maciejówka</p>
          <p>ul. Waszyngtona 34,16-040 Białystok</p>
          <p>tel. 602 622 508</p>
        <p><asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">http://www.maciejowka.eu/</asp:LinkButton></p> 
        <img src="Files/233_logo.gif" class="img-responsive" style="width:100%">
    </div>
  </div>
</div><br
</body>
</html>

</asp:Content>
