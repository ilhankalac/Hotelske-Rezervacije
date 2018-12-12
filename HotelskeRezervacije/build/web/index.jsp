<%-- 
    Document   : index
    Created on : 10-Dec-2018, 20:09:22
    Author     : Ilhan Kalac
--%>

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
         <jsp:include page="navbar.jsp" />  
        <h1>Hello World!</h1>
        <form action="Test">
        <%
            String Ime =(String) request.getSession().getAttribute("ulogovan");
            if(request.getAttribute("prvoLogovanje")!=null) {%>
            <script type="text/javascript">
                swal("Dobrodošli  <%=Ime %>!", "Uspešno ste se ulogovali! ", "success")
                    .then(function() {
                        window.location = "index.jsp";
                    });

            </script>
             <%   }
            %>
            
        <input type="submit" value="posalji">
        </form>
    </body>
</html>
