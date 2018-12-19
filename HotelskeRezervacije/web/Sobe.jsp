<%-- 
    Document   : Sobe
    Created on : 19-Dec-2018, 19:49:54
    Author     : Ilhan Kalac
--%>

<%@page import="RepoPattern.SobeRepo"%>
<%@page import="Models.Soba"%>
<%@page import="Models.Soba"%>
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
           String IDk = "";
           if(request.getSession().getAttribute("UlogovanaRola")!=null)
            IDk = (String)request.getSession().getAttribute("UlogovanaRola");
                for(Soba soba : new SobeRepo().lista())
               {
                   {%>
                    <div class="card" style="width: 18rem; float:left; margin:7.5px">              
                       <img height="180px" width="286px" src="PrikaziFotografije.jsp?hotelID=<%=soba.getFotografija()%>" />  
                       <div class="card-body">
                            <h5 class="card-title"> <%=soba.getBrojSobe()%></h5>
                            <p class="card-text">Hotel: <%=soba.getHotel().getNaziv()%> </p>
                            <p class="card-text">Tip sobe: <%=soba.getTipSobe().getNaziv()%> </p>
                            <p class="card-text">Kratak opis: <%=soba.getTipSobe().getKratkiOpis()%> </p>
                            <a href="#" class="btn btn-primary">Rezerviši</a>
                            <% if (IDk.equals("2")) {%> 
                                <a href="${pageContext.request.contextPath}/EditSoba.jsp?Hotel_Id=<%=soba.getSobaId()%>" class="btn btn-success">Izmeni</a>
                                <%}
                            %>
                        </div>   
                    </div>  
                   <%}
               }
            %>

    </body>
</html>
