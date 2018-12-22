<%-- 
    Document   : Rezervisi
    Created on : 22-Dec-2018, 16:17:57
    Author     : Ilhan Kalac
--%>

<%@page import="RepoPattern.SobeRepo"%>
<%@page import="RepoPattern.SobeRepo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rezerviši</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap 4 DatePicker</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://unpkg.com/gijgo@1.9.11/js/gijgo.min.js" type="text/javascript"></script>
        <link href="https://unpkg.com/gijgo@1.9.11/css/gijgo.min.css" rel="stylesheet" type="text/css" />
        </head>
    <body>
         <jsp:include page="navbar.jsp" />  
        <% int sobaMaxKapacitet = new SobeRepo().maxKapacitetSobe(request.getParameter("Soba_Id"));%>
        <center>
         <form action = "KreiranjeRezervacije" method="post" >
             
           
             <input type="hidden" value="<%=request.getParameter("Soba_Id")%>" name="Soba_Id">
             Broj dece: 
            <select name="BrojDece" class="custom-select" style="width:50px">
                 
                <% for(int i = 1; i <= sobaMaxKapacitet; i++){
                    {%>
                       <option value="<%=i%>"> <%=i%> </option>
                    <%}  
                   }
                %>
             </select>
             <br> </br>
                 
             
             Broj odraslih:
                <select name="BrojOdraslih" class="custom-select" style="width:50px">

                   <% for(int i = 1; i <= sobaMaxKapacitet; i++){
                       {%>
                          <option value="<%=i%>"> <%=i%> </option>
                       <%}  
                      }
                   %>
                </select>
                <br> </br>
                Datum dolaska:  
                <input type="date" name="DatumDolaska" class="form-control" style="width:250px" onkeydown="return false">  
                Datum odlaska:  
                
                
                <input type="date" name="DatumOdlaska" class="form-control" style="width:250px" onkeydown="return false">  
                 <script type="text/javascript">
                    $(function () {
                        $('#DatumDolaska').datetimepicker({
                            format: 'LT'
                        });
                    });
                </script>
             
         </form>
             
        </center>    
          
    </body>
</html>
