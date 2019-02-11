<%-- 
    Document   : EditHotelTest
    Created on : 11-Feb-2019, 16:05:56
    Author     : Ilhan Kalac
--%>

<%@page import="RepoPattern.TipSobeRepo"%>
<%@page import="Models.TipSobe"%>
<%@page import="RepoPattern.MenadzerHotelaRepo"%>
<%@page import="RepoPattern.HotelRepo"%>
<%@page import="Models.Hotel"%>
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
        .vl {
            border-left: 1px solid black;}
        </style>
        <body style="overflow:scroll; overflow-x: hidden;">
        <%@ include file="navbar.jsp" %>  
        <%            String HotelID = request.getParameter("Hotel_Id");
            Hotel hotel = new HotelRepo().select(HotelID);

            boolean pristupSvomHotelu = true;

            if (request.getSession().getAttribute("UlogovanaRola") != null) {
                if (request.getSession().getAttribute("UlogovanaRola").equals("3")) {
                    pristupSvomHotelu = new MenadzerHotelaRepo().allow(HotelID, "" + request.getSession().getAttribute("HotelId"));
                }
            }

            if (request.getSession().getAttribute("UlogovanaRola") != null) {
                if ((request.getSession().getAttribute("UlogovanaRola").equals("1"))
                        || !(pristupSvomHotelu)) {
                    response.sendRedirect("index.jsp");
                }
            } else {
                response.sendRedirect("index.jsp");
            }

        %>
        <br> 
        <div class="row" style="border-radius:5px;width:70%;   margin:0 auto;color:white;background:rgba(0,0,0,0.5)">

            <div  class="col">
                <br><br> <br>
                <center>
                    <h3>Izmena hotela </h3>
                </center>
                <br>
                <form  action="EditHotel" method="post" enctype="multipart/form-data">
                    <input value="<%= request.getParameter("Hotel_Id")%>" name="Hotel_Id" type="hidden">

                    <table style=" text-align: right;margin:0 auto; display:inline-block">
                        <tr>

                            <td> Naziv:</td>
                            <td><input type="text" class="form-control" placeholder="Naziv" value="<%= hotel.getNaziv()%>"  name="Naziv"></td>
                        </tr>
                        <tr>
                            <td> Država: </td>
                            <td><input type="text" class="form-control" placeholder="Drzava" value="<%= hotel.getDrzava()%>"  name="Drzava"></td>
                        </tr>

                        <tr>

                            <td>Grad: </td>
                            <td> <input type="text" class="form-control" placeholder="Grad" value="<%= hotel.getGrad()%>"  name="Grad"></td>

                        </tr>
                        <tr>

                            <td> Adresa:</td>
                            <td><input type="text" class="form-control" placeholder="Adresa" value="<%= hotel.getAdresa()%>" name="Adresa"></td>

                        </tr>

                        <tr>

                            <td> Opis: </td>
                            <td><input type="text" class="form-control" placeholder="Opis" value="<%= hotel.getOpis()%>" name="Opis"></td>

                        </tr>
                        <br>
                        <tr>

                            <td> Broj zvezdica:  </td>
                            <td><input type="text" class="form-control" placeholder="Broj zvezdica" value="<%= hotel.getBrojZvezdica()%>"  name="Zvezdice"></td>

                        </tr>
                        <tr>

                            <td> Fotografija:</td>
                            <td>
                                <img height="180px" width="286px" src="FotografijeHotela.jsp?hotelID=<%=hotel.getHotelId()%>" /> 
                                <input id="profile-img" type="file" class="form-control-file" placeholder="Fotografija" value="<%= hotel.getFotografija()%>"  name="file"></td>

                        </tr>
                        <tr>
                            <td></td>
                            <td><img src="" id="profile-img-tag" width="286px" /></td> 
                        </tr>
                    </table> <br> <br>
                    <center>
                        <input  style="width:25%;"type="submit" value ="Izmeni" class="btn btn-secondary">
                        <form action="BrisanjeHotela" method="post">
                            <a style="width:25%; margin-left:5%" class="delete_link btn btn-danger btn-large"  
                               href="${pageContext.request.contextPath}/BrisanjeHotela?Hotel_Id=<%=HotelID%>" >
                                <i class="fa fa-trash"> Obriši</i>                                  
                            </a>
                            <br> <br>
                        </form>
                    </center>
                </form>


            </div>
            <div class="vl"></div>

            <div class="col">
                <div style="margin-top:5%">                           
                    <div class="span6">
                        <a style="float:right" href="Sobe.jsp?Hotel_Id=<%= hotel.getHotelId()%>" class="btn btn-primary">Sobe <i class="fal fa-bed"></i></a>
                        <br><br>
                        <h3>Kreiraj novi tip sobe za ovaj hotel</h3>
                        <form action="KreiranjeTipaSoba" method="post">
                            <input value="<%= request.getParameter("Hotel_Id")%>" name="Hotel_Id" type="hidden">
                            <div style="padding-left:5%">
                                <table style=" text-align: right; float:left;" >
                                    <tr>
                                    <div class="form-inline">
                                        <td style="padding-top:2%"><label>Naziv: </label></td>
                                        <td style="padding-left:2%"><input type="text" class="form-control" placeholder="Naziv"   name="Naziv"></td>
                                        <td style="padding-top:2%">  <input type="submit" style="float:left; margin-left:10%" value ="Kreiraj"  class="btn btn-success" ><br> <br> </td>
                                    </div>
                                    </tr>

                                </table> <br><br>

                                </form> 
                                <form action="BrisanjeTipovaSoba" method="post"> 
                                    <input value="<%= request.getParameter("Hotel_Id")%>" name="Hotel_Id" type="hidden">
                                    <%for (TipSobe tipSobe : new TipSobeRepo().lista(HotelID)) {
                                            {%>                   
                                    <br>
                                    <table>
                                        <div class="input-group">

                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <input type="checkbox" name="TipSobe" value="<%=tipSobe.getTipSobeId()%>" aria-label="Radio button for following text input">
                                                </div>
                                            </div>
                                            <input type="text" class="form-control" value="<%=tipSobe.getNaziv()%>" aria-label="Text input with radio button">
                                        </div>
                                        <%}
                                            }%>  <br>

                                        <td style="padding-top:2%">  <input type="submit" style="float:left; margin-left:10%" value ="Obriši"  class="btn btn-danger" ><br> <br> </td>                                

                                </form>
                            </div>
                            </table>                       
                    </div>  

                </div>                               
            </div>
        </div>
    </div>
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
