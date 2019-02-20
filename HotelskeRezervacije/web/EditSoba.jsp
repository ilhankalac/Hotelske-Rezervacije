<%-- 
    Document   : EditSoba
    Created on : 19-Dec-2018, 23:46:26
    Author     : Ilhan Kalac
--%>

<%@page import="RepoPattern.TipSobeRepo"%>
<%@page import="Models.TipSobe"%>
<%@page import="RepoPattern.SobeRepo"%>
<%@page import="Models.Soba"%>
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
        <%  Soba soba = new SobeRepo().select(request.getParameter("Soba_Id")); %>

        <br>
         <form style="margin:0 auto;color:white; background: rgba(0,0,0,0.5); width:50%;border-radius:5px;" action="EditSoba" method="post" enctype="multipart/form-data" class="main-form needs-validation"  novalidate>
             <center><br> <br>
                    <input value="<%=request.getParameter("Soba_Id")%>" name="Soba_Id" type="hidden">
                    <input value="<%=request.getParameter("Hotel_Id")%>" name="Hotel_Id" type="hidden">
                    <div style="padding-left:5%">
                       <table style="text-align: right">
                        <tr>
                           <td>Broj sobe: </td>
                           <td>
                               <input required type="text" class="form-control" placeholder="Broj sobe" value="<%=soba.getBrojSobe()%>" name="BrojSobe">
                               <div class="invalid-feedback">Unesite broj sobe</div>
                           </td>
                        </tr>
                        <tr>
                            <td>  Tip Sobe:  </td>                            
                            <td>
                               <select class="form-control" name="TipSobe">
                                    <option value="<%=soba.getTipSobeID() %>"><%=soba.TipSobe.getNaziv() %></option> 
                                    <%
                                       for(TipSobe tipSobe: new TipSobeRepo().lista(Integer.toString(soba.getHotelID()))){ 
                                           if(!(soba.TipSobe.getNaziv().equals(tipSobe.getNaziv())))   
                                               {%> <option value="<%=tipSobe.getTipSobeId() %>"><%=tipSobe.getNaziv() %></option> <%}
                                       }
                                    %> 
                               </select>                        
                            </td>                 
                        </tr>
                        <tr>
                             <td> Opis:</td>
                             <td>
                                 <input required type="text" class="form-control" placeholder="Opis" value="<%= soba.getOpis()  %>"  name="Opis">
                                 <div class="invalid-feedback">Unesite opis</div>
                             </td>
                        </tr>
                        <tr>

                             <td> Kratak opis:</td>
                             <td>
                                 <input required type="text" class="form-control" placeholder="KratkiOpis" value="<%= soba.getKratkiOpis() %>"  name="KratkiOpis">
                                 <div class="invalid-feedback">Unesite kratak opis</div>
                             </td>

                        </tr>
                         <tr>

                             <td>Cena:</td>
                             <td>
                                 <input required type="text" class="form-control" placeholder="Cena" value="<%= soba.getCena()%>"  name="Cena">
                                 <div class="invalid-feedback">Unesite cenu</div>
                             </td>

                        </tr>
                        <tr>

                             <td> Cena u poenima:</td>
                             <td>
                                 <input required type="number" class="form-control" placeholder="Cena u poenima" value="<%= soba.getCenaUPoenima()%>"  name="CenaUPoenima">
                                 <div class="invalid-feedback">Unesite cena u poenima</div>
                             </td>

                        </tr>
                         <tr>

                             <td>Poeni: </td>
                             <td>
                                 <input required type="number" class="form-control" placeholder="Poeni" value="<%= soba.getPoeni()%>"  name="Poeni">
                                  <div class="invalid-feedback">Unesite poene</div>
                             </td>

                        </tr>
                        <tr>

                             <td>Kapacitet:</td>
                             <td>
                                 <input required type="number" class="form-control" placeholder="Kapacitet" value="<%= soba.getKapacitet()%>"  name="Kapacitet">
                                  <div class="invalid-feedback">Unesite kapacitet</div>
                             </td>

                        </tr>
                        <tr>

                             <td> Fotografija:</td>
                             <td>
                                 <img  height="180px" width="286px" src="FotografijeSoba.jsp?SobaId=<%=request.getParameter("Soba_Id")%>" /> 
                                 <input id="profile-img" type="file" class="form-control-file" placeholder="Fotografija" value="<%= soba.getFotografija()%>"  name="file">
                             </td>

                        </tr>
                         <tr>
                             <td></td>
                             <td><img src="" id="profile-img-tag" width="286px" /></td> 
                         </tr>

                       </table> 
                        <input style="width:25%;" type="submit" value ="Izmeni" class="btn btn-secondary">
                        <form action="BrisanjeHotela" method="post">
                           <a style="width:25%;" class="delete_link btn btn-danger btn-large"  
                                             href="${pageContext.request.contextPath}/BrisanjeSoba?Soba_Id=<%=request.getParameter("Soba_Id")%>" >
                                            <i class="fa fa-trash"> Obriši</i>                                  
                           </a>
                        </form>
                    </div>
                   <br>                    
             </center>
                                    
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
