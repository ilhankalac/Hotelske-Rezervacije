<%-- 
    Document   : EditHotel
    Created on : 18-Dec-2018, 23:44:52
    Author     : Ilhan Kalac
--%>

<%@page import="RepoPattern.TipSobeRepo"%>
<%@page import="Models.TipSobe"%>
<%@page import="Models.Hotel"%>
<%@page import="RepoPattern.HotelRepo"%>
<%@page import="Models.Klijent"%>
<%@page import="RepoPattern.KlijentRepo"%>
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
            String HotelID = request.getParameter("Hotel_Id");
            Hotel hotel = new HotelRepo().select(HotelID);
            
            
            //izmeni ovo da bude preko sesije ne ovako
            //Klijent klijent = (Klijent)request.getAttribute("Klijent");
            
           // String Rola = "";
           // if (klijent.getRola().equals("1"))
            //    Rola = "Klijent";
           // else if(klijent.getRola().equals("2"))
            //    Rola = "Administrator";
            //else
              //  Rola = "Menadžer hotela";
        %>
        <div class="row">
         <div class="span6" style="margin-left:10%">
         <h2>Izmena hotela </h2>
         <form action="EditHotel" method="post" enctype="multipart/form-data">
           <input value="<%= request.getParameter("Hotel_Id")%>" name="Hotel_Id" type="hidden">
           <div style="padding-left:5%">
              <table style="margin-top: -14%; text-align: right; display:inline-block">
               <tr>
                 <div class="form-inline">
                  <td style="padding-top:2%"><label>Naziv: </label></td>
                  <td style="padding-left:2%"><input type="text" class="form-control" placeholder="Naziv" value="<%= hotel.getNaziv()%>" name="Naziv"></td>
                 </div>
               </tr>
               <br>
               <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> Država: </label></td>
                    <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Drzava" value="<%= hotel.getDrzava()%>"  name="Drzava"></td>
                </div>
               </tr>
               <br>
               <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> Grad: </label></td>
                    <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Grad" value="<%= hotel.getGrad()%>"  name="Grad"></td>
                </div>
               </tr>
               <br>
               <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> Adresa:</label></td>
                    <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Adresa" value="<%= hotel.getAdresa()%>" name="Adresa"></td>
                </div>
               </tr>
               <br>
               <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> Opis: </label></td>
                    <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Opis" value="<%= hotel.getOpis()%>" name="Opis"></td>
                </div>
               </tr>
               <br>
               <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> Broj zvezdica:  </label></td>
                    <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Broj zvezdica" value="<%= hotel.getBrojZvezdica()  %>"  name="Zvezdice"></td>
                </div>
               </tr>
               <br>
               <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> Fotografija: </label></td>
                    <td style="padding-top:6%; padding-left:2%">
                        <img height="180px" width="286px" src="FotografijeHotela.jsp?hotelID=<%=hotel.getHotelId()%>" /> 
                        <input type="file" class="form-control" placeholder="Fotografija" value="<%= hotel.getFotografija()%>"  name="file"></td>
                </div>
               </tr>
               <br>
               <tr>
             
              </table> <br>
               <input type="submit" value ="Izmeni" class="btn btn-secondary">
               <form action="BrisanjeHotela" method="post">
                  <a class="delete_link btn btn-danger btn-large"  
                                    href="${pageContext.request.contextPath}/BrisanjeHotela?Hotel_Id=<%=HotelID %>" >
                                   <i class="fa fa-trash"> Obriši</i>                                  
                  </a>
               </form>
           </div>
        </form>
       
         </div>
        <div class="jumbotron" style="margin-bottom:  30%; margin-left:10%; margin-top: 10%">                           
            <div class="span6">
                <h2>Kreiraj novi tip sobe za ovaj hotel</h2>
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
                 <%for (TipSobe tipSobe:  new TipSobeRepo().lista(HotelID)){  {%>                   
                  <br>
                   <table>
                    <div class="input-group">

                             <div class="input-group-prepend">
                           <div class="input-group-text">
                           <input type="checkbox" name="TipSobe" value="<%=tipSobe.getTipSobeId() %>" aria-label="Radio button for following text input">
                           </div>
                         </div>
                         <input type="text" class="form-control" value="<%=tipSobe.getNaziv()%>" aria-label="Text input with radio button">
                     </div>
                   <%} }  %>  <br>
                   
                      <td style="padding-top:2%">  <input type="submit" style="float:left; margin-left:10%" value ="Obriši"  class="btn btn-danger" ><br> <br> </td>                                
                     
                   </form>
                    </div>
               </table>                       
            </div>  
               
         </div>                               
      </div>                            
    </body>
</html>
