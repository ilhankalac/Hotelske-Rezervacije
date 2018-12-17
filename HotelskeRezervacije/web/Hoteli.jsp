<%-- 
    Document   : Hoteli
    Created on : 16-Dec-2018, 21:52:48
    Author     : Ilhan Kalac
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="RepoPattern.HotelRepo"%>
<%@page import="Models.Hotel"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hoteli</title>
    </head>
      <link rel="stylesheet" type="text/css" href="theme.css">
    <body>
        <jsp:include page="navbar.jsp" />  
        <%

           for(Hotel hotel : new HotelRepo().lista())
           {
               {%>
                <div class="card" style="width: 18rem;">
                    <img height="90px" width="160px" src="PrikaziFotografije.jsp?hotelID=<%=hotel.getHotelId()%>" /> 
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text"><%=hotel.getNaziv()%>.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                  </div>
               </div>      
               <%}
           }
        
        %>
    </body>
</html>
