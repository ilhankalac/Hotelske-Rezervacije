<%-- 
    Document   : Hoteli
    Created on : 16-Dec-2018, 19:26:44
    Author     : Ilhan Kalac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getSession().getAttribute("UlogovanaRola") != null) {
        if (!(request.getSession().getAttribute("UlogovanaRola").equals("2"))) {
            response.sendRedirect("index.jsp");
        }
    } else {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hoteli</title>
    </head>
    <style>
        th, td { 
            padding:7px;

        }

    </style>
    <body style="overflow:scroll; overflow-x: hidden;">
        <%@ include file="navbar.jsp" %> 
        <br>
        <form style="margin:0 auto;width:50%;color:white; " action = "KreiranjeHotela" method="post" enctype="multipart/form-data">
            <div class="form-group" style="background: rgba(0,0,0,0.5); border-radius: 5px">
                <br>  
                <h1 align="center">Kreiranje hotela</h1>
                <center>
                    <br> <br>

                    <table  style="text-align: right; padding:5px" cellspacing="10" >

                        <tr>
                            <td> Naziv: </td>
                            <td> <input style="width:100%" class="form-control" type="text" name="Naziv"> </td>
                        </tr>
                        <tr>
                            <td>Država:</td>
                            <td> <input style="width:100%"   type="text" class="form-control" name="Drzava">  </td>
                        </tr>
                        <tr>
                            <td>Grad:</td>
                            <td><input style="width:100%"   type="text" class="form-control" name="Grad">  </td>
                        </tr>
                        <tr>
                            <td>Adresa:</td>
                            <td><input style="width:100%"   type="text" class="form-control" name="Adresa"> </td>
                        </tr>
                        <tr>
                            <td>  Broj zvezdica:</td>
                            <td>  <input style="width:100%"   type="text" class="form-control" name="Zvezdice"> </td>
                        </tr>
                        <tr>
                            <td>  Opis:</td>
                            <td>   <input style="width:100%"   type="text" class="form-control" name="Opis">  </td>
                        </tr>
                        <tr>
                            <td>  Fotografija:</td>
                            <td>    <input id="profile-img" type="file" class="form-control-file" name="file">  </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><img src="" id="profile-img-tag" width="286px" /></td> 

                        </tr>
                    </table>
                    <br> <br>
                </center>
                <center>
                    <input style="width:40%"  class=" btn btn-primary" type="submit" value="Kreiraj">
                </center>
                <br><br>
            </div>
        </form>
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
