<%-- 
    Document   : EditKlijent
    Created on : 15-Dec-2018, 17:14:14
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
    <body>
        <jsp:include page="navbar.jsp" />  
        <% 
            request.setAttribute("Klijent", new KlijentRepo().klijent(request.getParameter("Klijent_Id")));
            Klijent klijent = (Klijent)request.getAttribute("Klijent");
        %>
        <form action="EditKlijent" method="post">
            <input value="<%= request.getParameter("Klijent_Id")%>" name="Klijent_Id" type="hidden">
           <div style="padding-left:5%">
               <div class="input-group mb-3" >
               <div class="input-group-prepend">
                     <span class="input-group-text" id="basic-addon1"> Ime:</span>
               </div>
                   <input type="text" class="form-control" placeholder="Ime" aria-label="Username" aria-describedby="basic-addon1"
                         value="<%= klijent.getIme() %>" name="Ime">
               </div> <br>
               <div class="input-group mb-3">
               <div class="input-group-prepend">
                     <span class="input-group-text" id="basic-addon1"> Prezime:</span>
               </div>
                  <input type="text" class="form-control" placeholder="Prezime" aria-label="Username" aria-describedby="basic-addon1"
                         value="<%= klijent.getPrezime() %>"  name="Prezime">
               </div>
               <br>
               <div class="input-group mb-3">
               <div class="input-group-prepend">
                     <span class="input-group-text" id="basic-addon1"> Korisničko ime:</span>
               </div>
                  <input type="text" class="form-control" placeholder="Korisničko ime" aria-label="Username" aria-describedby="basic-addon1"
                         value="<%= klijent.getKIme() %>"  name="KIme">
               </div>
               <br>
               <div class="input-group mb-3">
               <div class="input-group-prepend">
                     <span class="input-group-text" id="basic-addon1"> E-mail:</span>
               </div>
                   <input type="text" class="form-control" placeholder="Email:" aria-label="Username" aria-describedby="basic-addon1"
                          value="<%= klijent.getEmail()%>" name="Email">
               </div>
               <br>
               <div class="input-group mb-3">
               <div class="input-group-prepend">
                     <span class="input-group-text" id="basic-addon1"> Telefon:</span>
               </div>
                  <input type="text" class="form-control" placeholder="Telefon" aria-label="Username" aria-describedby="basic-addon1"
                         value="<%= klijent.getTelefon() %>" name="Telefon">
               </div>
                <br>
               <div class="input-group mb-3">
               <div class="input-group-prepend">
                     <span class="input-group-text" id="basic-addon1"> Adresa: </span>
               </div>
                  <input type="text" class="form-control" placeholder="Adresa" aria-label="Username" aria-describedby="basic-addon1"
                         value="<%= klijent.getAdresa() %>"  name="Adresa">
               </div>
                 <br>
               <div class="input-group mb-3">
               <div class="input-group-prepend">
                     <span class="input-group-text" id="basic-addon1"> Država: </span>
               </div>
                  <input type="text" class="form-control" placeholder="Država" aria-label="Username" aria-describedby="basic-addon1"
                         value="<%= klijent.getDrzava()%>"  name="Drzava">
               </div>
                   <br>
               <div class="input-group mb-3">
               <div class="input-group-prepend">
                     <span class="input-group-text" id="basic-addon1"> Grad: </span>
               </div>
                   <input type="text" class="form-control" placeholder="Grad" aria-label="Username" aria-describedby="basic-addon1"
                          value="<%= klijent.getGrad()%>"  name="Grad">
               </div>
               <br>
               <div class="input-group mb-3">
               <div class="input-group-prepend">
                     <span class="input-group-text" id="basic-addon1"> Rola: </span>
               </div>
                  <input type="text" class="form-control" placeholder="Rola" aria-label="Username" aria-describedby="basic-addon1"
                         value="<%= klijent.getVrsta()%>"  name="Rola">
               </div>

               <br>
               <div class="input-group mb-3">
               <div class="input-group-prepend">
                     <span class="input-group-text" id="basic-addon1"> Poeni: </span>
               </div>
                  <input type="text" class="form-control" placeholder="Poeni" aria-label="Username" aria-describedby="basic-addon1"
                         value="<%= klijent.getPoeni()%>"  name="Poeni">
               </div>

               <br>
               <div class="input-group mb-3">
               <div class="input-group-prepend">
                     <span class="input-group-text" id="basic-addon1"> HotelID: </span>
               </div>
                  <input type="text" class="form-control" placeholder="HotelID" aria-label="Username" aria-describedby="basic-addon1"
                         value="<%= klijent.getHotelID()%>" name="HotelID">
               </div>
               <br>
               <div class="input-group mb-3">
               <div class="input-group-prepend">
                     <span class="input-group-text" id="basic-addon1"> Poštanski Broj: </span>
               </div>
                  <input type="text" class="form-control" placeholder="Poštanski Broj" aria-label="Username" aria-describedby="basic-addon1"
                         value="<%= klijent.getPostanskiBroj()%>" name="PostanskiBroj">
               </div>
               <br> <br>
                <input type="submit" value ="Izmeni">
                <br><br>
           </div>
        </form>
        
        <%
            String rezultat =(String) request.getAttribute("rezultat");
            
            if(rezultat!=null)
            if(rezultat.equals("False")){%>
            <script type="text/javascript">
                    swal("Greška", "Uneli ste postojeće korisničko ime ili E-mail.", "error");
            </script>
             
                     <%   }
             %>
    </body>
</html>
