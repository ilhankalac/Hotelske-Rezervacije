<%-- 
    Document   : Placanje
    Created on : 22-Dec-2018, 18:56:56
    Author     : Ilhan Kalac
--%>

<%@page import="Models.Soba"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Plaćanje</title>
    </head>
    <style>
        th, td { 
            padding:7px;

        }
    </style>
    <body style="overflow:scroll; overflow-x: hidden;">

        <%@ include file="navbar.jsp" %>
        <br>
        <form action="Naplacivanje" method="post" style="border-radius: 5px;background:rgba(0,0,0,0.5); color:white; width:50%; margin:0 auto;">
            <center>
                <h2> Plaćanje  </h2>
                <table>
                    <tr>
                        <td> Vrsta kreditne kartice: </td>
                        <td> <select class="form-control" name="VrstaKartice">
                                <option value="Visa"> Visa </option>
                                <option value="Maestro"> Maestro </option>    
                                <option value="MasterCard"> MasterCard </option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Broj Kreditne kartice:</td>
                        <td> <input  class="form-control" style=" margin-right: 30%" class="form-control" type="number" name="BrojKartice" placeholder="XXXX-XXXX-XXXX-XXXX">  </td>
                    </tr>
                    <tr>
                        <td>Datum  isteka: (Mesec) </td>
                        <td><select  class="form-control" name="DatumIstekaMesec">
                                <%                    for (int i = 1; i <= 12; i++) {
                                    {%>
                                <option value="<%=i%>"> <%=i%> </option>
                                <%}
                                    }
                                %>
                                <input  class="form-control" type="hidden" value="<%=request.getAttribute("CenaUPoenima")%>" name="CenaUPoenima">   
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>Datum  isteka: (Godina) </td>
                        <td>
                            <select  class="form-control" name="DatumIstekaGodina">
                                <%
                                    for (int i = 2019; i <= 2030; i++) {
                                        {%>
                                <option value="<%=i%>"> <%=i%> </option>
                                <%}
                                    }
                                %>

                            </select>
                        </td>
                    </tr>


                </table>

                <input class="form-control" type="hidden" name="BrojPoena" value="<%=request.getAttribute("BrojPoena")%>">


                <br><br>
                <% if (request.getAttribute("Racun") != null) {
                    {%>
                <h2>Račun: <%=request.getAttribute("Racun")%> EUR.</h2> 
                <%}
                    }
                %>
                <br>

                <input style="width:50%" type="submit" name="NaplacivanjeNovcem" value="Potvrdi plaćanje" class="btn btn-success"> <br> <br>
                <hr style="height:1px; border:none; background-color: #000">
                
                <%
                    if (request.getAttribute("CenaUPoenima") != null)
                        if ((Integer) request.getSession().getAttribute("BrojPoenaKlijenta") >= (Integer) request.getAttribute("CenaUPoenima")) {
                            {%>
                <h4>Ili platite Starling poenima</h4>
                <h3>Vaše trenutan  broj poena: <%=request.getSession().getAttribute("BrojPoenaKlijenta")%></h3>

                <input style="width:50%" type="submit" value="Plati sa <%=request.getAttribute("CenaUPoenima")%> poena" class="btn btn-warning"> <br> <br>  
                 
                <%}
                } else {
                    {%> 
                   
                <h4>Plaćanje Starling poenima</h4>
                <h4>Nemate dovoljno poena, potrebno <%=request.getAttribute("CenaUPoenima")%> poena</h4>
                <h3>Vaš trenutan  broj poena: <%=request.getSession().getAttribute("BrojPoenaKlijenta")%></h3>
                <%}
                        }
                %>



                <%  if (request.getAttribute("poruka") != null) {
                        if (request.getAttribute("poruka").equals("True")) {
                            {%> 
                <script type="text/javascript">
                    swal("Dobar  posao", "Rezervacija uspela", "success")
                            .then(function () {
                                window.location = "Hoteli.jsp";
                            });
                    <%}
                    } else if (request.getAttribute("poruka").equals("False")) {
                        {%>
                    < script type = "text/javascript" >
                            swal("Dobar  posao", "Rezervacija uspešna", "success")
                            .then(function () {
                                window.location = "Hoteli.jsp";
                            });
                    <%}
                            }
                        }
                    %>
                </script>
            </center>
        </form>
        <br>

    </body>
</html>
