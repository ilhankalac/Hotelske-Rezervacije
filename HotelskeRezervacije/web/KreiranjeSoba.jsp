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
        <%             String HotelID = request.getParameter("Hotel_Id");
            ArrayList<TipSobe> tipoviSoba = new TipSobeRepo().lista(HotelID);
            Hotel hotel = new HotelRepo().select(HotelID);
        %>
        <br> 

        <form style="border-radius:5px;width:50%;color:white; margin:0 auto; background: rgba(0,0,0,0.5)" action = "KreiranjeSoba" method="post" enctype="multipart/form-data">
            <input value="<%=hotel.getHotelId()%>" name="Hotel_Id" type="hidden">
            <center>
                <br>
                <h2><%=hotel.getNaziv()%></h2>
                <br>
                <table style="text-align: right;">
                    <tr>
                        <td>    Broj Sobe:</td>
                        <td> <input class="form-control" type="text" name="BrojSobe"></td>
                    </tr>
                    <tr>
                        <td>  Tip Sobe: </td>
                        <td>  <select class="form-control" name="TipSobe">
                                <%
                                    for (TipSobe tipSobe : tipoviSoba) {
                                        {%> 
                                <option  value="<%=tipSobe.getTipSobeId()%>"><%=tipSobe.getNaziv()%></option>
                                <%}
                                    }
                                %> 
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Opis:</td>
                        <td><input class="form-control" type="text" name="Opis"></td>
                    </tr>
                    <tr>
                        <td> Kratki opis:</td>
                        <td> <input class="form-control" type="text" name="KratkiOpis"></td>
                    </tr>
                    <tr>
                        <td>Cena:</td>
                        <td><input class="form-control" type="number" name="Cena"> </td>
                    </tr>
                    <tr>
                        <td> Cena u poenima:</td>
                        <td> <input class="form-control"  type="number" name="CenaUPoenima"> </td>
                    </tr>
                    <tr>
                        <td> Kapacitet:</td>
                        <td>  <input class="form-control" type="number" name="Kapacitet">  </td>
                    </tr>
                    <tr>
                        <td>Poeni:</td>
                        <td>  <input class="form-control" type="number" name="Poeni">  </td>
                    </tr>
                    <tr>
                        <td>  Fotografija: </td>
                        <td> <input id="profile-img" class="form-control-file" type="file" name="file">  </td>
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
    </body>
</html>
