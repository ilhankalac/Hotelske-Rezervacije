<%-- 
    Document   : Rezervacije
    Created on : Dec 24, 2018, 5:47:12 PM
    Author     : andreja
--%>

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
                      <th scope="col">Datum dolaska</th>
                      <th scope="col">Datum odlaska</th>
                      <th scope="col">Novac</th>
                      <th scope="col">Broj odraslih</th>
                      <th scope="col">Broj dece</th>
                      <th scope="col">Broj sobe</th>
                      <th scope="col">Ime klijenta</th>
                      <th scope="col">Prezime klijenta</th>
                      <th scope="col">Vreme odlaska</th>
                      <th scope="col">Status rezervacije</th>
                      <th scope="col">Cena u poenima</th>
                    </tr>
         </thead>
         <tbody>
         <%
             int  i = 1;
             for(Rezervacija rezervacija : new RezervacijaRepo().lista()){
                    { %>
                    
                        
                    <tr>
                      <td> <%= i++ %> </td>
                      <td><%=rezervacija.getDatumDolaska() %> </td>
                      <td><%=rezervacija.getDatumOdlaska() %> </td>
                      <td><%=rezervacija.getNovac() %> </td>
                      <td><%=rezervacija.getBrojOdraslih() %> </td>
                      <td><%=rezervacija.getBrojDece() %> </td>
                      <td><%=rezervacija.soba.getBrojSobe() %> </td>
                      <td><%=rezervacija.klijent.getIme() %> </td>
                      <td><%=rezervacija.klijent.getPrezime()%> </td>
                      <td><%=rezervacija.getVremeOdlaska() %> </td>
                      <td><%=rezervacija.getStatusRezervacije() %> </td>
                      <td><%=rezervacija.getPoeni()%> </td>
                      <td> 
                          
                         <a class="delete_link" style="color:red"
                                    href="${pageContext.request.contextPath}/BrisanjeRezervacije?Rezervacije_Id=<%= rezervacija.getRezervacijaId()%>&Novac=<%=rezervacija.getNovac()%>&Poeni=<%=rezervacija.getPoeni()%>">
                                   <i class="fa fa-trash"> Obriši</i>                                  
                         </a>
                      </td>
                    </tr>
                 
             <%}
             }
             %>
             
              <%
            String rezultat =(String) request.getAttribute("rezultat");
            
            if(rezultat!=null)
            if(rezultat.equals("true")){%>
            <script type="text/javascript">
                    swal("Dobar  posao", "Uspesno brisanje", "success");
                    
                   

            </script>
             
                     <%   }
            
            else if (rezultat.equals("false"))  {%>

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
