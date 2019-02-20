<%-- 
    Document   : EditKlijentTest
    Created on : 09-Feb-2019, 18:07:23
    Author     : Ilhan Kalac
--%>

<%@page import="Models.Rezervacija"%>
<%@page import="RepoPattern.RezervacijaRepo"%>
<%@page import="Models.Klijent"%>
<%@page import="RepoPattern.MenadzerHotelaRepo"%>
<%@page import="RepoPattern.HotelRepo"%>
<%@page import="Models.Hotel"%>
<%@page import="Models.MenadzeriHotela"%>
<%@page import="RepoPattern.KlijentRepo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit klijent</title>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"> 
    </head>
    <style>
        * {box-sizing: border-box}
        body {
            font-family: Verdana, sans-serif; 
            margin:0; 
            width:500px;
        }

        /* Slideshow container */
        .slideshow-container {
            position: relative;
            background: #f1f1f1;
        }

        /* Slides */
        .mySlides {
            display: none;
            padding: 80px;
            text-align: center;

        }

        /* Next & previous buttons */
        .prev, .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            margin-top: -30px;
            padding: 16px;
            color: #888;
            font-weight: bold;
            font-size: 20px;
            border-radius: 0 3px 3px 0;
            user-select: none;
        }

        /* Position the "next button" to the right */
        .next {
            position: absolute;
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        /* On hover, add a black background color with a little bit see-through */
        .prev:hover, .next:hover {
            background-color: rgba(0,0,0,0.8);
            color: white;
        }

        /* The dot/bullet/indicator container */
        .dot-container {
            text-align: center;
            padding: 20px;
            background: #ddd;
        }

        /* The dots/bullets/indicators */
        .dot {
            cursor: pointer;
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
        }

        /* Add a background color to the active dot/circle */
        .active, .dot:hover {
            background-color: #717171;
        }

        /* Add an italic font style to all quotes */
        q {font-style: italic;}

        /* Add a blue color to the author */
        .author {color: cornflowerblue;}
        th, td { 
            padding:7px 

        }
    </style>
    <body style="width:100%;overflow:scroll;overflow-x: hidden;" onload="prikrijHotele();">
        <%@ include file="navbar.jsp" %> 
        <%            
            request.setAttribute("Klijent", new KlijentRepo().select(request.getParameter("Klijent_Id")));
            MenadzeriHotela mh = new MenadzerHotelaRepo().select(Integer.parseInt(request.getParameter("Klijent_Id")));
            String ulogovanaRola = "";
            if (request.getSession().getAttribute("UlogovanaRola") != null) {
                ulogovanaRola = "" + request.getSession().getAttribute("UlogovanaRola");
            }
            Klijent klijent = (Klijent) request.getAttribute("Klijent");
        %>

        <form style="width:50%;margin:0 auto;padding-top:2%;" action="EditKlijent" method="post" class="main-form needs-validation"  novalidate>
            <input value="<%= request.getParameter("Klijent_Id")%>" name="Klijent_Id" type="hidden">
            <%if (ulogovanaRola.equals("3")) {
                {%> 
                    <input type="hidden" name="HotelId" value="<%= mh.getHotelId()%>"> <%}
                }%>
            <div  class="slideshow-container" style="background:rgba(0,0,0,0.5); border-radius: 5px; color:white">
                <div class="mySlides" cellspacing="10" >
                    <table style=" text-align: right; margin-left:12px;" >
                        <h1>Osnovni podaci</h1> <br>
                        <tr>
                            <td style="padding-top:2%"><label>Ime: </label></td>
                            <td style="padding-left:2%">
                                <input required type="text" class="form-control" placeholder="Ime" value="<%= klijent.getIme()%>" name="Ime">
                                <div class="invalid-feedback">Unesite ime</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top:9%"><label> Prezime: </label></td>
                            <td style="padding-top:6%; padding-left:2%">
                                <input required type="text" class="form-control" placeholder="Prezime" value="<%= klijent.getPrezime()%>"  name="Prezime">
                                <div class="invalid-feedback">Unesite prezime
                                    <div class="invalid-feedback">Unesite prezime</div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top:9%"><label> Korisničko ime: </label></td>
                            <td style="padding-top:6%; padding-left:2%">
                                <input required type="text" class="form-control" placeholder="Korisnicko ime" value="<%= klijent.getKIme()%>"  name="KIme">
                                <div class="invalid-feedback">Unesite korisničko ime</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top:9%"><label> E-mail:</label></td>
                            <td style="padding-top:6%; padding-left:2%">
                                <input required type="text" class="form-control" placeholder="E-mail:" value="<%= klijent.getEmail()%>" name="Email">
                                <div class="invalid-feedback">Unesite email</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top:9%"><label> Telefon:</label></td>
                            <td style="padding-top:6%; padding-left:2%">
                                <input required type="text" class="form-control" placeholder="Telefon" value="<%= klijent.getTelefon()%>" name="Telefon">
                                <div class="invalid-feedback">Unesite telefon</div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="mySlides" cellspacing="10">
                    <table style="margin-top: -15%; text-align: right;margin-left:12px;">

                        <h1>Ostali podaci</h1> <br> <br> <br>

                        <tr>
                            <td style="padding-top:9%"><label> Adresa: </label></td>
                            <td style="padding-top:6%; padding-left:2%">
                                <input required type="text" class="form-control" placeholder="Adresa" value="<%= klijent.getAdresa()%>"  name="Adresa">
                                <div class="invalid-feedback">Unesite adresu</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top:9%"><label> Država: </label></td>
                            <td style="padding-top:6%; padding-left:2%">
                                <input required type="text" class="form-control" placeholder="Država" value="<%= klijent.getDrzava()%>"  name="Drzava">
                                <div class="invalid-feedback">Unesite državu</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top:9%"><label> Grad: </label></td>
                            <td style="padding-top:6%; padding-left:2%">
                                <input required type="text" class="form-control" placeholder="Grad" value="<%= klijent.getGrad()%>"  name="Grad">
                                <div class="invalid-feedback">Unesite grad</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top:9%"><label> Poštanski Broj: </label></td>
                            <td style="padding-top:6%; padding-left:2%">
                                <input required type="text" class="form-control" placeholder="Poštanski Broj" value="<%= klijent.getPostanskiBroj()%>" name="PostanskiBroj">
                                <div class="invalid-feedback">Unesite poštanski broj </div>
                            </td>
                        </tr>
                        <%if (new KlijentRepo().selectByUsername("" + request.getSession().getAttribute("ulogovan")).getRola().equals("2")) {%>
                        <tr>
                            <td style="padding-top:9%"><label> Poeni: </label></td>
                            <td style="padding-top:6%; padding-left:2%">
                                <input required type="text" class="form-control" placeholder="Poeni" value="<%= klijent.getPoeni()%>"  name="Poeni">
                                <div class="invalid-feedback">Unesite poene</div>
                            </td>
                        </tr> 
                        <%}%>
                    </table>
                </div>
                <div class="mySlides" cellspacing="10" >
                    <h1>Bezbednost</h1> <br> <br><br> <br>
                    <table style="margin-top: -15%; text-align: right"> 
                        <% if (new KlijentRepo().selectByUsername("" + request.getSession().getAttribute("ulogovan")).getRola().equals("2")) {%>
                        <tr>              
                            <td style=""> <label style="padding-bottom: 10px;"> Rola:</label> </td>
                            <td>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <input 
                                                <%if (klijent.getRola().equals("1")) {
                                                        {%>  checked ="checked" <%}
                                                  }%>                                                        
                                                name="Rola" value ="1" onclick="funkcija()"type="radio" class="btn btn-primary"> Klijent </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text btn btn-danger" >
                                            <input 
                                                <%if (klijent.getRola().equals("2")) {
                                                        {%>checked ="checked" <%}
                                                            }  %>
                                                name="Rola" value ="2" onclick="funkcija()" type="radio" class="btn btn-primary"> Administrator </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <input
                                                <%if (klijent.getRola().equals("3")) {
                                                        {%>checked ="checked" <%}
                                                }%>
                                                name="Rola" value ="3" type="radio" data-toggle="collapse" class ="btn btn-primary" data-target="#Demo" onclick="PrikaziHotele()"> Menadžer hotela </button>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <select id="showInDropDown" name="HotelId" class="form-control"  style="margin-right: 300px;">
                                    <option>Izaberite hotel </option>
                                    <%
                                        MenadzeriHotela menadzerHotela = new MenadzerHotelaRepo().select(klijent.getKlijentId());
                                        for (Hotel hotel : new HotelRepo().lista()) {
                                            {%>
                                        <option
                                            <%
                                            if (menadzerHotela.getKlijentId() != null)
                                                if (menadzerHotela.getHotelId() == hotel.getHotelId()) {
                                                    {%> selected <%}
                                                }%>
                                            value="<%=hotel.getHotelId()%>">
                                            <%=hotel.getNaziv()%> - <%=hotel.getDrzava()%> (<%=hotel.getAdresa()%>)
                                        </option>
                                        <%}
                                        }%>
                                        
                                </select><br>
                            </td>
                        </tr> 
                        <%}
                        %>
                    </table>
                    <table>

                        </form>
                        <tr>
                            <td style="width: 350px">
                                <form action="PromeniLozinku" method="post">
                                    <a data-toggle="collapse" data-target="#demo"><i class="fas fa-plus-circle fa-plus-circle fa-2x"> Promeni lozinku</i></a>
                                    <div class="form-group">
                                        <div id="demo" class="collapse"> <br>
                                            Stara lozinka: <input style="width:250px; margin-left: 50px"  type="text" name="StaraLozinka" class="form-control"> <br>
                                            Nova lozinka: <input style="width:250px; margin-left: 50px" type="text" name="NovaLozinka" class="form-control"> <br>
                                            <input type="submit" value="Promeni" class="btn btn-warning"> 
                                        </div>
                                    </div>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <input type="submit" value ="Izmeni" class="btn btn-secondary"> 
                </div>
                <a class="prev" onclick="plusSlides(-1);">❮</a>
                <a class="next" onclick="plusSlides(1);">❯</a>
            </div>
            <br><br>
            <form method="post" action="BrisanjeRezervacije">


                <div style="width:180%; margin-left:-40%">
                    <table  id="Tabela" class="table table-hover table-dark" style="font-size:80%;background-color: #32383e; color:black;  font-family: Roboto;">
                        <thead >
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Hotel</th>
                                <th scope="col">Datum dolaska</th>
                                <th scope="col">Datum odlaska</th>
                                <th scope="col">Novac</th>
                                <th scope="col">Broj odraslih</th>
                                <th scope="col">Broj dece</th>
                                <th scope="col">Broj sobe</th>
                                <th scope="col">Ime klijenta</th>
                                <th scope="col">Prezime klijenta</th>
                                <th scope="col">Vreme odlaska</th>
                                <th scope="col">Plaćena</th>
                                <th scope="col">Cena u poenima</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String EditKlijentID = request.getParameter("Klijent_Id");

                                int i = 1;
                                for (Rezervacija rezervacija : new RezervacijaRepo().lista()) {

                                    if ((Integer.parseInt(EditKlijentID) == rezervacija.getKlijentID())) {
                                      {%>
                                        <tr>
                                            <td> <%=i++%>  </td>
                                            <td><%=rezervacija.soba.Hotel.getNaziv()%> </td>
                                            <td><%=rezervacija.getDatumDolaska()%> </td>
                                            <td><%=rezervacija.getDatumOdlaska()%> </td>
                                            <td><%=rezervacija.getNovac()%> </td>
                                            <td><%=rezervacija.getBrojOdraslih()%> </td>
                                            <td><%=rezervacija.getBrojDece()%> </td>
                                            <td><%=rezervacija.soba.getBrojSobe()%> </td>
                                            <td><%=rezervacija.klijent.getIme()%> </td>
                                            <td><%=rezervacija.klijent.getPrezime()%> </td>
                                            <td><%=rezervacija.getVremeOdlaska()%> </td>
                                            <td><%=rezervacija.getStatusRezervacije()%> </td>
                                            <td><%=rezervacija.getPoeni()%> </td>

                                            <td> 
                                                <%
                                                if (new RezervacijaRepo().aktivnaRezervacija(rezervacija.getRezervacijaId())) {
                                                    %>
                                                    <button disabled="true" class="btn btn-success" style="font-weight: bold;  height: 35px; width: 100px;color:white;"> AKTIVNA </button>
                                                <%}
                                                else if (new RezervacijaRepo().isteklaRezervacija(rezervacija.getRezervacijaId())) {
                                                    %>
                                                    <button disabled="true" class="btn btn-warning" style="font-weight: bold;  height: 35px; width: 100px;color:white;"> ISTEKLA </button>

                                                <%}
                                                else {
                                                    %>
                                                    <a class="delete_link btn btn-danger" style="font-weight: bold;  height: 35px; width: 100px" href="${pageContext.request.contextPath}/BrisanjeRezervacije?Rezervacije_Id=<%= rezervacija.getRezervacijaId()%>&Novac=<%=rezervacija.getNovac()%>&Poeni=<%=rezervacija.getPoeni()%>&Profil=True">
                                                        OTKAŽI                         
                                                    </a>
                                                <%} %>
                                            </td>
                                        </tr>

                                    <%}
                                    }

                                }
                            %>

                       
                        <% String rezultatBrisanja = (String) request.getAttribute("rezultat");
                        if (rezultatBrisanja != null)
                            if (rezultatBrisanja.equals("true")) {%>
                                <script type="text/javascript">
                                    swal("Dobar  posao", "Uspesno brisanje", "success");
                                </script>

                            <%}   
                            else if (rezultatBrisanja.equals("false")) {%>

                                <script type="text/javascript">
                                    swal("Greska", "Pokusajte ponovo", "warning");
                                </script>

                            <%}%>
                    
                        </tbody>
                    </table>
                </div>
            </form>

            <%
                String rezultat = (String) request.getAttribute("rezultat");

                if (rezultat != null)
                    if (rezultat.equals("False")) {%>
                        <script type="text/javascript">
                            swal("Greška", "Uneli ste postojeće korisničko ime ili E-mail.", "error");
                        </script>
                    <%}
            %>    

            <script>
                function PrikaziHotele() {
                    document.getElementById("showInDropDown").style.visibility = "visible";
                }
                function prikrijHotele() {
                    document.getElementById("showInDropDown").style.visibility = "hidden";
                }
            </script>

            <%
                if (request.getAttribute("Promena") != null)
                    if (request.getAttribute("Promena").equals("True")) {%>
                        <script type="text/javascript">
                            swal("Uspeh!", "Uspešno ste promenili lozinku. ", "success")
                        </script>
                    <%}

                if (request.getAttribute("Promena") != null)
                    if (request.getAttribute("Promena").equals("False")) {%>
                        <script type="text/javascript">
                            swal("Greška!", "Uneli ste pogrešnu lozinku. ", "error")
                        </script>
                    <%} 

            %>
            <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
            <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('#Tabela').DataTable();
                });
            </script>
            <script src="jQuery.min.js"></script>
           
            <script>
                var slideIndex = 1;
                showSlides(slideIndex);

                function plusSlides(n) {
                    showSlides(slideIndex += n);
                }

                function currentSlide(n) {
                    showSlides(slideIndex = n);
                }

                function showSlides(n) {
                    var i;
                    var slides = document.getElementsByClassName("mySlides");
                    var dots = document.getElementsByClassName("dot");
                    if (n > slides.length) {
                        slideIndex = 1
                    }
                    if (n < 1) {
                        slideIndex = slides.length
                    }
                    for (i = 0; i < slides.length; i++) {
                        slides[i].style.display = "none";
                    }
                    for (i = 0; i < dots.length; i++) {
                        dots[i].className = dots[i].className.replace(" active", "");
                    }
                    slides[slideIndex - 1].style.display = "block";
                    dots[slideIndex - 1].className += " active";
                }
            </script>
            
            <script>
                var form = document.querySelector('.needs-validation');
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                });

            </script>
    </body>
</html>