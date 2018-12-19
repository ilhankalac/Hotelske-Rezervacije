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
     
    <body>
        <jsp:include page="navbar.jsp" />  
        <%
           String IDk = "";
           if(request.getSession().getAttribute("UlogovanaRola")!=null)
            IDk = (String)request.getSession().getAttribute("UlogovanaRola");
           for(Hotel hotel : new HotelRepo().lista())
           {
               {%>
                <div class="card" style="width: 18rem; float:left; margin:7.5px">              
                    <img height="180px" width="286px" src="FotografijeHotela.jsp?hotelID=<%=hotel.getHotelId()%>" /> 
                    <div class="card-body">
                        <h5 class="card-title"> <%=hotel.getNaziv()%></h5>
                        <p class="card-text">Država: <%=hotel.getDrzava()%> </p>
                        <p class="card-text">Grad: <%=hotel.getGrad()%> </p>
                        <p class="card-text">Adresa: <%=hotel.getAdresa()%> </p>
                        <p class="card-text">Opis: <%=hotel.getOpis()%> </p>
                        <p class="card-text">Broj zvezdica: <%=hotel.getBrojZvezdica()%> </p>
                        
                        <% if (IDk.equals("2")) {%> 
                            <a href="${pageContext.request.contextPath}/Sobe.jsp?Hotel_Id=<%=hotel.getHotelId()%>" class="btn btn-primary">Pogledaj sobe</a>
                            <a href="${pageContext.request.contextPath}/EditHotel.jsp?Hotel_Id=<%=hotel.getHotelId()%>" class="btn btn-success">Izmeni</a>
                            <%}
                        %>
                        
                    </div>   
                </div>  
               <%}
           }
        %>
    </body>
</html>
