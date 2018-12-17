<%-- 
    Document   : Hoteli
    Created on : 16-Dec-2018, 21:52:48
    Author     : Ilhan Kalac
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hoteli</title>
    </head>
      <link rel="stylesheet" type="text/css" href="theme.css">
    <body>
        <jsp:include page="navbar.jsp" />  
        <%
             
            Class.forName("com.mysql.jdbc.Driver");
            String URL =  "jdbc:mysql://localhost:3306/hotelskerezervacije", USER = "root", PASS = "";
            Connection con = DriverManager.getConnection(URL, USER, PASS);
            String id,Naziv, Adresa, Grad, Drzava = "";
            int brojZvezdica = 0;
            Statement stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select id,naziv,brojZvezdica, Drzava, Grad, Adresa from hotel");
            while (rs.next()) 
           {
               id = rs.getString("id");
               Naziv = rs.getString("Naziv");
               Adresa = rs.getString("Adresa");
               brojZvezdica = rs.getInt("BrojZvezdica");
               Drzava = rs.getString("Drzava");
               Grad = rs.getString("Grad");
               {%>

                <div class="card" style="width: 18rem;">
                    <img height="90px" width="160px" src="PrikazSlike.jsp?hotelID=<%=id%>" /> 
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text"><%=Naziv%>.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                  </div>
               </div>      
               <%}
               
           }
        
        %>
    </body>
</html>
