<%-- 
    Document   : Rezervacije
    Created on : Dec 24, 2018, 5:47:12 PM
    Author     : andreja
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="RepoPattern.KlijentRepo"%>
<%@page import="Models.Klijent"%>
<%@page import="RepoPattern.RezervacijaRepo"%>
<%@page import="Models.Rezervacija"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rezervacije</title>
    </head>
    <body>
        <form method="post" action="BrisanjeRezervacije">

            <jsp:include page="navbar.jsp" />  
            <div style="padding-left:10%; padding-right: 10%;">
                <table class="table table-hover table-dark" style="background-color: #32383e; color:white;  font-family: Roboto;">
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
                            Klijent klijent = new KlijentRepo().selectByUsername((String) request.getSession().getAttribute("ulogovan"));

                            int i = 1;
                            ArrayList<Rezervacija> rezervacije;
                            if (klijent.getRola().equals("2")) {
                                rezervacije = new RezervacijaRepo().lista();
                            } else {
                                rezervacije = new RezervacijaRepo().rezervacijeMenadzerovihHotela(klijent.getKlijentId());
                            }

                            for (Rezervacija rezervacija : rezervacije) {
                                if (klijent.getRola().equals("2") || klijent.getRola().equals("3")) {
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
                                   href="${pageContext.request.contextPath}/BrisanjeRezervacije?Rezervacije_Id=<%= rezervacija.getRezervacijaId()%>&Novac=<%=rezervacija.getNovac()%>&Poeni=<%=rezervacija.getPoeni()%>">
                                    <i class="fa fa-trash"> Obriši</i>                                  
                                </a>
                                <%} %>
                            </td>
                        </tr>

                        <%}
                        } else if (klijent.getRola().equals("1")) {
                            if (klijent.getKlijentId() == rezervacija.getKlijentID()) {
                                {%>
                        <tr>
                            <td> <%= klijent.getRola()%>  </td>
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
                                   href="${pageContext.request.contextPath}/BrisanjeRezervacije?Rezervacije_Id=<%= rezervacija.getRezervacijaId()%>&Novac=<%=rezervacija.getNovac()%>&Poeni=<%=rezervacija.getPoeni()%>">
                                    <i class="fa fa-trash"> Obriši</i>                                  
                                </a>
                                <%} %>
                            </td>
                        </tr>

                        <%}
                                    }
                                }
                            }
                        %>

                        <%
                            String rezultat = (String) request.getAttribute("rezultat");

                            if (rezultat != null)
                                if (rezultat.equals("true")) {%>
                    <script type="text/javascript">
                        swal("Dobar  posao", "Uspesno brisanje", "success");



                    </script>

                    <%   } else if (rezultat.equals("false")) {%>

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
