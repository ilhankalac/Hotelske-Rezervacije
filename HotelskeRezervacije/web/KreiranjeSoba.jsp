<%-- 
    Document   : KreiranjeSoba
    Created on : 19-Dec-2018, 22:24:38
    Author     : Ilhan Kalac
--%>

<%@page import="RepoPattern.HotelRepo"%>
<%@page import="Models.Hotel"%>
<%@page import="Models.TipSobe"%>
<%@page import="RepoPattern.TipSobeRepo"%>
<%@page import="Models.Soba"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
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
            String HotelID = request.getParameter("Hotel_Id");
            ArrayList<TipSobe> tipoviSoba = new TipSobeRepo().lista(HotelID);             
            Hotel hotel = new HotelRepo().select(HotelID);
         %>
         
         <form action = "KreiranjeSoba" method="post" enctype="multipart/form-data">
             <input value="<%=hotel.getHotelId()%>" name="Hotel_Id" type="hidden">
             <h1><%=hotel.getNaziv() %></h1>
             Broj Sobe: <input type="text" name="BrojSobe"> <br> <br> 
             Tip Sobe: 
             <select name="TipSobe">
                 <%
                    for(TipSobe tipSobe:tipoviSoba){
                        {%> 
                            <option value="<%=tipSobe.getTipSobeId()%>"><%=tipSobe.getNaziv() %></option>
                        <%}
                    }
                 %> 
             </select>
             <br> </br>
             Opis: <input type="text" name="Opis"> <br> <br> 
             Kratki opis: <input type="text" name="KratkiOpis"> <br> <br> 
             Cena: <input type="text" name="Cena"> <br> <br>
             Cena u poenima: <input type="text" name="CenaUPoenima"> <br> <br>
             Kapacitet: <input type="text" name="Kapacitet"> <br> <br>
             Poeni: <input type="text" name="Poeni"> <br> <br>
             Fotografija: <input type="file" name="file"> <br> <br>
             <input type="submit" value="Kreiraj sobu">
             
         </form>
         
    </body>
</html>
