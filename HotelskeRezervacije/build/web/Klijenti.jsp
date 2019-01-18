<%-- 
    Document   : Klijenti
    Created on : 14-Dec-2018, 21:37:19
    Author     : Ilhan Kalac
--%>

<%@page import="RepoPattern.KlijentRepo"%>
<%@page import="Models.Klijent"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="navbar.jsp" /> 
        <title>Klijenti</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="jQuery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"> 
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#Tabela').DataTable();
            });
        </script>

    </head>
    <style>
        .table-hover thead tr:hover th, .table-hover tbody tr:hover td {
            color: black;
            background-color: lightgrey;

        }      
    </style>
    <body>

        <%
            if (request.getSession().getAttribute("UlogovanaRola") != null) {
                if (!request.getSession().getAttribute("UlogovanaRola").equals("2")) {
                    response.sendRedirect("index.jsp");
                }
            } else {
                response.sendRedirect("index.jsp");
            }


        %>



        <div>
            <table id="Tabela" class="display" style="width:90%; background-color: #32383e; color:black;  font-family: Roboto;">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Ime</th>
                        <th scope="col">Prezime</th>
                        <th scope="col">Korisničko ime</th>
                        <th scope="col">E-mail</th>
                        <th scope="col">Telefon</th>
                        <th scope="col">Adresa</th>
                        <th scope="col">Država</th>
                        <th scope="col">Grad</th>
                        <th scope="col">Rola</th> 
                        <th scope="col">Poeni</th>                      
                        <th scope="col">Postanski Broj</th>
                        <th scope="col">Opcije</th>
                    </tr>
                </thead>
                <tbody>
                    <%             int i = 1;
                        for (Klijent klijent : new KlijentRepo().lista()) {
                            String Rola = "";
                            if (klijent.getRola().equals("1")) {
                                Rola = "Klijent";
                            } else if (klijent.getRola().equals("2")) {
                                Rola = "Administrator";
                            } else {
                                Rola = "Menadžer hotela";
                                }
                                {%>


                    <tr>
                        <td> <%= i++%> </td>
                        <td><%=klijent.getIme()%> </td>
                        <td><%=klijent.getPrezime()%> </td>
                        <td><%=klijent.getKIme()%> </td>
                        <td><%=klijent.getEmail()%> </td>
                        <td><%=klijent.getTelefon()%> </td>
                        <td><%=klijent.getAdresa()%> </td>
                        <td><%=klijent.getDrzava()%> </td>
                        <td><%=klijent.getGrad()%> </td>
                        <td><%=Rola%> </td>
                        <td><%=klijent.getPoeni()%> </td>
                        <td><%=klijent.getPostanskiBroj()%> </td>
                        <td> 

                            <a class="delete_link"
                               href="${pageContext.request.contextPath}/EditKlijent.jsp?Klijent_Id=<%= klijent.getKlijentId()%>" >
                                <i class="fa fa-trash"> Izmeni</i>                                  
                            </a>
                            <a class="delete_link" style="color:red"
                               href="${pageContext.request.contextPath}/Klijenti?Klijent_Id=<%= klijent.getKlijentId()%>" >
                                <i class="fa fa-trash"> Obriši</i>                                  
                            </a>
                        </td>
                    </tr>

                    <%}
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
