<%-- 
    Document   : Registracija
    Created on : 10-Dec-2018, 21:41:48
    Author     : Ilhan Kalac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="KlijentController">
            Korisničko ime: <input type="text" name="KIme">  <br><br>
            Lozinka: <input type="text" name="Lozinka">  <br><br>
            Ime: <input type="text" name="Ime">  <br><br>
            Prezime: <input type="text" name="Prezime">  <br><br>
            Email: <input type="text" name="Email">  <br><br>
            Telefon: <input type="text" name="Telefon">  <br><br>
            Adresa: <input type="text" name="Adresa">  <br><br>
            Država: <input type="text" name="Drzava">  <br><br>
            Grad: <input type="text" name="Grad">  <br><br>
            Postanski broj: <input type="text" name="PostanskiBroj">  <br><br>
            
            <input type="submit" value="Registruj se">

        </form>
    </body>
</html>
