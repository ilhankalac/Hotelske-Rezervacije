<%-- 
    Document   : Placanje
    Created on : 22-Dec-2018, 18:56:56
    Author     : Ilhan Kalac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Plaćanje</title>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />  
        <form action="Naplacivanje" method="post">
                <div style="margin-right:50%;" >
               <div style=" margin-left: 40%;" class="form-control"  >

                   <h2> Plaćanje  </h2>
                   <br>
                   Vrsta kreditne kartice: 
                   <select name="VrstaKartice">
                       <option value="Visa"> Visa </option>
                       <option value="Maestro"> Maestro </option>    
                       <option value="MasterCard"> MasterCard </option>
                   </select>


                   <br> <br>
                   Broj Kreditne kartice: <input style=" margin-right: 30%" class="form-control" type="number" name="BrojKartice" placeholder="XXXX-XXXX-XXXX-XXXX"> <br> <br>
                   Datum  isteka: (Mesec) 
                   <select name="DatumIstekaMesec">
                       <%
                           for(int i = 1; i<=12; i++) {
                               {%>
                               <option value="<%=i%>"> <%=i%> </option>
                               <%}
                           }
                       %>

                   </select> <br> <br>
                    Datum  isteka: (Godina) 
                   <select name="DatumIstekaGodina">
                       <%
                           for(int i = 2018; i<=2030; i++) {
                               {%>
                               <option value="<%=i%>"> <%=i%> </option>
                               <%}
                           }
                       %>

                   </select>
                     <br> <br>  
                     <% if(request.getAttribute("Racun")!=null){ 
                         {%>
                             <h2>Račun: <%=request.getAttribute("Racun")%> EUR.</h2> 
                          <%}
                        }
                     %>

                   <input type="submit" value="Potvrdi plaćanje" class="button btn-success"> <br> <br>
                   
                   <hr>
                   <h4>Ili platite Starling poenima</h4>
                    <input type="submit" value="Plati - broj poena" class="button btn-warning"> <br> <br>  
                     
                     
                  
               </div>
           </div>
            
                       
           <%  if(request.getAttribute("poruka")!=null){
                if (request.getAttribute("poruka").equals("True")){ 
                    {%> 
                             <script type="text/javascript">
                         swal("Dobar  posao", "Rezervacija uspela", "success")
                         .then(function() {
                             window.location = "index.jsp";
                         });
                     <%}
                } 
                    else if(request.getAttribute("poruka").equals("False")){
                         {%> 
                             <script type="text/javascript">
                         swal("Dobar  posao", "Rezervacija uspešna", "success")
                         .then(function() {
                             window.location = "index.jsp";
                         });
                     <%}
                    }
              }
            %>
           
                   
            

           </script>
        </form>
      
    </body>
</html>
