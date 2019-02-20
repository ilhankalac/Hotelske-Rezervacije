<%-- 
    Document   : RegistracijaTest
    Created on : 08-Feb-2019, 19:28:07
    Author     : Ilhan Kalac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Registracija </title>
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
         <%@ include file="navbar.jsp" %> 
        <%
            if (request.getSession().getAttribute("ulogovan") != null)  
                response.sendRedirect("index.jsp");
        %>
       
        <%           
            String rezultat = (String) request.getAttribute("rezultat");
            if (rezultat != null)
                if (rezultat.equals("True")) {%>
                    <script type="text/javascript">
                        swal("Dobar  posao", "Registracija uspela", "success")
                                .then(function () {
                                    window.location = "Hoteli.jsp";
                                });

                    </script>

        <%}
            else if (rezultat.equals("False")) {%>

                    <script type="text/javascript">
                        swal("Greška", "Uneli ste postojeće korisničko ime ili E-mail.", "error")
                                .then(function () {
                                    window.location = "Registracija.jsp";
                                });
                    </script>

        <%}%>

        <form action="KlijentController" style="width:50%;margin:0 auto;padding-top:2%;" class="main-form needs-validation"  novalidate>
            <div class="slideshow-container" style="border-radius:5px;background:rgba(0,0,0,0.5); color:white;">
                <div class="mySlides" cellspacing="10">
                    <h3> Osnovni podaci</h3> <br>
                    <table style="width:88%;">
                        <tr>
                            <td align="right">Ime:</td>
                            <td><input placeholder="Ime" required class="form-control" type="text" name="Ime">
                                <div class="invalid-feedback">Unesite ime</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">Prezime:</td>
                            <td> <input placeholder="Prezime" required class="form-control" type="text" name="Prezime"> 
                                <div class="invalid-feedback">Unesite prezime</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"> Korisničko ime:</td>
                            <td> <input placeholder="Korisničko ime" required class="form-control" type="text" name="KIme"> 
                                <div class="invalid-feedback">Unesite korisničko ime</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"> Lozinka:</td>
                            <td> <input placeholder="Lozinka" required class="form-control" type="password" name="Lozinka">   
                                <div class="invalid-feedback">Unesite lozinku</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"> Email:</td>
                            <td> <input placeholder="Email" required class="form-control" type="text" name="Email"> 
                                <div class="invalid-feedback">Unesite email</div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="mySlides">
                    <h3> Ostali podaci</h3> <br>
                    <table style="width:88%;">
                        <tr>
                            <td align="right">Telefon:</td>
                            <td> <input placeholder="Telefon" id = "phone" required class="form-control" type="text" name="Telefon">
                                <div class="invalid-feedback">Unesite telefon</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">Adresa:</td>
                            <td> <input placeholder="Adresa" required class="form-control" type="text" name="Adresa">  
                                <div class="invalid-feedback">Unesite adresu</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">Država:</td>
                            <td> <input placeholder="Država" required class="form-control" type="text" name="Drzava"> 
                                <div class="invalid-feedback">Unesite državu</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">Grad:</td>
                            <td> <input <input placeholder="Grad" required class="form-control" type="text" name="Grad">   
                                <div class="invalid-feedback">Unesite grad</div>
                            </td>
                        </tr>

                        <tr>
                            <td align="right">Poštanski broj:</td>
                            <td> <input <input placeholder="Poštanski broj" required class="form-control" type="text" name="PostanskiBroj"> 
                                <div class="invalid-feedback">Unesite poštanski broj</div>
                            </td>
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
        <script>
            var form = document.querySelector('.needs-validation');
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            });

        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
        <script>
            $(document).ready(function(){
            $('#phone').mask('999-9999-999');
            });
        </script>
    </body>
</html> 
