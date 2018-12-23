<%-- 
    Document   : Rezervisi
    Created on : 22-Dec-2018, 16:17:57
    Author     : Ilhan Kalac
--%>

<%@page import="RepoPattern.RezervacijaRepo"%>
<%@page import="Models.Rezervacija"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.Soba"%>
<%@page import="RepoPattern.SobeRepo"%>
<%@page import="RepoPattern.SobeRepo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rezerviši</title>
        </head>
    <body>
        <%
            ArrayList<Rezervacija> aktivneRezervacije = new RezervacijaRepo().aktivneRezervacije(request.getParameter("Soba_Id"));
        
        
        %>
        
         <jsp:include page="navbar.jsp" />  
        <% int sobaMaxKapacitet = new SobeRepo().maxKapacitetSobe(request.getParameter("Soba_Id"));%>
       
         <form action = "KreiranjeRezervacije" method="post" >
            
             <div class="list-group">
                <button type="button" class="list-group-item list-group-item-action" style="background-color: red">
                  Trenutne rezervacije sobe
                </button>
                 <% 
                     int brojac = 1;
                     for(Rezervacija rezervacija: aktivneRezervacije){ 
                        {%> 
                            <button type="button" class="list-group-item list-group-item-action"> <%=brojac++%>.
                               <%=rezervacija.getDatumDolaska()%> - <%=rezervacija.getDatumOdlaska()%> : <%=rezervacija.getVremeOdlaska()%></button>
                        <%}                        
                     }
                 %>
                
               
              </div>
             <div style=" margin-left:20%">
             <div class="row">
                 <div class="span6" style="margin-left:10%; margin-top:5% ;  padding:2%; margin-bottom:30%; background:white">
                    Datum dolaska:  
                     <input type="date" name="DatumDolaska" class="form-control" style="width:250px" onkeydown="return false">                      
                     Datum odlaska:  
                     <input type="date" name="DatumOdlaska" class="form-control" style="width:250px" onkeydown="return false">  
                      <br>
                    Vreme odlaska:
                    <input type="time" name="VremeOdlaska" class="form-control" style="width:250px" onkeydown="return false">  <br> 
                    <input type="hidden" value="<%=request.getParameter("Soba_Id")%>" name="Soba_Id">
                    Broj dece: 
                   <select name="BrojDece" class="custom-select" style="width:50px">

                       <% for(int i = 0; i <= sobaMaxKapacitet; i++){
                           {%>
                              <option value="<%=i%>"> <%=i%> </option>
                           <%}  
                          }
                       %>
                    </select>
                    <br> </br>


                    Broj odraslih:
                       <select name="BrojOdraslih" class="custom-select" style="width:50px">

                          <% for(int i = 0; i <= sobaMaxKapacitet; i++){
                              {%>
                                 <option value="<%=i%>"> <%=i%> </option>
                              <%}  
                             }
                          %>
                       </select>
                       <br> </br> <br> <br>
                        <input type="submit" value="Idi na plaćanje" class="btn btn-success"></a>
                       </div>
                        <div class="jumbotron" style="margin-bottom:  30%; background-color:white; ">
                             <div class="span6">
                                <% 
                              String IDk = "";
                              //Integer HoteliId = new SobeRepo().hoteliIdSobe(request.getParameter("Soba_Id"));

                              Soba soba = new SobeRepo().select(request.getParameter("Soba_Id"));
                              if(request.getSession().getAttribute("UlogovanaRola")!=null)
                               IDk = (String)request.getSession().getAttribute("UlogovanaRola");

                                    {%>
                                    <h5> Izabrana soba</h5>
                                     <div class="card" style="width: 18rem; float:left; margin:7.5px">              
                                        <img height="180px" width="286px" src="FotografijeSoba.jsp?SobaId=<%=soba.getSobaId()%>" />  
                                        <div class="card-body">
                                             <h5 class="card-title"> <%=soba.getBrojSobe()%></h5>
                                             <p class="card-text">Hotel: <%=soba.getHotel().getNaziv()%> </p>
                                             <p class="card-text">Tip sobe: <%=soba.getTipSobe().getNaziv()%> </p>
                                             <p class="card-text">Opis: <%=soba.getOpis()%> </p>
                                             <p class="card-text">Kratak opis: <%=soba.getKratkiOpis()%> </p>
                                             <p class="card-text">Cena: <%=soba.getCena()%> € </p>
                                             <p class="card-text">Kapacitet: <%=soba.getKapacitet()%> </p>
                                         </div>   
                                     </div>  
                                    <%}
                                  
                               %>
                            </div>
                        </div>
                </div>
             </div>
                           
         </form>
    </body>
</html>
