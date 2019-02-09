<%-- 
    Document   : navbar2
    Created on : 08-Feb-2019, 18:33:23
    Author     : Ilhan Kalac
--%>

<%@page import="Models.Klijent"%>
<%@page import="RepoPattern.KlijentRepo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.1.0/css/all.css">
        <script src="jQuery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"> 
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

    </head>
    <style>
        * {
            margin:0px;
            padding:0px;
            box-sizing:border-box;
            font-family:"Bree Serif",sans-serif;
        }
        body {
            overflow:hidden;
        }
        #sidebar {
            position:fixed;
            top:0px;
            left:0px;
            width:190px;
            height:100vh;
            background:#1a1a1a;
            text-align:center;
            transform-origin:left;
            transform:perspective(1200px) rotateY(90deg);
            transition:all 400ms ease;
            background: rgba(0,0,0,0.9);

        }
        #sidebar ul li {
            color:#ccc;
            font-size:20px;
            width:100%;
            height:50px;
            border-bottom:1px solid #222222;
            line-height:50px;
        }
        #sidebar.active {
            transform:perspective(1200px) rotateY(0deg);
        }



        #toggle-btn {
            position:fixed;
            left:30px;
            top:20px;
            transition:left 200ms linear 0ms,transform 300ms ease 100ms;
        }
        #toggle-btn.active {
            left:230px;
            transform:rotate(360deg);
        }
        #toggle-btn span {
            position:relative;
            top:0px;
            display:block;
            background:#1a1a1a;
            width:30px;
            height:5px;
            margin:5px 0px;
            cursor:pointer;
            transition:transform 300ms ease 200ms;
        }
        #toggle-btn.active span:nth-child(1) {
            top:10px;
            transform:rotate(45deg);
        }
        #toggle-btn.active span:nth-child(2) {
            opacity:0;
        }
        #toggle-btn.active span:nth-child(3) {
            top:-10px;
            transform:rotate(-45deg);
        }
        .background-image {
            position: fixed;
            background-image: url( 'https://i.pinimg.com/originals/5a/56/e2/5a56e2b738b455a3197caac74fd6f727.jpg' );
            background-repeat: no-repeat;
            background-size: cover;
            width: 100%;
            height: 100%;
            filter:blur(px);
            z-index: -1;

        } 
    </style>
    <body style = "font-family:roboto;font-size:16px;" >
        <div class="background-image"></div>
        <%
            Boolean pom = false;
            if (request.getSession().getAttribute("ulogovan") != null) {
                pom = true;
            }
        %>     





        <div id="sidebar">
            <ul>




                <%
                    if ((request.getSession().getAttribute("ulogovan")) != null) {%>
                <li>
                    <% Klijent UlogovanKlijent = new KlijentRepo().selectByUsername("" + request.getSession().getAttribute("ulogovan"));%>
                    <a style="color:white;" class="btn" href="${pageContext.request.contextPath}/EditKlijent.jsp?Klijent_Id=<%=UlogovanKlijent.getKlijentId()%>"> Profil</a>
                </li> 
                <%}
                %>
                <%if (pom) {%>

                <li> <a style=" color:white;" class="btn" href="Hoteli.jsp">Početna</a></li>
                    <%
                        String ulogovanaRola = "";
                        if (request.getSession().getAttribute("UlogovanaRola") != null) {
                            ulogovanaRola = "" + request.getSession().getAttribute("UlogovanaRola");
                        }

                        if (ulogovanaRola.equals("2") || ulogovanaRola.equals("3")) {%>

                <li>
                    <a style="color:white" class="btn dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Dodatne opcije
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">

                        <%
                            if (ulogovanaRola.equals("2")) {
                                {%> 
                        <a class="dropdown-item" href="KreiranjeHotela.jsp">Kreiraj hotel</a>
                        <a class="dropdown-item" href="Klijenti.jsp">Svi korisnici</a>

                        <%}
                            }
                            if (ulogovanaRola.equals("3")) {
                                {%> 
                        <a class="dropdown-item" href="EditHotel.jsp?Hotel_Id=<%= request.getSession().getAttribute("HotelId")%>">Upravljanje hotelom</a>
                        <%}
                            }
                        %>
                        <a class="dropdown-item" href="Rezervacije.jsp">Sve rezervacije</a>

                    </div>
                </li>
                <% } %>

                <%}
                %>


                <% if (!pom) { %>
                <li><a class="btn" style=" color:white;" href="Registracija.jsp">Registruj se</a></li>
                <li><a class="btn" style=" color:white;" href="" data-toggle="modal" data-target="#exampleModal" >Prijavi se <i class="fas fa-sign-in-alt"></i></a></li>
                        <% } else {
                        %>
                <li>
                    <%  String brojPoenaKlijenta = "0";
                        if (request.getSession().getAttribute("BrojPoenaKlijenta") != null) {
                            brojPoenaKlijenta = "" + request.getSession().getAttribute("BrojPoenaKlijenta");
                        }%>
                    <a class="btn" href="#">  <i class="fas fa-coins "></i> <%=brojPoenaKlijenta%> poena</a>
                </li>
                <li>   <a class="btn" style=" color:red;" href="Logout">Odjavi se <i class="fas fa-sign-out-alt"></i> </a></li>
                    <% } %>
            </ul>
        </div>
        <div id="toggle-btn" onclick="toggleSidebar(this)">
            <span></span>
            <span></span>
            <span></span>
        </div>
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
                                    <span class="input-group-text" id="basic-addon1" for="validationServer03">Korisničko ime: </span>
                                </div>
                                <input required name="username" type="text" class="form-control" placeholder="Korisničko ime" aria-label="Username" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1">Lozinka: </span>
                                </div>
                                <input required name="password" type="password" class="form-control" placeholder="Lozinka" aria-label="Password" aria-describedby="basic-addon1">
                                <%
                                    String loginGreska = "" + request.getAttribute("prvoLogovanje");
                                    if (loginGreska != null)
                                        if (loginGreska.equals("False")) {%>
                                <div class="invalid-feedback">
                                    Pogresan unos podataka !
                                </div>
                                <%}
                                %> 
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Zatvori</button>
                            <button type="submit" class="btn btn-primary">Prijavi  se </button>
                    </form>
                </div>
            </div>
        </div>
    </div> 



</body>
</html>

<script>

    function toggleSidebar(ref) {
        ref.classList.toggle('active');
        document.getElementById('sidebar').classList.toggle('active');
    }
</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>