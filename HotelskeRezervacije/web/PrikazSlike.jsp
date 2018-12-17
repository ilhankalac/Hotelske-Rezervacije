<%-- 
    Document   : PrikazSlike
    Created on : 17-Dec-2018, 19:33:46
    Author     : Ilhan Kalac
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
         <%
            Class.forName("com.mysql.jdbc.Driver");
            String URL =  "jdbc:mysql://localhost:3306/hotelskerezervacije", USER = "root", PASS = "";
            Connection con = DriverManager.getConnection(URL, USER, PASS);
            
            Statement stmt;
            try {
                stmt = con.createStatement();
                byte[] imgData = null;
                ResultSet rs = stmt.executeQuery("select fotografija from hotel where id = " + request.getParameter("hotelID"));
                while (rs.next()) 
                {
                    Blob image = rs.getBlob(1);
                    imgData = image.getBytes(1,(int)image.length());
                }
                response.setContentType("image/jpg");
                OutputStream o = response.getOutputStream();
                o.write(imgData);
                o.flush();
                o.close();
              
        
                } catch (SQLException ex) {
                   
                }
            
        
        %>
    </body>
</html>
