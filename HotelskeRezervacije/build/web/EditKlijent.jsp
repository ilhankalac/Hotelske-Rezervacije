<%-- 
    Document   : EditKlijent
    Created on : 15-Dec-2018, 17:14:14
    Author     : Ilhan Kalac
--%>

<%@page import="RepoPattern.KlijentRepo"%>
<%@page import="Models.Klijent"%>
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
            request.setAttribute("Klijent", new KlijentRepo().klijent(request.getParameter("Klijent_Id")));
            Klijent klijent = (Klijent)request.getAttribute("Klijent");
            
            String Rola = "";
            if (klijent.getRola().equals("1"))
                Rola = "Klijent";
            else if(klijent.getRola().equals("2"))
                Rola = "Administrator";
            else
                Rola = "Menadžer hotela";
        %>
        <form action="EditKlijent" method="post">
            <input value="<%= request.getParameter("Klijent_Id")%>" name="Klijent_Id" type="hidden">
           <div style="padding-left:5%">
              <table style="margin-top: -14%; text-align: right">
               <tr>
                 <div class="form-inline">
                  <td style="padding-top:2%"><label>Ime: </label></td>
                  <td style="padding-left:2%"><input type="text" class="form-control" placeholder="Ime" value="<%= klijent.getIme() %>" name="Ime"></td>
                 </div>
               </tr>
               <br>
               <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> Prezime: </label></td>
                    <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Prezime" value="<%= klijent.getPrezime() %>"  name="Prezime"></td>
                </div>
               </tr>
               <br>
               <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> Korisnicko ime: </label></td>
                    <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Korisnicko ime" value="<%= klijent.getKIme() %>"  name="KIme"></td>
                </div>
               </tr>
               <br>
               <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> E-mail:</label></td>
                    <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="E-mail:" value="<%= klijent.getEmail()%>" name="Email"></td>
                </div>
               </tr>
               <br>
               <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> Telefon:</label></td>
                    <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Telefon" value="<%= klijent.getTelefon() %>" name="Telefon"></td>
                </div>
               </tr>
               <br>
               <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> Adresa: </label></td>
                    <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Adresa" value="<%= klijent.getAdresa() %>"  name="Adresa"></td>
                </div>
               </tr>
               <br>
               <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> Država: </label></td>
                    <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Država" value="<%= klijent.getDrzava()%>"  name="Drzava"></td>
                </div>
               </tr>
               <br>
               <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> Grad: </label></td>
                    <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Grad" value="<%= klijent.getGrad()%>"  name="Grad"></td>
                </div>
               </tr>
               <br>
               <tr>              
                   <td style="padding-top:9%"> <label> Rola:</label> </td>
                   <td style="padding-top:6%; padding-left:2%">
                        <select name="Rola">
                            <option value="1"<%if (klijent.getRola().equals("1")){
                                {%> selected <%}
                            }%>>Klijent</option>
                            <option value="2"<%if (klijent.getRola().equals("2")){
                                {%> selected <%}
                            }%>>Administrator</option>
                            <option value="3"<%if (klijent.getRola().equals("3")){
                                {%> selected <%}
                            }%>>Menadžer hotela</option>
                        </select>
                   </td>
               </tr> 
               <br>
               <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> Poeni: </label></td>
                    <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Poeni" value="<%= klijent.getPoeni()%>"  name="Poeni"></td>
                </div>
               </tr>
               <br>
               <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> HotelID: </label></td>
                    <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="HotelID" value="<%= klijent.getHotelID()%>" name="HotelID"></td>
                </div>
               </tr>
               <br>
               <tr>
                <div class="form-inline">
                    <td style="padding-top:9%"><label> Poštanski Broj: </label></td>
                    <td style="padding-top:6%; padding-left:2%"><input type="text" class="form-control" placeholder="Poštanski Broj" value="<%= klijent.getPostanskiBroj()%>" name="PostanskiBroj"></td>
                </div>
               </tr>
              </table> <br>
               <input type="submit" value ="Izmeni" class="btn btn-secondary">
           </div>
        </form>
        
        <%
            String rezultat =(String) request.getAttribute("rezultat");
            
            if(rezultat!=null)
            if(rezultat.equals("False")){%>
            <script type="text/javascript">
                    swal("Greška", "Uneli ste postojeće korisničko ime ili E-mail.", "error");
            </script>
             
                     <%   }
             %>
    </body>
</html>
