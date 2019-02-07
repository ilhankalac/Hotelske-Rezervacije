<%-- 
    Document   : TestSobe
    Created on : 07-Feb-2019, 21:05:49
    Author     : Ilhan Kalac
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="RepoPattern.SobeRepo"%>
<%@page import="Models.Soba"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            * {box-sizing: border-box}
            body {font-family: Verdana, sans-serif; margin:0}
            .mySlides {display: none}
            img {vertical-align: middle;}

            /* Slideshow container */
            .slideshow-container {
                max-width: 1000px;
                position: relative;
                margin: auto;
                border-radius: 5px;
            }

            /* Next & previous buttons */
            .prev, .next {
                cursor: pointer;
                position: absolute;
                top: 50%;
                width: auto;
                padding: 16px;
                margin-top: -22px;
                color: white;
                font-weight: bold;
                font-size: 18px;
                transition: 0.6s ease;
                border-radius: 0 3px 3px 0;
                user-select: none;
            }

            /* Position the "next button" to the right */
            .next {
                right: 0;
                border-radius: 3px 0 0 3px;
            }

            /* On hover, add a black background color with a little bit see-through */
            .prev:hover, .next:hover {
                background-color: rgba(0,0,0,0.8);
            }

            /* Caption text */
            .text {
                color: #f2f2f2;
                font-size: 15px;
                padding: 8px 12px;
                position: absolute;
                bottom: 0px;
                width: 100%;
                text-align: center;
            }

            /* Number text (1/3 etc) */
            .numbertext {
                color: #f2f2f2;
                font-size: 12px;
                padding: 8px 12px;
                position: absolute;
                top: 0;
            }

            /* The dots/bullets/indicators */
            .dot {
                cursor: pointer;
                height: 15px;
                width: 15px;
                margin: 0 2px;
                background-color: #bbb;
                border-radius: 50%;
                display: inline-block;
                transition: background-color 0.6s ease;
            }

            .active, .dot:hover {
                background-color: #717171;
            }

            /* Fading animation */
            .fade {
                -webkit-animation-name: fade;
                -webkit-animation-duration: 1.5s;
                animation-name: fade;
                animation-duration: 1.5s;
            }

            @-webkit-keyframes fade {
                from {opacity: .4} 
                to {opacity: 1}
            }

            @keyframes fade {
                from {opacity: .4} 
                to {opacity: 1}
            }

            /* On smaller screens, decrease text size */
            @media only screen and (max-width: 300px) {
                .prev, .next,.text {font-size: 11px}
            }
        </style>
    </head>
    <body>

        <%

            String hotelIdSesija = "" + request.getSession().getAttribute("HotelId");

            String Hotel_Id = request.getParameter("Hotel_Id");

            if (Hotel_Id == null) {
                response.sendRedirect("Hoteli.jsp");
            }
        %>
        <%@ include file="navbar.jsp" %> 

        <%            String ulogovanaRola = "";
            if ((String) request.getSession().getAttribute("UlogovanaRola") != null) {
                ulogovanaRola = (String) request.getSession().getAttribute("UlogovanaRola");
            }
            if (ulogovanaRola.equals("2") || Hotel_Id.equals(hotelIdSesija)) {
        %>
    <center>
        <a style="margin-top:20px; margin-left:40px" href="${pageContext.request.contextPath}/KreiranjeSoba.jsp?Hotel_Id=<%=Hotel_Id%>"> <i style="color:#00fb00" class="fas fa-plus-square fa-3x">Dodaj</i></a>
</center>

 <br>


    <% }
        String IDk = "";

        if (request.getSession().getAttribute("UlogovanaRola") != null) {
            IDk = (String) request.getSession().getAttribute("UlogovanaRola");
        }

    %>  <div class="slideshow-container" > <%          
        ArrayList<Soba> sobe = new SobeRepo().listaSobaSelektovanogHotela(Hotel_Id);
        if(sobe.isEmpty()) 
        %> <center> <h2 style="color:white"> Trenutno nema ni jedna soba.</h2> </center><%
            
        for (Soba soba : sobe) {%>

        <div class="mySlides" >

            <img style="opacity:0.9" width="1000px" height="500px" src="FotografijeSoba.jsp?SobaId=<%=soba.getSobaId()%>"  style="width:100%">
            <div  class="text"  style="background:rgba(0,0,0,0.5)">

                <h5 class="card-title"><%=soba.getHotel().getNaziv()%> - <%=soba.getBrojSobe()%> - <%=soba.getTipSobe().getNaziv()%></h5>

                <p>
                    Opis: <%=soba.getOpis()%> -
                    <%=soba.getKratkiOpis()%>  </p>



                <p style="font-size:15px">Vredi poena: <%=soba.getPoeni()%>, 
                    Kapacitet: <%=soba.getKapacitet()%> </p>
                <p style="font-size: 20px;font-weight: bold; color: dark"> Cena: <%=soba.getCena()%> €,  <%=soba.getCenaUPoenima()%> poena </p>


                <% if (!IDk.isEmpty()) {%>
                <a href="${pageContext.request.contextPath}/Rezervisi.jsp?Soba_Id=<%=soba.getSobaId()%>" class="btn btn-primary">Rezerviši</a>
                <%} %>
                <% if (IDk.equals("2") || Hotel_Id.equals(hotelIdSesija)) {%> 
                <a href="${pageContext.request.contextPath}/EditSoba.jsp?Soba_Id=<%=soba.getSobaId()%>" class="btn btn-warning">Izmeni</a>
                <%}
                %>

            </div>
        </div>

        <%}%>

        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </div>    
</div>
<br>

<div style="text-align:center">
    <span class="dot" onclick="currentSlide(1)"></span> 
    <span class="dot" onclick="currentSlide(2)"></span> 
    <span class="dot" onclick="currentSlide(3)"></span> 
</div>

<script>
    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        if (n > slides.length) {
            slideIndex = 1
        }
        if (n < 1) {
            slideIndex = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
    }

</script>

</body>
</html> 

