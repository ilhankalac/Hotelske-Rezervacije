<%-- 
    Document   : Klijenti
    Created on : 14-Dec-2018, 21:37:19
    Author     : Ilhan Kalac
--%>

<%@page import="RepoPattern.KlijentRepo"%>
<%@page import="Models.Klijent"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    
    <style>
        .table-hover thead tr:hover th, .table-hover tbody tr:hover td {
            color: black;
            background-color: lightgrey;
        
        }
      
    </style>
    <body>
          
        <jsp:include page="navbar.jsp" />  
        <div style="padding-left:10%; padding-right: 10%;">
        <table class="table table-hover table-dark" style="background-color: #32383e; color:white;  font-family: Roboto;">
         <thead>
                    <tr>
                      <th scope="col">#</th>
                      <th scope="col">Ime</th>
                      <th scope="col">Prezime</th>
                      <th scope="col">Korisničko ime</th>
                      <th scope="col">E-mail</th>
                      <th scope="col">Telefon</th>
                      <th scope="col">Adresa</th>
                      <th scope="col">Država</th>
                      <th scope="col">Grad</th>
                      <th scope="col">Rola</th>
                      <th scope="col">Poeni</th>
                      <th scope="col">HotelID</th>
                      <th scope="col">Postanski Broj</th>
                      <th scope="col">Opcije</th>
                    </tr>
         </thead>
         <tbody>
         <%
             int  i = 1;
             for(Klijent klijent: new KlijentRepo().ListaKlijenata()){ { %>

                    <tr>
                      <td> <%= i++ %> </td>
                      <td><%=klijent.getIme() %> </td>
                      <td><%=klijent.getPrezime()%> </td>
                      <td><%=klijent.getKIme()%> </td>
                      <td><%=klijent.getEmail()%> </td>
                      <td><%=klijent.getTelefon()%> </td>
                      <td><%=klijent.getAdresa()%> </td>
                      <td><%=klijent.getDrzava()%> </td>
                      <td><%=klijent.getGrad()%> </td>
                      <td><%=klijent.getVrsta()%> </td>
                      <td><%=klijent.getPoeni()%> </td>
                      <td><%=klijent.getHotelID()%> </td>
                      <td><%=klijent.getPostanskiBroj()%> </td>
                      <td> 
                          
                         <a class="delete_link"
                                    href="${pageContext.request.contextPath}/EditKlijent.jsp?Klijent_Id=<%= klijent.getKlijentId()%>" >
                                   <i class="fa fa-trash"> Izmeni</i>                                  
                         </a>
                         <a class="delete_link" style="color:red"
                                    href="${pageContext.request.contextPath}/Klijenti?Klijent_Id=<%= klijent.getKlijentId()%>" >
                                   <i class="fa fa-trash"> Obriši</i>                                  
                         </a>
                      </td>
                    </tr>
                 
             <%}
             }
             
             %>
          </tbody>
         </table>
        </div>
    </body>
</html>
