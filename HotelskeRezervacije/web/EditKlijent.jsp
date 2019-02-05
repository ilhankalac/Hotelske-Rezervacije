<%-- 
    Document   : EditKlijent
    Created on : 15-Dec-2018, 17:14:14
    Author     : Ilhan Kalac
--%>

<%@page import="Models.Rezervacija"%>
<%@page import="RepoPattern.RezervacijaRepo"%>
<%@page import="RepoPattern.MenadzerHotelaRepo"%>
<%@page import="Models.MenadzeriHotela"%>
<%@page import="RepoPattern.HotelRepo"%>
<%@page import="Models.Hotel"%>
<%@page import="Models.Hotel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="RepoPattern.KlijentRepo"%>
<%@page import="Models.Klijent"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="navbar.jsp" %> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script src="jQuery.min.js"> </script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"> 
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"> </script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"> </script>
        <script type="text/javascript">
                $(document).ready( function () {
                 $('#Tabela').DataTable();
             } );
        </script>
    </head>
    <style>
        select {
            visibility: hidden;
        }</style>
    <body>
       
        <%
            request.setAttribute("Klijent", new KlijentRepo().select(request.getParameter("Klijent_Id")));
            MenadzeriHotela mh = new MenadzerHotelaRepo().select(Integer.parseInt(request.getParameter("Klijent_Id")));
            String ulogovanaRola ="";
            if( request.getSession().getAttribute("UlogovanaRola")!=null)
                ulogovanaRola =(String) request.getSession().getAttribute("UlogovanaRola");
            Klijent klijent = (Klijent) request.getAttribute("Klijent");
        %>
        <form action="EditKlijent" method="post">
            <input value="<%= request.getParameter("Klijent_Id")%>" name="Klijent_Id" type="hidden">
            <%if (ulogovanaRola.equals("3")){  {%> 
            <input type="hidden" name="HotelId" value="<%= mh.getHotelId()%>"> <%} }%>
            <div style="padding-left:5%">

                <div class="row" >
                    <div class="col"> 
                        <table style="margin-top: -15%; text-align: right">
                            <tr>
                            <div class="form-inline">
                                <td style="padding-top:2%"><label>Ime: </label></td>
                                <td style="padding-left:2%"><input type="text" class="form-control" placeholder="Ime" value="<%= klijent.getIme()%>" name="Ime"></td>
                            </div>
                            </tr>

                            <br>
                            <tr>
                            <div class="form-inline">
                                <td style="padding-top:9%"><label> Prezime: </label></td>
                                <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Prezime" value="<%= klijent.getPrezime()%>"  name="Prezime"></td>
                            </div>
                            </tr>
                            <br>
                            <tr>
                            <div class="form-inline">
                                <td style="padding-top:9%"><label> Korisnicko ime: </label></td>
                                <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Korisnicko ime" value="<%= klijent.getKIme()%>"  name="KIme"></td>
                            </div>
                            </tr>
                            <br>
                            <tr>
                            <div class="form-inline">
                                <td style="padding-top:9%"><label> E-mail:</label></td>
                                <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="E-mail:" value="<%= klijent.getEmail()%>" name="Email"></td>
                            </div>
                            </tr>
                            <br>
                            <tr>
                            <div class="form-inline">
                                <td style="padding-top:9%"><label> Telefon:</label></td>
                                <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Telefon" value="<%= klijent.getTelefon()%>" name="Telefon"></td>
                            </div>
                            </tr>
                            <br>
                            <tr>
                            <div class="form-inline">
                                <td style="padding-top:9%"><label> Adresa: </label></td>
                                <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Adresa" value="<%= klijent.getAdresa()%>"  name="Adresa"></td>
                            </div>
                            </tr>
                            <br>
                            <tr>
                            <div class="form-inline">
                                <td style="padding-top:9%"><label> Država: </label></td>
                                <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Država" value="<%= klijent.getDrzava()%>"  name="Drzava"></td>
                            </div>
                            </tr>
                            <br>
                            <tr>
                            <div class="form-inline">
                                <td style="padding-top:9%"><label> Grad: </label></td>
                                <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Grad" value="<%= klijent.getGrad()%>"  name="Grad"></td>
                            </div>
                            </tr>
                            <br>
                            <% if (new KlijentRepo().selectByUsername((String) request.getSession().getAttribute("ulogovan")).getRola().equals("2")) {%>
                            <tr>              
                                <td style="padding-top:9%"> <label> Rola:</label> </td>
                                <td>

                                    <input 
                                        <%if (klijent.getRola().equals("1")) {
                                                {%>checked ="checked" <%}
                                                    }  %>
                                        name="Rola" value ="1" onclick="funkcija()"type="radio" class="btn btn-primary"> Klijent </button>
                                    <input
                                        <%if (klijent.getRola().equals("2")) {
                                                {%>checked ="checked" <%}
                                                    }  %>
                                        name="Rola" value ="2" onclick="funkcija()" type="radio" class="btn btn-primary"> Administrator </button>
                                    <input
                                        <%if (klijent.getRola().equals("3")) {
                                                {%>checked ="checked" <%}
                                                    }  %>
                                        name="Rola" value ="3" type="radio" data-toggle="collapse" class ="btn btn-primary" data-target="#Demo" onclick="myFunction()"> Menadžer hotela </button>

                                </td>
                            </tr>    
                            <tr>
                                <td style="padding-top:9%"> </td>
                                <td style="padding-top:6%; padding-left:2%">
                                    <select id="showInDropDown" name="HotelId" class="form-control">
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
                                            <%=hotel.getNaziv()%> - <%=hotel.getDrzava()%> (<%=hotel.getAdresa()%>)</option>

                                        <%}

                                            }
                                        %>
                                    </select>
                                </td>
                            </tr> 
                            <%}
                            %>
                            <br>  
                            <%if (new KlijentRepo().selectByUsername((String) request.getSession().getAttribute("ulogovan")).getRola().equals("2")) {%>  
                            <tr>
                            <div class="form-inline">
                                <td style="padding-top:9%"><label> Poeni: </label></td>
                                <td style="padding-top:6%; padding-left:2%">
                                    <input type="text" class="form-control" placeholder="Poeni" value="<%= klijent.getPoeni()%>"  name="Poeni"></td>
                            </div>
                            </tr> 
                            <%}
                            %>
                            <br>
                            <tr>
                            <div class="form-inline">
                                <td style="padding-top:9%"><label> Poštanski Broj: </label></td>
                                <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Poštanski Broj" value="<%= klijent.getPostanskiBroj()%>" name="PostanskiBroj"></td>
                            </div>
                            </tr>
                        </table> <br>
                        <input type="submit" value ="Izmeni" class="btn btn-secondary">
                    </div> 
                </div>
        </form>

        <div class="col" style="margin-top:3%;">
            <form action="PromeniLozinku" method="post">
                <a data-toggle="collapse" data-target="#demo"><i class="fas fa-plus-circle fa-plus-circle fa-2x"> Promeni lozinku</i> </a>
                <div class="form-group">
                    <div id="demo" class="collapse"> <br>
                        Stara lozinka: <input style="width:250px"  type="text" name="StaraLozinka" class="form-control"> <br>
                        Nova lozinka: <input style="width:250px" type="text" name="NovaLozinka" class="form-control"> <br>
                        <input type="submit" value="Promeni" class="btn btn-warning"> 
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%
        String rezultat = (String) request.getAttribute("rezultat");

        if (rezultat != null)
            if (rezultat.equals("False")) {%>
    <script type="text/javascript">
        swal("Greška", "Uneli ste postojeće korisničko ime ili E-mail.", "error");
    </script>

    <%   }
    %>

    <script>
        function myFunction() {
            document.getElementById("showInDropDown").style.visibility = "visible";
        }
        function funkcija() {
            document.getElementById("showInDropDown").style.visibility = "hidden";
        }
    </script>
    <form method="post" action="BrisanjeRezervacije">


        <div style="width:90%; margin-left:5%">
            <table  id="Tabela" class="table table-hover table-dark" style="background-color: #32383e; color:black;  font-family: Roboto;">
                <thead>
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
                        Klijent klijent1 = new KlijentRepo().selectByUsername((String) request.getSession().getAttribute("ulogovan"));

                        int i = 1;
                        for (Rezervacija rezervacija : new RezervacijaRepo().lista()) {

                            if (klijent1.getKlijentId() == rezervacija.getKlijentID()) {
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
                            <button disabled="true" class="btn btn-success"> Aktivna </button>
                            <% } else if (new RezervacijaRepo().isteklaRezervacija(rezervacija.getRezervacijaId())) {
                            %>
                            <button disabled="true" class="btn btn-warning"> Istekla </button>

                            <%} else {
                            %>
                            <a class="delete_link" style="color:red"
                               href="${pageContext.request.contextPath}/BrisanjeRezervacije?Rezervacije_Id=<%= rezervacija.getRezervacijaId()%>&Novac=<%=rezervacija.getNovac()%>&Poeni=<%=rezervacija.getPoeni()%>&Profil=True">
                                <i class="fa fa-trash"> Obriši</i>                                  
                            </a>
                            <%} %>
                        </td>
                    </tr>

                    <%}
                            }

                        }
                    %>

                    <%
                        String rezultat1 = (String) request.getAttribute("rezultat");

                        if (rezultat1 != null)
                            if (rezultat1.equals("true")) {%>
                <script type="text/javascript">
                    swal("Dobar  posao", "Uspesno brisanje", "success");



                </script>

                <%   } else if (rezultat1.equals("false")) {%>

                <script type="text/javascript">
                    swal("Greska", "Pokusajte ponovo", "warning");
                </script>

                <% }%>
                </tbody>
            </table>
        </div>
    </form>




</body>
</html>
<%
    if (request.getAttribute("Promena") != null)
        if (request.getAttribute("Promena").equals("True")) {%>
<script type="text/javascript">
    swal("Uspeh!", "Uspešno ste promenili lozinku. ", "success")

</script>

<%   }

    if (request.getAttribute("Promena") != null)
        if (request.getAttribute("Promena").equals("False")) {%>
<script type="text/javascript">
    swal("Greška!", "Uneli ste pogrešnu lozinku. ", "error")

</script>
<%}

%>
