<%-- 
    Document   : Hoteli
    Created on : 16-Dec-2018, 19:26:44
    Author     : Ilhan Kalac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hoteli</title>
    </head>
    <body>
         <jsp:include page="navbar.jsp" /> 
         <form action = "KreiranjeHotela" method="post" enctype="multipart/form-data">

             Naziv: <input type="text" name="Naziv"> <br> <br> 
             Država: <input type="text" name="Drzava"> <br> <br> 
             Grad: <input type="text" name="Grad"> <br><br> 
             Adresa: <input type="text" name="Adresa"> <br> <br> 
             Broj zvezdica: <input type="text" name="Zvezdice"> <br>  <br> 
             Fotografija: <input type="file" name="file"> <br> <br>
             
             <input type="submit" value="Kreiraj">
             
         </form>
         
    </body>
</html>