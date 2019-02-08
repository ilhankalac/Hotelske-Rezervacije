<%-- 
    Document   : TestHotel
    Created on : 07-Feb-2019, 23:07:30
    Author     : Ilhan Kalac
--%>

<%@page import="RepoPattern.HotelRepo"%>
<%@page import="Models.Hotel"%>
<%@page import="Models.Hotel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body style="overflow:scroll;">
        <%@ include file="navbar.jsp" %> 
    <center>
        <br>



        <div class="input-group " style="width:450px">
            <span class="input-group-text" id="basic-addon1" for="validationServer03"> <i class="fas fa-search"> </i> </span>
            <input  type="text" id="myInput" onkeyup="myFunction()"  placeholder="Pretraga hotela..." class="form-control">
        </div>
        <br>
        <ul id="myUL" class="list-unstyled">
            <%                String UlogovanaRola = "";
                if (request.getSession().getAttribute("UlogovanaRola") != null) {
                    UlogovanaRola = "" + (request.getSession().getAttribute("UlogovanaRola"));
                }
            %>
            <%for (Hotel hotel : new HotelRepo().lista()) {%>

            <li>
                <div  class="card" style="border-radius:10px;color:white;width:60rem; background: rgba(0,0,0,0.3); margin-bottom: 20px" >
                    <div class="card-header">
                        <h3> <%=hotel.getNaziv()%> </h3>
                    </div>
                    <div class="card-body">
                        <div class="row">

                            <div class="col">
                                <img  src="FotografijeHotela.jsp?hotelID=<%=hotel.getHotelId()%>"  class="card-img" alt="...">
                            </div>
                            <div class="col">
                                <a>
                                    <span style="visibility: hidden; font-size: 0px"><%= hotel.getNaziv()%></span>
                                    <div class="card"  align="left" style="width: 18rem;background: rgba(0,0,0,0.3);">
                                        <p class="card-text">Država: <%=hotel.getDrzava()%> </p>
                                        <p class="card-text">Grad:  <%=hotel.getGrad()%> </p>
                                        <p class="card-text">Adresa: <%=hotel.getAdresa()%> </p>
                                        <p class="card-text">Opis: <%=hotel.getOpis()%> </p>
                                        <p class="card-text">
                                            <%
                                                int x = hotel.getBrojZvezdica();
                                                for (int i = 0; i < x; i++) {%>
                                            <i class="fas fa-star" style="color:#f2d202"></i>
                                            <%}
                                                if (x == 4) {%>
                                            <i class="fas fa-star"></i>
                                            <%}
                                                if (x == 3) {%>
                                            <i class="fas fa-star"></i> <i class="fas fa-star"></i>
                                            <%}
                                                if (x == 2) {%>
                                            <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"> </i>
                                            <%}
                                                if (x == 1) {%>
                                            <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i>
                                            <%}
                                            %>
                                        </p>
                                        <span style="visibility: hidden; font-size: 0px""><%=hotel.getBrojZvezdica()%></span>
                                    </div>
                                </a>
                                <div  class="card-footer" style="border-radius:5px;width:289px;background:rgba(0,0,0,0.3);">
                                    <a href="${pageContext.request.contextPath}/Sobe.jsp?Hotel_Id=<%=hotel.getHotelId()%>" class="btn btn-primary">Pogledaj sobe</a>
                                    <% if (UlogovanaRola.equals("2")) {%> 
                                    <a  style="margin-left:20px;"href="${pageContext.request.contextPath}/EditHotel.jsp?Hotel_Id=<%=hotel.getHotelId()%>" class="btn btn-warning">Izmeni</a>
                                </div>    
                                <%}
                                %>
                            </div>
                        </div>
                    </div>

                </div>    
            </li>
            <%}%>
        </ul>
    </center>
    <script>
        function myFunction() {
            // Declare variables
            var input, filter, ul, li, a, i, txtValue;
            input = document.getElementById('myInput');
            filter = input.value.toUpperCase();
            ul = document.getElementById("myUL");
            li = ul.getElementsByTagName('li');

            // Loop through all list items, and hide those who don't match the search query
            for (i = 0; i < li.length; i++) {
                a = li[i].getElementsByTagName("a")[0];
                txtValue = a.textContent || a.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    li[i].style.display = "";
                } else {
                    li[i].style.display = "none";
                }
            }
        }

    </script>

    <jsp:include page="index.jsp" /> 
</body>
</html>
