<%-- 
    Document   : Placanje
    Created on : 22-Dec-2018, 18:56:56
    Author     : Ilhan Kalac
--%>

<%@page import="Models.Soba"%>
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
                   <input type="hidden" name="BrojPoena" value="<%=request.getAttribute("BrojPoena")%>">
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
                    <input type="hidden" value="<%=request.getAttribute("CenaUPoenima")%>" name="CenaUPoenima">   
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

                   <input  type="submit" name="NaplacivanjeNovcem" value="Potvrdi plaćanje" class="button btn-success"> <br> <br>
                   
                   <hr>
                   <% 
                       if(request.getAttribute("CenaUPoenima")!=null)
                       if((Integer)request.getSession().getAttribute("BrojPoenaKlijenta") >= (Integer)request.getAttribute("CenaUPoenima")){ 
                        {%>
                           <h4>Ili platite Starling poenima</h4>
                           <h3>Vaše trenutan  broj poena: <%=request.getSession().getAttribute("BrojPoenaKlijenta")%></h3>
                         
                           <input type="submit" value="Plati sa <%=request.getAttribute("CenaUPoenima")%> poena" class="button btn-warning"> <br> <br>  
                       <%}
                      }
                      else { 
                        {%> 
                            <h4>Plaćanje Starling poenima</h4>
                            <h4>Nemate dovoljno poena, potrebno <%=request.getAttribute("CenaUPoenima")%> poena</h4>
                            <h3>Vaš trenutan  broj poena: <%=request.getSession().getAttribute("BrojPoenaKlijenta")%></h3>
                        <%}
                      }
                   %>
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
