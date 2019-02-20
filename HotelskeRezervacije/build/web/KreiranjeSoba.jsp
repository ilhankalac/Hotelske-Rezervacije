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
    <style>
        th, td { 
            padding:7px;

        }
    </style>
    <body style="overflow:scroll; overflow-x: hidden;">
        <%@ include file="navbar.jsp" %> 
        <% 
            String HotelID = request.getParameter("Hotel_Id");
            ArrayList<TipSobe> tipoviSoba = new TipSobeRepo().lista(HotelID);
            Hotel hotel = new HotelRepo().select(HotelID);
        %>
        <br> 

        <form style="border-radius:5px;width:50%;color:white; margin:0 auto; background: rgba(0,0,0,0.5)" action = "KreiranjeSoba" method="post" enctype="multipart/form-data" class="main-form needs-validation"  novalidate>
            <input value="<%=hotel.getHotelId()%>" name="Hotel_Id" type="hidden">
            <center>
                <br>
                <h2><%=hotel.getNaziv()%></h2>
                <br>
                <table style="text-align: right;">
                    <tr>
                        <td>    Broj Sobe:</td>
                        <td> 
                            <input required class="form-control" type="text" name="BrojSobe">
                             <div class="invalid-feedback">Unesite broj sobe</div>
                        </td>
                    </tr>
                    <tr>
                        <td>  Tip Sobe: </td>
                        <td> 
                            <select class="form-control" name="TipSobe">
                                <%
                                    for (TipSobe tipSobe : tipoviSoba) {                                  
                                         {%> <option  value="<%=tipSobe.getTipSobeId()%>"><%=tipSobe.getNaziv()%></option>   <%}
                                    }%>                               
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Opis:</td>
                        <td>
                            <input required class="form-control" type="text" name="Opis">
                             <div class="invalid-feedback">Unesite opis</div>
                        </td>
                    </tr>
                    <tr>
                        <td> Kratki opis:</td>
                        <td>
                            <input required class="form-control" type="text" name="KratkiOpis">
                             <div class="invalid-feedback">Unesite kratki opis</div>
                        </td>
                    </tr>
                    <tr>
                        <td>Cena: (EUR)</td>
                        <td>
                            <input required class="form-control" type="number" name="Cena"> 
                             <div class="invalid-feedback">Unesite cenu</div>
                        </td>
                    </tr>
                    <tr>
                        <td> Cena u poenima:</td>
                        <td>
                            <input required class="form-control"  type="number" name="CenaUPoenima">
                             <div class="invalid-feedback">Unesite cenu u poenima</div>
                        </td>
                    </tr>
                    <tr>
                        <td> Kapacitet: </td>
                        <td> 
                            <input required class="form-control" type="number" name="Kapacitet"> 
                             <div class="invalid-feedback">Unesite kapacitet</div>
                        </td>
                    </tr>
                    <tr>
                        <td>Poeni:</td>
                        <td> 
                            <input required class="form-control" type="number" name="Poeni">  
                             <div class="invalid-feedback">Unesite poene</div>
                        </td>
                    </tr>
                    <tr>
                        <td>  Fotografija: </td>
                        <td>
                            <input required id="profile-img" class="form-control-file" type="file" name="file"> 
                             <div class="invalid-feedback">Dodajte fotografiju</div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><img src="" id="profile-img-tag" width="286px" /></td> 
                    </tr>

                </table>
                <br>
                <input style="width:25%" type="submit" class="btn btn-primary" value="Kreiraj sobu">

            </center>
            <br>
        </form>
        <br>
        <script>
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#profile-img-tag').attr('src', e.target.result);
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $("#profile-img").change(function () {
                readURL(this);
            });
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
    </body>
</html>
