<%-- 
    Document   : RegistracijaTest
    Created on : 08-Feb-2019, 19:28:07
    Author     : Ilhan Kalac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            * {box-sizing: border-box}
            body {font-family: Verdana, sans-serif; margin:0; width:500px;}

            /* Slideshow container */
            .slideshow-container {
                position: relative;
                background: #f1f1f1f1;

            }

            /* Slides */
            .mySlides {
                display: none;
                padding: 80px;
                text-align: center;

            }

            /* Next & previous buttons */
            .prev, .next {
                cursor: pointer;
                position: absolute;
                top: 50%;
                width: auto;
                margin-top: -30px;
                padding: 16px;
                color: #888;
                font-weight: bold;
                font-size: 20px;
                border-radius: 0 3px 3px 0;
                user-select: none;
            }

            /* Position the "next button" to the right */
            .next {
                position: absolute;
                right: 0;
                border-radius: 3px 0 0 3px;
            }

            /* On hover, add a black background color with a little bit see-through */
            .prev:hover, .next:hover {
                background-color: rgba(0,0,0,0.8);
                color: white;
            }

            /* The dot/bullet/indicator container */
            .dot-container {
                text-align: center;
                padding: 20px;
                background: #ddd;
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

            /* Add a background color to the active dot/circle */
            .active, .dot:hover {
                background-color: #717171;
            }

            /* Add an italic font style to all quotes */
            q {font-style: italic;}

            /* Add a blue color to the author */
            .author {color: cornflowerblue;}
            th, td { 
                padding:7px 

            }
        </style>
    </head>
    <body style="width:100%;overflow:scroll; overflow-x: hidden;" >
        <%
            if (request.getSession().getAttribute("ulogovan") != null) {
                response.sendRedirect("index.jsp");
            }
        %>
        <%@ include file="navbar.jsp" %> 
        <%             String rezultat = (String) request.getAttribute("rezultat");

            if (rezultat != null)
                if (rezultat.equals("True")) {%>
        <script type="text/javascript">
            swal("Dobar  posao", "Registracija uspela", "success")
                    .then(function () {
                        window.location = "Hoteli.jsp";
                    });

        </script>

        <%   } else if (rezultat.equals("False")) {%>

        <script type="text/javascript">
            swal("Greška", "Uneli ste postojeće korisničko ime ili E-mail.", "error")
                    .then(function () {
                        window.location = "Registracija.jsp";
                    });
        </script>

        <% }%>

        <form action="KlijentController" style="width:50%;margin:0 auto;padding-top:2%;">


            <div class="slideshow-container" style="border-radius:5px;background:rgba(0,0,0,0.5); color:white;">


                <div class="mySlides" cellspacing="10">
                    <h3> Osnovni podaci</h3> <br>

                    <table style="width:88%;">
                        <tr>
                            <td align="right">Ime:</td>
                            <td><input class="form-control" type="text" name="Ime">  </td>
                        </tr>
                        <tr>
                            <td align="right">Prezime:</td>
                            <td> <input class="form-control" type="text" name="Prezime">   </td>
                        </tr>
                        <tr>
                            <td align="right"> Korisničko ime:</td>
                            <td> <input class="form-control" type="text" name="KIme">   </td>
                        </tr>
                        <tr>
                            <td align="right"> Lozinka:</td>
                            <td> <input class="form-control" type="text" name="Lozinka">    </td>
                        </tr>
                        <tr>
                            <td align="right"> Email:</td>
                            <td> <input class="form-control" type="text" name="Email">   </td>
                        </tr>

                    </table>

                </div>

                <div class="mySlides">
                    <h3> Ostali podaci</h3> <br>
                    <table style="width:88%;">
                        <tr>
                            <td align="right">Telefon:</td>
                            <td> <input class="form-control" type="text" name="Telefon">  </td>
                        </tr>
                        <tr>
                            <td align="right">Adresa:</td>
                            <td> <input class="form-control" type="text" name="Adresa">   </td>
                        </tr>
                        <tr>
                            <td align="right">Država:</td>
                            <td> <input class="form-control" type="text" name="Drzava">    </td>
                        </tr>
                        <tr>
                            <td align="right">Grad:</td>
                            <td> <input class="form-control" type="text" name="Grad">    </td>
                        </tr>

                        <tr>
                            <td align="right">Poštanski broj:</td>
                            <td> <input class="form-control" type="text" name="PostanskiBroj">    </td>
                        </tr>

                    </table>
                    <br><br>


                    <button class="btn btn-primary" type="submit">Registruj se <i  class="fas fa-sign-in-alt"></i></button>



                </div>


                <a class="prev" onclick="plusSlides(-1)">❮</a>
                <a class="next" onclick="plusSlides(1)">❯</a>

            </div>


        </form>

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
