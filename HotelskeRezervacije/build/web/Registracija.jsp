<%-- 
    Document   : Registracija
    Created on : 10-Dec-2018, 21:41:48
    Author     : Ilhan Kalac
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="sr">
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
   

    <body>
        <% 
            HttpSession sesija = request.getSession();
            
            if(sesija.getAttribute("ulogovan")!=null)
                response.sendRedirect("index.jsp");
        %>
        
        
        <jsp:include page="navbar.jsp" /> 
        <%
            String rezultat =(String) request.getAttribute("rezultat");
            
            if(rezultat!=null)
            if(rezultat.equals("True")){%>
            <script type="text/javascript">
                    swal("Dobar  posao", "Registracija uspela", "success")
                    .then(function() {
                        window.location = "index.jsp";
                    });

            </script>
             
                     <%   }
            
            else if (rezultat.equals("False"))  {%>

                   <script type="text/javascript">
                        swal("Greška", "Uneli ste postojeće korisničko ime ili E-mail.", "error")
                       .then(function() {
                           window.location = "Registracija.jsp";
                       });
                   </script>

            <% }%>
            
        
        <h1>Hello World!</h1>
    <center>
        <form action="KlijentController">
            Korisničko ime: <input oninvalid="this.setCustomValidity('Neophodno popuniti polje  za  korisničko ime. Min dužina 6 karaktera')" required minLength="6" type="text" name="KIme">  <br><br>
            Lozinka: <input oninvalid="this.setCustomValidity('Neophodna lozinka. Min dužina 6 karaktera')" required minLength="6" type="password" type="text" name="Lozinka">  <br><br>
            Ime: <input oninvalid="this.setCustomValidity('Neophodno polje za ime. Min dužina 2 karaktera)" required minLength="2" type="text" name="Ime">  <br><br>
            Prezime: <input oninvalid="this.setCustomValidity('Neophodno popuniti polje za prezime. Min dužina 2 karaktera')" required minLength="6" type="text" name="Prezime">  <br><br>
            Email: <input oninvalid="this.setCustomValidity('Neispravna email adresa')" required  type="email" name="Email">  <br><br>
            Telefon: <input oninvalid="this.setCustomValidity('Neophodno popuniti polje za telefon.(06xxxxxxx)')" required minLength="9" minLength="11" type="text" name="Telefon">  <br><br>
            Adresa: <input oninvalid="this.setCustomValidity('Neophodno popuniti polje za adresu')" required minLength="6" type="text" name="Adresa">  <br><br>
            Država: <input oninvalid="this.setCustomValidity('Neophodno popuniti polje za državu')" required minLength="3" type="text" name="Drzava">  <br><br>
            Grad: <input oninvalid="this.setCustomValidity('Neophodno popuniti polje za grad')" required minLength="6" type="text" name="Grad">  <br><br>
            Poštanski broj: <input  oninvalid="this.setCustomValidity('Neophodno popuniti polje za poštanski broj')" required minLength="6" maxlength="6" type="text" name="PostanskiBroj">  <br><br>
            <input id ="button-a" type="submit" value="Registruj se">
        </form>
    </center>
    </body>
</html>

