<%-- 
    Document   : RezervisiTest
    Created on : 08-Feb-2019, 22:42:27
    Author     : Ilhan Kalac
--%>

<%@page import="RepoPattern.RezervacijaRepo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.Rezervacija"%>
<%@page import="Models.Soba"%>
<%@page import="RepoPattern.SobeRepo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="navbar.jsp" %> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        body {
            overflow: scroll;
        }
    </style>
    <body>
        <%    ArrayList<Rezervacija> aktivneRezervacije = new RezervacijaRepo().aktivneRezervacije(request.getParameter("Soba_Id"));
        %>

        <div class="card-body" style="width:980px; margin:0% auto; padding-top:5%; background:rgba(0,0,0,0.5)">
            <div class="row">
                <div class="col">


                    <%
                        String IDk = "";
                        //Integer HoteliId = new SobeRepo().hoteliIdSobe(request.getParameter("Soba_Id"));

                        Soba soba = new SobeRepo().select(request.getParameter("Soba_Id"));
                        if (request.getSession().getAttribute("UlogovanaRola") != null) {
                            IDk = (String) request.getSession().getAttribute("UlogovanaRola");
                        }

                        {%>

                    <div  class="card" style="background:rgba(0,0,0,0.0); border: solid black 1px;color: white; width: 18rem; float:left; margin:7.5px"> 
                        <div class="card-header">
                            <h5 class="card-title"> <%=soba.getHotel().getNaziv()%> - <%=soba.getBrojSobe()%> - <%=soba.getTipSobe().getNaziv()%></h5>
                        </div>
                        <img height="180px" width="286px" src="FotografijeSoba.jsp?SobaId=<%=soba.getSobaId()%>" />  
                        <div class="card-body">
                            <p class="card-text">Opis: <%=soba.getOpis()%> - <%=soba.getKratkiOpis()%>  </p>
                            <p class="card-text">Vredi poena: <%= soba.getPoeni()%>, Kapacitet <%= soba.getKapacitet()%> </p>
                            <p style="font-size:20px" class="card-text">Cena: <%=soba.getCena()%> €, <%= soba.getCenaUPoenima()%> poena </p>
                        </div>   
                    </div>  
                    <%}

                    %>
                </div>
                <div class="col">

                    <% int sobaMaxKapacitet = new SobeRepo().maxKapacitetSobe(request.getParameter("Soba_Id"));%>

                    <form style="color:white; margin:0 auto;" action = "KreiranjeRezervacije" method="post"  >
                        <input type="hidden" value="<%=soba.getCena()%>" name="CenaSobe"> 
                        Datum dolaska:  
                        <input type="date" name="DatumDolaska" class="form-control" style="width:250px" onkeydown="return false">                      
                        Datum odlaska:  
                        <input type="date" name="DatumOdlaska" class="form-control" style="width:250px" onkeydown="return false">  
                        <br>
                        Vreme odlaska:
                        <input type="time" name="VremeOdlaska" class="form-control" style="width:250px" onkeydown="return false">  <br> 
                        <input type="hidden" value="<%=request.getParameter("Soba_Id")%>" name="Soba_Id">
                        Broj dece: 
                        <select name="BrojDece" class="custom-select" style="width:50px">

                            <% for (int i = 0; i <= sobaMaxKapacitet; i++) {
                                    {%>
                            <option value="<%=i%>"> <%=i%> </option>
                            <%}
                                }
                            %>
                        </select>
                        <br> </br>
                        Broj odraslih:
                        <select name="BrojOdraslih" class="custom-select" style="width:50px">

                            <% for (int i = 1; i <= sobaMaxKapacitet; i++) {
                                    {%>
                            <option value="<%=i%>"> <%=i%> </option>
                            <%}
                                }
                            %>
                        </select>
                        <br> </br> 
                        <input type="submit" value="Idi na plaćanje" class="btn btn-success"></a>
                    </form>

                </div>       
                <div class="col">


                    <div class="list-group" style="width: 300px;">
                        <button type="button" class="list-group-item list-group-item-action" style="background-color: red">
                            Trenutne rezervacije sobe
                        </button>
                        <%  int brojac = 1;
                            for (Rezervacija rezervacija : aktivneRezervacije) {
                                int godinaDolaska = Integer.parseInt(rezervacija.getDatumDolaska().substring(0, 4));
                                int mesecDolaska = Integer.parseInt(rezervacija.getDatumDolaska().substring(5, 7));
                                int danDolaska = Integer.parseInt(rezervacija.getDatumDolaska().substring(8, 10));

                                int godinaOdlaska = Integer.parseInt(rezervacija.getDatumOdlaska().substring(0, 4));
                                int mesecOdlaska = Integer.parseInt(rezervacija.getDatumOdlaska().substring(5, 7));
                                int danOdlaska = Integer.parseInt(rezervacija.getDatumOdlaska().substring(8, 10));
                                {%> 

                        <button type="button" class="list-group-item list-group-item-action"> <%=brojac++%>.
                            <%=danDolaska%>.<%=mesecDolaska%>.<%=godinaDolaska%> - <%=danOdlaska%>.<%=mesecOdlaska%>.<%=godinaOdlaska%> : <%=rezervacija.getVremeOdlaska()%> </button>
                            <%}
                                }
                            %>

                    </div>
                </div>
            </div>
            <div class="card-footer " style="margin-bottom:20px;">

            </div>

        </div>
    </body>
</html>
<%
    String rezultat = (String) request.getAttribute("Greska");

    if (rezultat != null)
        if (rezultat.equals("False")) {%>
<script type="text/javascript">
    swal("Neispravno popunjeni podaci rezervacije", "Rezervacija nije uspela", "error")
            .then(function () {

            });

</script> <%}
%>
