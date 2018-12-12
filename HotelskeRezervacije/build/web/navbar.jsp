
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   <body> 
       
       <% 
           Boolean  pom  = false;
           HttpSession sesija =  request.getSession();
           if(sesija.getAttribute("ulogovan")!=null){
               pom = true;
           }
           %>             
        <nav class="navbar navbar-inverse">
         <div class="container-fluid">
           <div class="navbar-header">
             <a class="navbar-brand" href="index.jsp">Hotelske rezervacije</a>
           </div>
           <ul class="nav navbar-nav navbar-right">
             <li class="dropdown">
               <a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1
               <span class="caret"></span></a>
               <ul class="dropdown-menu">
                 <li><a href="#">Page 1-1</a></li>
                 <li><a href="#">Page 1-2</a></li>
                 <li><a href="#">Page 1-3</a></li>
               </ul>
             </li>
            <%
                if (!pom){%>
               
                  <li><a href="Registracija.jsp">Registruj se</a></li>
                  <li>  <a  data-toggle="modal" data-target="#exampleModal">
                    Prijavi se
                      </a> </li>
                  
                    <%   } 
                else {%>
                     <li><a href="Logout">Odjavi se</a></li>
                 <%   } 
                  %>
                
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Prijava</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <form action="Login" method="post">
                        <div class="modal-body">
                            <div class="input-group mb-3">
                              <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1">Korisničko ime: </span>
                              </div>
                              <input name="username" type="text" class="form-control" placeholder="Korisničko ime" aria-label="Username" aria-describedby="basic-addon1">
                            </div>
                             <div class="input-group mb-3">
                              <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1">Lozinka:  </span>
                              </div>
                              <input name="password" type="password" class="form-control" placeholder="Lozinka" aria-label="Password" aria-describedby="basic-addon1">
                            </div>
                        </div>
                        <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Zatvori</button>
                        <button type="submit" class="btn btn-primary">Prijavi  se</button>
                      </form>
                      </div>
                    </div>
                  </div>
                </div>              
           </ul>
         </div>
       </nav>
       
                  
                  
       
       
   </body>


</html>